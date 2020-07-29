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
import kr.farmstory2.vo.FileVO;

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
	
	public ArticleVO getArticle(String seq) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_ARTICLE);
		psmt.setString(1, seq);
		
		ResultSet rs = psmt.executeQuery();
		
		ArticleVO vo = new ArticleVO();
		FileVO fv = new FileVO();
		
		if(rs.next()) {
			
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
			vo.setRdate(rs.getString(11));
			
			fv.setSeq(rs.getInt(12));
			fv.setParent(rs.getInt(13));
			fv.setOldName(rs.getString(14));
			fv.setNewName(rs.getString(15));
			fv.setDownload(rs.getInt(16));
			fv.setRdate(rs.getString(17));		
			vo.setFv(fv);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return vo;		
	}
	
	public int insertComment(ArticleVO vo) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_COMMENT);
		psmt.setInt(1, vo.getParent());
		psmt.setString(2, vo.getCate());
		psmt.setString(3, vo.getContent());
		psmt.setString(4, vo.getUid());
		psmt.setString(5, vo.getRegip());

		int result = psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
		return result;
	}
	
	public List<ArticleVO> getComments(String parent) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_COMMENTS);
		psmt.setString(1, parent);
		
		ResultSet rs = psmt.executeQuery();
		List<ArticleVO> comments = new ArrayList<>();
		
		while(rs.next()) {
			ArticleVO comment = new ArticleVO();
			
			comment.setSeq(rs.getInt(1));
			comment.setContent(rs.getString(6));
			comment.setUid(rs.getString(9));
			comment.setRegip(rs.getString(10));
			comment.setRdate(rs.getString(11));
			comment.setNick(rs.getString(12));
			
			comments.add(comment);
		}
		
		rs.close();
		psmt.close();
		conn.close();
		
		return comments;		
	}
	
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
