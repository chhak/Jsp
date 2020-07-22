package kr.jboard2.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.jboard2.bean.ArticleBean;
import kr.jboard2.bean.FileBean;
import kr.jboard2.config.DBConfig;
import kr.jboard2.config.SQL;
import kr.jboard2.controller.CommonService;

public class ViewService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String seq = req.getParameter("seq");
		
		// 1, 2단계
		Connection conn = DBConfig.getConnection();
		
		// 3단계
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_ARTICLE);
		psmt.setString(1, seq);
		
		// 4단계
		ResultSet rs = psmt.executeQuery();
		
		// 5단계
		ArticleBean article = new ArticleBean();
		FileBean fileBean = new FileBean();
		if(rs.next()) {			
			article.setSeq(rs.getInt(1));
			article.setParent(rs.getInt(2));
			article.setComment(rs.getInt(3));
			article.setCate(rs.getString(4));
			article.setTitle(rs.getString(5));
			article.setContent(rs.getString(6));
			article.setFile(rs.getInt(7));
			article.setHit(rs.getInt(8));
			article.setUid(rs.getString(9));
			article.setRegip(rs.getString(10));
			article.setRdate(rs.getString(11));
			fileBean.setSeq(rs.getInt(12));
			fileBean.setParent(rs.getInt(13));
			fileBean.setOldName(rs.getString(14));
			fileBean.setNewName(rs.getString(15));
			fileBean.setDownload(rs.getInt(16));
			fileBean.setRdate(rs.getString(17));		
			article.setFileBean(fileBean);
		}
		
		// 6단계
		rs.close();
		psmt.close();
		conn.close();
		
		// view.jsp 에서 데이터를 출력하기 위해 request영역에 저장
		req.setAttribute("article", article);
		
		
		return "/view.jsp";
	}

}
