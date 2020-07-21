package kr.jboard2.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.jboard2.config.DBConfig;
import kr.jboard2.config.SQL;
import kr.jboard2.controller.CommonService;

public class WriteService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		if(req.getMethod().equals("POST")) {
		
			// 파라미터 수신
			String title   = req.getParameter("title");
			String content = req.getParameter("content");
			String uid     = req.getParameter("uid");
			String regip   = req.getRemoteAddr();
			
			// 1, 2단계
			Connection conn = DBConfig.getConnection();
			
			// 3단계
			PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setInt(3, 0);
			psmt.setString(4, uid);
			psmt.setString(5, regip);
			
			// 4단계
			psmt.executeUpdate();
			
			// 5단계
			// 6단계
			psmt.close();
			conn.close();
			
			// 리다이렉트
			return "redirect:/Jboard2/list.do";
			
		}else {
			
			return "/write.jsp";
		}
		
		
	}

}
