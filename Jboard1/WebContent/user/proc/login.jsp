<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String uid  = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	// DB정보
	String host = "jdbc:mysql://192.168.44.46:3306/chhak";
	String user = "chhak";
	String pw   = "1234";
	
	// 1단계
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2단계
	Connection conn = DriverManager.getConnection(host, user, pw);
	
	// 3단계
	Statement stmt = conn.createStatement();
	
	// 4단계
	String sql  = "SELECT * FROM `JBOARD_MEMBER` ";
	       sql += "WHERE `uid`='"+uid+"' AND `pass`=PASSWORD('"+pass+"')";
	
	ResultSet rs = stmt.executeQuery(sql);
	       
	// 5단계
	if(rs.next()){
		// 회원일 경우
		
		session.setAttribute("uid", rs.getString(1));
		session.setAttribute("pass", rs.getString(2));
		
		
	}else{
		// 회원이 아닐 경우
		response.sendRedirect("/Jboard1/user/login.jsp?result=fail");
	}
	
	// 6단계
	
%>