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
			// 1단계
			// 2단계
			// 3단계
			// 4단계
			// 5단계
			// 6단계
			return "redirect:/Ch18/user/list.do";
			
		}else {
			return "/user/register.jsp";	
		}		
	}
}



















