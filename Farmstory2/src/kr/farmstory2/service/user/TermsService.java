package kr.farmstory2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.famstory2.config.DBConfig;
import kr.farmstory2.controller.CommonService;
import kr.farmstory2.dao.UserDAO;
import kr.farmstory2.vo.TermsVO;

public class TermsService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		UserDAO dao = UserDAO.getInstance();
		TermsVO vo = dao.getTerms();
		
		req.setAttribute("vo", vo);
		
		
		return "/user/terms.jsp";
	}

}
