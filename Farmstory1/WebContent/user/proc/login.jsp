<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory1.config.SQL"%>
<%@page import="kr.co.farmstory1.bean.MemberBean"%>
<%@page import="kr.co.farmstory1.config.DBConfig"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String uid  = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	// 1, 2단계
	Connection conn = DBConfig.getConnection();
	
	// 3단계
	PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_MEMBER);
	psmt.setString(1, uid);
	psmt.setString(2, pass);
	
	// 4단계
	ResultSet rs = psmt.executeQuery();
	       
	// 5단계
	if(rs.next()){
		// 회원일 경우
		MemberBean mb = new MemberBean();
		mb.setUid(rs.getString(1));
		mb.setPass(rs.getString(2));
		mb.setName(rs.getString(3));
		mb.setNick(rs.getString(4));
		mb.setEmail(rs.getString(5));
		mb.setHp(rs.getString(6));
		mb.setGrade(rs.getInt(7));
		mb.setZip(rs.getString(8));
		mb.setAddr1(rs.getString(9));
		mb.setAddr2(rs.getString(10));
		mb.setRegip(rs.getString(11));
		mb.setRdate(rs.getString(12));
		
		// 세션에 사용자 정보객체 저장
		session.setAttribute("member", mb);
		
		// 리스트 이동
		response.sendRedirect("/Farmstory1");
		
	}else{
		// 회원이 아닐 경우 다시 로그인 이동
		response.sendRedirect("/Farmstory1/user/login.jsp?result=fail");
	}
	
	// 6단계
	rs.close();
	psmt.close();
	conn.close();	
%>