package kr.jboard2.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
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
		
		String pg = req.getParameter("pg");
		
		// 페이지 관련 변수선언
		int total = getTotalArticle();
		int lastPage = getLastPage(total);
		int currentPage = getCurrentPage(pg);
		int startLimit = getStartLimit(currentPage);
		int listCount = total - startLimit;
		
		int groupCurrent = (int)Math.ceil(currentPage/10.0);
		int groupStart   = (groupCurrent - 1) * 10 + 1;
		int groupEnd     = groupCurrent * 10;
		
		if(groupEnd > lastPage) {
			groupEnd = lastPage;
		}		
		
		// 1,2단계
		Connection conn = DBConfig.getConnection();
		
		// 3단계
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_ARTICLES);
		psmt.setInt(1, startLimit);
		
		// 4단계
		ResultSet rs = psmt.executeQuery();
				
		// 5단계
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
		
		// 6단계
		rs.close();
		psmt.close();
		conn.close();
		
		// 데이터를 view에서 참조하기 위해 request 영역에 저장
		req.setAttribute("articles", articles);
		req.setAttribute("lastPage", lastPage);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("listCount", listCount);
		req.setAttribute("groupStart", groupStart);
		req.setAttribute("groupEnd", groupEnd);
		
		return "/list.jsp";
	}// requestProc end
	
	
	public int getTotalArticle() throws Exception  {
		
		// 1, 2단계
		Connection conn = DBConfig.getConnection();
		// 3단계
		Statement stmt = conn.createStatement();
		// 4단계
		ResultSet rs = stmt.executeQuery(SQL.SELECT_TOTAL_COUNT);
		// 5단계
		int total = 0;
		if(rs.next()) {
			total = rs.getInt(1);
		}
		// 6단계
		rs.close();
		stmt.close();
		conn.close();
		
		return total;
	}
	
	public int getLastPage(int total) {
		
		int lastPage = 0;
		
		if(total%10 == 0) {
			lastPage = total / 10;
		}else {
			lastPage = (total / 10) + 1;
		}
		
		return lastPage;
	}
	
	public int getStartLimit(int currentPage) {
		int startLimit = (currentPage - 1) * 10;
		return startLimit;
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
