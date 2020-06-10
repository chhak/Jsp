<%@page import="kr.co.jboard1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.config.DBConfig"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 파라미터 수신
	request.setCharacterEncoding("utf-8");

	String parent  = request.getParameter("parent");
	String uid     = request.getParameter("uid");
	String comment = request.getParameter("comment");
	String regip   = request.getRemoteAddr();
	
	// 1, 2단계
	Connection conn = DBConfig.getConnection();
	
	// 3단계
	PreparedStatement psmtUpdate = conn.prepareStatement(SQL.UPDATE_COMMENT_COUNT);
	psmtUpdate.setString(1, parent);
	
	
	PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_COMMENT);
	psmt.setString(1, parent);
	psmt.setString(2, comment);
	psmt.setString(3, uid);
	psmt.setString(4, regip);

	// 4단계
	psmtUpdate.executeUpdate();
	psmt.executeUpdate();
	
	// 5단계
	// 6단계
	psmtUpdate.close();
	psmt.close();
	conn.close();
	
	// 리다이렉트
	response.sendRedirect("/Jboard1/view.jsp?seq="+parent);
	
%>





