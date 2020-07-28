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
		
		String group = req.getParameter("group");
		String cate  = req.getParameter("cate");
		String pg    = req.getParameter("pg");
		
		// 페이지 관련 변수선언
		int total = getTotal(cate);
		int lastPage = getLastPage(total);
		int currentPage = getCurrentPage(pg);
		int startLimit = getStartLimit(currentPage);
		int listCount = total - startLimit;
		
		int groupCurrent = (int)Math.ceil(currentPage/10.0);
		int groupStart = (groupCurrent - 1) * 10 + 1;
		int groupEnd = groupCurrent * 10;
		
		if(groupEnd > lastPage) {
			groupEnd = lastPage;
		}
				
		BoardDAO dao = BoardDAO.getInstance();
		List<ArticleVO> articles = dao.getArticles(cate, startLimit);
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		req.setAttribute("articles", articles);
		req.setAttribute("lastPage", lastPage);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("listCount", listCount);
		req.setAttribute("groupStart", groupStart);
		req.setAttribute("groupEnd", groupEnd);
		
		return "/board/list.jsp";
	} // requestProc end
	
	public int getTotal(String cate) throws Exception {
		return BoardDAO.getInstance().getTotalArticle(cate);
	}
	
	public int getLastPage(int total) {
		int lastPage = 0;
		
		if(total % 10 == 0) {
			lastPage = total / 10;
		}else {
			lastPage = total / 10 + 1;
		}
		
		return lastPage;
	}
	
	public int getStartLimit(int currentPage) {
		return (currentPage-1)*10;
	}
	
	public int getCurrentPage(String pg) {
		
		int currentPage = 0;
		
		if(pg == null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(pg);
		}
		
		return currentPage;
	}
}
