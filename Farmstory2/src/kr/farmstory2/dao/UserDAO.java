package kr.farmstory2.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import kr.famstory2.config.DBConfig;
import kr.famstory2.config.SQL;
import kr.farmstory2.vo.TermsVO;

public class UserDAO {
	
	// ΩÃ±€≈Ê ∞¥√º
	private static UserDAO instance = new UserDAO();
	
	public static UserDAO getInstance() {
		return instance;
	}
	
	private UserDAO() {}
	
	
	
	public TermsVO getTerms() throws Exception {
		Connection conn = DBConfig.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(SQL.SELECT_TERMS);
		
		TermsVO vo = new TermsVO();
		
		if(rs.next()) {
			vo.setTerms(rs.getString(1));
			vo.setPrivacy(rs.getString(2));
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return vo;
	}
	
	public void registUser() throws Exception {}
	public void checkUid() throws Exception {}
	public void login() throws Exception {}
	
}
