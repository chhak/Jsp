package kr.farmstory2.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.farmstory2.controller.CommonService;
import kr.farmstory2.dao.BoardDAO;
import kr.farmstory2.vo.ArticleVO;

public class CommentService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String group   = req.getParameter("group");
		String parent  = req.getParameter("parent");
		String cate    = req.getParameter("cate");
		String comment = req.getParameter("comment");
		String uid 	   = req.getParameter("uid");
		String regip   = req.getRemoteAddr();
		
		ArticleVO vo = new ArticleVO();
		vo.setParent(Integer.parseInt(parent));
		vo.setCate(cate);
		vo.setContent(comment);
		vo.setUid(uid);
		vo.setRegip(regip);
		
		BoardDAO dao = BoardDAO.getInstance();
		int result = dao.insertComment(vo);
		
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		return "json:"+json.toString();
	}

}

