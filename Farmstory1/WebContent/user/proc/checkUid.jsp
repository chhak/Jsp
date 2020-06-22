<%@page import="kr.co.farmstory1.config.SQL"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory1.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	
	Connection conn = DBConfig.getConnection();
	PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_CHECK_UID);
	psmt.setString(1, uid);
	
	ResultSet rs = psmt.executeQuery();
	
	int result = 0;
	
	if(rs.next()){
		result = rs.getInt(1);	
	}
	
	rs.close();
	psmt.close();
	conn.close();
	
	// Json 생성
	//JsonObject json = new JsonObject();
	//json.addProperty("result", result);
	
	// Json 출력
	out.print(result);	
%>
