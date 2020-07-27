package kr.farmstory2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.farmstory2.controller.CommonService;
import kr.farmstory2.dao.UserDAO;
import kr.farmstory2.vo.MemberVO;

public class LoginService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		if(req.getMethod().equals("POST")) {
			
			String uid = req.getParameter("uid");
			String pass = req.getParameter("pass");
			
			UserDAO dao = UserDAO.getInstance();
			MemberVO vo = dao.login(uid, pass);
			
			if(vo != null) {
				// 회원일 경우 세션처리
				HttpSession sess = req.getSession();
				sess.setAttribute("member", vo);
				
				return "redirect:/Farmstory2/index.do";
			}else {
				// 회원 아닐 경우
				return "redirect:/Farmstory2/user/login.do";
			}			
			
		}else {
			return "/user/login.jsp";	
		}	
		
		
	}

}
