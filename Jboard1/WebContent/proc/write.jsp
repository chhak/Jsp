<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@page import="kr.co.jboard1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.config.DBConfig"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 파라미터 수신
	request.setCharacterEncoding("utf-8");
	
	String title   = request.getParameter("title");
	String content = request.getParameter("content");
	String regip   = request.getRemoteAddr();
	
	// 세션에서 사용자 정보객체 구하기
	MemberBean mb = (MemberBean) session.getAttribute("member");
	
	// 1, 2단계
	Connection conn = DBConfig.getConnection();
	
	// 3단계
	PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
	psmt.setString(1, title);
	psmt.setString(2, content);
	psmt.setString(3, mb.getUid());
	psmt.setString(4, regip);
	
	// 4단계
	psmt.executeUpdate();
	
	// 5단계
	// 6단계
	psmt.close();
	conn.close();
	
	// 리다이렉트
	response.sendRedirect("/Jboard1/list.jsp");
%>





