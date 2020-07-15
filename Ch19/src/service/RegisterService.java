package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(req.getMethod().equals("POST")) {
			
			String name = req.getParameter("name");
			String addr = req.getParameter("addr");
			String hp   = req.getParameter("hp");
			
			req.setAttribute("name", name);
			req.setAttribute("addr", addr);
			req.setAttribute("hp", hp);
			
			return "/result.jsp";
			
		}else {
			return "/register.jsp";	
		}		
		
		
	}
}










