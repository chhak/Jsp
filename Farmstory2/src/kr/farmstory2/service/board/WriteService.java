package kr.farmstory2.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.farmstory2.controller.CommonService;
import kr.farmstory2.dao.BoardDAO;
import kr.farmstory2.vo.ArticleVO;

public class WriteService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		if(req.getMethod().equals("POST")) {
			
			String cate    = req.getParameter("cate");
			String uid     = req.getParameter("uid");
			String title   = req.getParameter("title");
			String content = req.getParameter("content");
			String fname   = req.getParameter("fname");
			String regip = req.getRemoteAddr();
			int file = (fname.isEmpty()) ? 0 : 1;
			
			ArticleVO vo = new ArticleVO();
			vo.setCate(cate);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setFile(file);
			vo.setUid(uid);
			vo.setRegip(regip);
						
			BoardDAO dao = BoardDAO.getInstance();
			dao.insertArticle(vo);
			
			return "redirect:/Farmstory2/board/list.do";
			
		}else {
			
			String group = req.getParameter("group");
			String cate  = req.getParameter("cate");
			
			req.setAttribute("group", group);
			req.setAttribute("cate", cate);
			
					
			return "/board/write.jsp";	
		}
		
		
		
	}

}
