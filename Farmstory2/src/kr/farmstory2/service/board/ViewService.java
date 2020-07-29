package kr.farmstory2.service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.farmstory2.controller.CommonService;
import kr.farmstory2.dao.BoardDAO;
import kr.farmstory2.vo.ArticleVO;

public class ViewService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String group = req.getParameter("group");
		String cate  = req.getParameter("cate");
		String seq   = req.getParameter("seq");
		
		
		BoardDAO dao = BoardDAO.getInstance();
		ArticleVO vo = dao.getArticle(seq);
		List<ArticleVO> comments = dao.getComments(seq);
		
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		req.setAttribute("vo", vo);
		req.setAttribute("comments", comments);
		
		return "/board/view.jsp";
	}

}
