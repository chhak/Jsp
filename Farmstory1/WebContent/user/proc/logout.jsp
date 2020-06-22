<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 세션 정보 초기화
	session.invalidate();

	// 메인으로 이동
	response.sendRedirect("/Farmstory1");
%>