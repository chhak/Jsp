package kr.farmstory2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import kr.famstory2.config.DBConfig;
import kr.famstory2.config.SQL;
import kr.farmstory2.vo.ArticleVO;

public class BoardDAO {
	
	public static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	private BoardDAO() {}

	public void getArticles() throws Exception {}
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
