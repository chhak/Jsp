<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(true){
		// 로그인을 안했을 경우
		pageContext.forward("./user/login.jsp");
	}else{
		// 로그인을 했을 경우
		pageContext.forward("./list.jsp");
	}
%>