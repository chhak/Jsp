package kr.jboard2.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.jboard2.bean.ArticleBean;
import kr.jboard2.config.DBConfig;
import kr.jboard2.config.SQL;
import kr.jboard2.controller.CommonService;

public class ListService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		// 1,2�ܰ�
		Connection conn = DBConfig.getConnection();
		
		// 3�ܰ�
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_ARTICLES);
		psmt.setInt(1, 0);
		
		// 4�ܰ�
		ResultSet rs = psmt.executeQuery();
				
		// 5�ܰ�
		List<ArticleBean> articles = new ArrayList<>();
		while (rs.next()) {
			ArticleBean article = new ArticleBean();
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
			article.setNick(rs.getString(12));
			
			articles.add(article);
		}
		
		// 6�ܰ�
		rs.close();
		psmt.close();
		conn.close();
		
		// �����͸� view���� �����ϱ� ���� request ������ ����
		req.setAttribute("articles", articles);
		
		
		return "/list.jsp";
	}

}
