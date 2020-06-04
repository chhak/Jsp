<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>9-2</title>
</head>
<body>
	<h3>2.쿠키 수신하기</h3>
	<%
		Cookie[] cookies = request.getCookies();
	
		for(Cookie c : cookies){
			
			String name  = c.getName();
			String value = c.getValue();
	%>
		<p>
			쿠키명 : <%= name %><br />
			쿠키값 : <%= value %><br />
		</p>	
	<%
		}
	%>
</body>
</html>