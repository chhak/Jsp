package kr.farmstory2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.famstory2.config.DBConfig;
import kr.famstory2.config.SQL;
import kr.farmstory2.vo.ArticleVO;

public class BoardDAO {
	
	public static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	private BoardDAO() {}
	
	public int getTotalArticle(String cate) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_TOTAL_COUNT);
		psmt.setString(1, cate);
		
		ResultSet rs = psmt.executeQuery();
		
		int total = 0;
		if(rs.next()) {
			total = rs.getInt(1);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return total;
	}

	public List<ArticleVO> getArticles(String cate, int start) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_ARTICLES);
		psmt.setString(1, cate);
		psmt.setInt(2, start);
		
		ResultSet rs = psmt.executeQuery();
		
		List<ArticleVO> articles = new ArrayList<>();
		while(rs.next()) {
			ArticleVO vo = new ArticleVO();
			vo.setSeq(rs.getInt(1));
			vo.setParent(rs.getInt(2));
			vo.setComment(rs.getInt(3));
			vo.setCate(rs.getString(4));
			vo.setTitle(rs.getString(5));
			vo.setContent(rs.getString(6));
			vo.setFile(rs.getInt(7));
			vo.setHit(rs.getInt(8));
			vo.setUid(rs.getString(9));
			vo.setRegip(rs.getString(10));
			vo.setRdate(rs.getString(11).substring(2, 10));
			vo.setNick(rs.getString(12));
			articles.add(vo);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return articles;		
	}
	
	public void getArticle() throws Exception {}
	
	public void getComments() throws Exception {}
	
	public void insertArticle(ArticleVO vo) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
		psmt.setString(1, vo.getCate());
		psmt.setString(2, vo.getTitle());
		psmt.setString(3, vo.getContent());
		psmt.setInt(4, vo.getFile());
		psmt.setString(5, vo.getUid());
		psmt.setString(6, vo.getRegip());
		
		psmt.executeUpdate();
		psmt.close();
		conn.close();		
	}
	
	public void deleteArticle() throws Exception {}
	public void modifyArticle() throws Exception {}
}
