<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>11-1</title>
</head>
<body>
	<h3>1.표현언어(Expression Language)</h3>
	<%
		String name = "홍길동";
		int num1 = 1;
		int num2 = 2;
		
		// 표현언어에서 출력을 위한 내장객체 값 설정
		pageContext.setAttribute("name", name);
		request.setAttribute("num1", num1);
		session.setAttribute("num2", num2);
		
	%>
	<h4>표현식</h4>
	<ul>
		<li>name : <%= name %></li>
		<li>num1 : <%= num1 %></li>
		<li>num2 : <%= num2 %></li>
		<li>num1 + num2 : <%= num1 + num2 %></li>
	</ul>
	
	<h4>표현언어</h4>
	<ul>
		<li>name : ${name}</li>
		<li>num1 : ${num1}</li>
		<li>num2 : ${num2}</li>
		<li>num1 + num2 : ${num1+num2}</li>
	</ul>
	
	

</body>
</html>






