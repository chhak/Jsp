<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3-8</title>
</head>
<body>
	<h3>8.forward 페이지</h3>
	<%
		pageContext.forward("./3-2.jsp");
	%>
</body>
</html>