package kr.jboard2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.jboard2.controller.CommonService;

public class LogoutService implements CommonService {
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		HttpSession session = req.getSession();
		session.invalidate();
		
		return "redirect:/Jboard2/user/login.do";
	}

}
