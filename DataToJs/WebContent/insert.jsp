<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DBConfig"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String uid   = request.getParameter("uid");
	String name  = request.getParameter("name");
	String hp    = request.getParameter("hp");
	String pos   = request.getParameter("pos");
	String dep   = request.getParameter("dep");
	String rdate = request.getParameter("rdate");

	Connection conn = DBConfig.getConnection();
	Statement stmt = conn.createStatement();
	
	
	String sql  = "INSERT INTO `MEMBER` SET ";
		   sql += "`uid`='"+uid+"', ";
		   sql += "`name`='"+name+"', ";
		   sql += "`hp`='"+hp+"', ";
		   sql += "`pos`='"+pos+"', ";
		   sql += "`dep`="+dep+", ";
		   sql += "`rdate`='"+rdate+"';";
		   
	// INSERT 성공시 리턴값 1
	int result = stmt.executeUpdate(sql);
	
	stmt.close();
	conn.close();
	
	JsonObject json = new JsonObject();
	json.addProperty("result", result);

	out.println(json);	
%>
