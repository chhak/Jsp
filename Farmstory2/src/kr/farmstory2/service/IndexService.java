package kr.farmstory2.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.farmstory2.controller.CommonService;
import kr.farmstory2.dao.BoardDAO;
import kr.farmstory2.vo.ArticleVO;

public class IndexService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		
		BoardDAO dao = BoardDAO.getInstance();
		
		List<ArticleVO> latestList = dao.getLatest();
		
		List<ArticleVO> latest1 = latestList.subList(0, 4);
		List<ArticleVO> latest2 = latestList.subList(5, 9);
		List<ArticleVO> latest3 = latestList.subList(10, 14);
		
		req.setAttribute("latest1", latest1);
		req.setAttribute("latest2", latest2);
		req.setAttribute("latest3", latest3);
		
		return "/index.jsp";
	}

}
