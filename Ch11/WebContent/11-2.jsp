<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>11-2</title>
</head>
<body>
	<h3>2.표현언어 기본 내장객체</h3>
	<%
		pageContext.setAttribute("name", "김유신");
		request.setAttribute("name", "김춘추");
		session.setAttribute("name", "장보고");
		application.setAttribute("name", "이순신");	
	%>
	
	<p>
		name : ${pageScope.name}<br /> 
		name : ${requestScope.name}<br />
		name : ${sessionScope.name}<br />
		name : ${applicationScope.name}<br />
	</p>

</body>
</html>






