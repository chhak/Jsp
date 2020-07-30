package kr.farmstory2.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.farmstory2.controller.CommonService;
import kr.farmstory2.dao.BoardDAO;

public class CommentModifyService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String content = req.getParameter("content");
		String seq     = req.getParameter("seq");
		
		BoardDAO dao = BoardDAO.getInstance();
		int result = dao.modifyComment(content, seq);
		
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		return "json:"+json.toString();
	}

}
