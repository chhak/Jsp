<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid  = request.getParameter("uid");
	String pass = request.getParameter("pass");

	// 1단계
	// 2단계
	// 3단계
	// 4단계
	// 5단계
	// 6단계
	
	if(uid.equals("abcd") && pass.equals("1234")){
		// 회원일 경우
		session.setAttribute("uid", uid);
		session.setAttribute("pass", pass);
		
		response.sendRedirect("./loginSuccess.jsp");
		
	}else{
		// 회원일 아닐경우
		response.sendRedirect("./login.jsp?result=fail");
	}
	
%>





