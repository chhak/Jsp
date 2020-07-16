<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>10-2</title>
	</head>
	<body>
		<h3>2.세션 확인</h3>
		<%
			String name = (String)session.getAttribute("NAME");
			String id   = (String)session.getAttribute("ID");			
		%>
		<p>세션 NAME : <%= name %></p>
		<p>세션 ID   : <%= id %></p>
		
	</body>
</html>




