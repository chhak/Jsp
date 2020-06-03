<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5-5</title>
</head>
<body>
	<h3>5.JSP 내장객체 name 데이터 확인</h3>
	<%
		String name1 = (String) pageContext.getAttribute("name");
		String name2 = (String) request.getAttribute("name");
		String name3 = (String) session.getAttribute("name");
		String name4 = (String) application.getAttribute("name");	
	%>
	<p>
		pageContext 영역의 name 데이터 : <%= name1 %><br />
		requeset 영역의 name 데이터 : <%= name2 %><br />
		session 영역의 name 데이터 : <%= name3 %><br />
		application 영역의 name 데이터 : <%= name4 %><br />
	</p>
</body>
</html>