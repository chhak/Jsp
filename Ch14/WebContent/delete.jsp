<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 파라미터 수신
	//1단계
	//2단계
	//3단계
	//4단계
	String sql = "DELETE FROM `MEMBER` WHERE `uid`='삭제할 id'"; 
	//5단계
	//6단계
	// 리다이렉트
	response.sendRedirect("./list.jsp");

%>