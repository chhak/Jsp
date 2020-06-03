<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5-4</title>
</head>
<body>
	<h3>4.JSP 내장객체 범위(영역)</h3>
	<%
		// 각 내장객체 영역에 값 저장
		pageContext.setAttribute("name", "김유신");
		request.setAttribute("name", "김춘추");
		session.setAttribute("name", "강감찬");
		application.setAttribute("name", "이순신");
		
		
		pageContext.forward("./5-5.jsp");		
	%>
	<h4>내장객체 영역에 name값 저장완료</h4>
	<a href="./5-5.jsp">내장객체 저장된 데이터 확인</a>
</body>
</html>



