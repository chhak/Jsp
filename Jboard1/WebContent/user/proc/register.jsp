<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid   = request.getParameter("uid");
	String pass1 = request.getParameter("pass1");
	String pass2 = request.getParameter("pass2");
	String name  = request.getParameter("name");
	String nick  = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp    = request.getParameter("hp");
	String zip   = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	
	// DB정보
	String host = "jdbc:mysql://192.168.44.46:3306/chhak";
	String user = "chhak";
	String pass = "1234";
	
	// 1단계
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2단계
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	// 3단계
	Statement stmt = conn.createStatement();
	
	// 4단계
	String sql  = "INSERT INTO `JBOARD_MEMBER` SET ";
		   sql += "``='', ";
		   sql += "``='', ";
		   sql += "``='', ";
		   sql += "``='', ";
		   sql += "``='', ";
		   sql += "``='', ";
		   sql += "``='', ";
		   sql += "``='', ";
		   sql += "``='', ";
		   sql += "``='', ";
		   sql += "``='', ";
		   sql += "``='', ";
	
	// 5단계
	// 6단계
	
	// 리다이렉트
%>