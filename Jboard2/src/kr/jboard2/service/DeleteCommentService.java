package kr.jboard2.service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.jboard2.config.DBConfig;
import kr.jboard2.config.SQL;
import kr.jboard2.controller.CommonService;

public class DeleteCommentService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String seq = req.getParameter("seq");
		String parent = req.getParameter("parent");
			
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL.DELETE_COMMENT);
		psmt.setString(1, seq);		
		
		int result = psmt.executeUpdate();
		psmt.close();
		conn.close();
		
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		
		return "json:"+json.toString();
	}

}
