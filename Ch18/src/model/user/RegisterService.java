package model.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CommonService;

public class RegisterService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(req.getMethod().equals("POST")) {
			// 1�ܰ�
			// 2�ܰ�
			// 3�ܰ�
			// 4�ܰ�
			// 5�ܰ�
			// 6�ܰ�
			return "redirect:/Ch18/user/list.do";
			
		}else {
			return "/user/register.jsp";	
		}		
	}
}


















