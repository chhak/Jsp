<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3-3</title>
</head>
<body>
	<h3>3.request 내장객체 데이터(파라미터) 수신</h3>
	<%
		// 파라미터 수신
		String uid  = request.getParameter("uid");
		String pass = request.getParameter("pass");
	%>
	<p>
		입력하신 아이디    : <%= uid %><br />
		입력하신 비밀번호 : <%= pass %><br />
	</p>
	
	<a href="./3-2.jsp">뒤로가기</a>
</body>
</html>






