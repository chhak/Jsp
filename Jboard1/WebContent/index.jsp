<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 세션에 저장된 사용자 정보객체 존재여부 확인
	MemberBean mb = (MemberBean) session.getAttribute("member");

	if(mb == null){
		// 로그인을 안했을 경우
		pageContext.forward("./user/login.jsp");
	}else{
		// 로그인을 했을 경우
		pageContext.forward("./list.jsp");
	}
%>