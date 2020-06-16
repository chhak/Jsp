<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String seq = request.getParameter("seq");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일없음</title>
</head>
<body>
	<h1>파일이 없습니다.</h1>
	<p>관리자에게 문의하시기 바랍니다.</p>
	<a href="/Jboard1/view.jsp?seq=<%= seq %>">돌아가기</a>
</body>
</html>