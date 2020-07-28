package kr.farmstory2.service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.farmstory2.controller.CommonService;
import kr.farmstory2.dao.BoardDAO;
import kr.farmstory2.vo.ArticleVO;

public class ListService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String cate = req.getParameter("cate");
		
		BoardDAO dao = BoardDAO.getInstance();
		List<ArticleVO> articles = dao.getArticles(cate, 0);
		
		req.setAttribute("cate", cate);
		req.setAttribute("articles", articles);
		
		return "/board/list.jsp";
	}

}
