<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 파라미터 수신
	request.setCharacterEncoding("UTF-8");

	String uid  = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp   = request.getParameter("hp");
	String pos  = request.getParameter("pos");
	String dep  = request.getParameter("dep");

	// 데이터베이스 프로그래밍
	String host = "jdbc:mysql://192.168.44.46:3306/chhak";
	String user = "chhak";
	String pass = "1234";
	
	// 1단계 - JDBC 드라이버 로드
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2단계 - 데이터베이스 접속
	Connection conn = DriverManager.getConnection(host, user, pass);
		
	// 3단계 - SQL실행 객체 생성
	Statement stmt = conn.createStatement();
	
	// 4단계 - SQL실행
	String sql  = "INSERT INTO `MEMBER` SET ";
	       sql += "`uid`='"+uid+"', ";
	       sql += "`name`='"+name+"', ";
	       sql += "`hp`='"+hp+"', ";
	       sql += "`pos`='"+pos+"', ";
	       sql += "`dep`="+dep+", ";
	       sql += "`rdate`=NOW()";
	
	stmt.executeUpdate(sql);       
	       
	// 5단계 - 결과셋 처리(SELECT일 경우)
	
	// 6단계 - 데이터베이스 종료
	stmt.close();
	conn.close();
	
	// 리다이렉트
	response.sendRedirect("./list.jsp");
%>






