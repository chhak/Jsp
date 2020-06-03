<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5-2</title>
</head>
<body>
	<h3>2.JSP 내장객체 - pageContext</h3>
	<%
		// pageContext : 현재 jsp페이지를 의미하는 객체
		pageContext.forward("./5-1.jsp");
	%>
</body>
</html>