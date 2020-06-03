<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5-3</title>
</head>
<body>
	<h3>3.JSP 내장객체 - application</h3>
	<%
		// application : 현재 프로젝트를 실행하는 톰캣(WAS) 객체
		String info = application.getServerInfo();
		String path = application.getContextPath();
	%>
	<p>
		서버정보 : <%= info %><br />
		컨텍스트 루트(프로젝트명) : <%= path %><br />
	</p>
	
</body>
</html>






