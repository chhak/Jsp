package kr.farmstory2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import kr.famstory2.config.DBConfig;
import kr.famstory2.config.SQL;
import kr.farmstory2.vo.MemberVO;
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
	
	public void registUser(MemberVO vo) throws Exception {
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_MEMBER);
		psmt.setString(1, vo.getUid());
		psmt.setString(2, vo.getPass());
		psmt.setString(3, vo.getName());
		psmt.setString(4, vo.getNick());
		psmt.setString(5, vo.getEmail());
		psmt.setString(6, vo.getHp());
		psmt.setString(7, vo.getZip());
		psmt.setString(8, vo.getAddr1());
		psmt.setString(9, vo.getAddr2());
		psmt.setString(10, vo.getRegip());
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();		
	}
	
	public void checkUid() throws Exception {}
	
	public MemberVO login(String uid, String pass) throws Exception {
		
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_MEMBER);
		psmt.setString(1, uid);
		psmt.setString(2, pass);
		
		ResultSet rs = psmt.executeQuery();
		
		MemberVO vo = null;
		
		if(rs.next()) {
			vo = new MemberVO();
			vo.setUid(rs.getString(1));
			vo.setPass(rs.getString(2));
			vo.setName(rs.getString(3));
			vo.setNick(rs.getString(4));
			vo.setEmail(rs.getString(5));
			vo.setHp(rs.getString(6));
			vo.setGrade(rs.getInt(7));
			vo.setZip(rs.getString(8));
			vo.setAddr1(rs.getString(9));
			vo.setAddr2(rs.getString(10));
			vo.setRegip(rs.getString(11));
			vo.setRdate(rs.getString(12));
		}
		
		rs.close();
		psmt.close();
		conn.close();		
		
		return vo;
	}
	
}
