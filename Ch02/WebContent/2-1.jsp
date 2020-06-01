<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2-1</title>
</head>
<body>
	<h3>1.JSP 변수</h3>
	<% 
		// Scriptlet : 자바코드가 실행되는 HTML영역
		int  	var1 = 1;
		boolean var2 = true;
		double 	var3 = 3.14;
		String 	var4 = "안녕하세요.";
		
		// 출력객체 out으로 직접 출력
		out.println("<h4>var1 : "+var1+"</h4>");
		out.println("<h4>var2 : "+var2+"</h4>");
	%>
	<!-- 
		표현식(Expression)으로 출력
		 - 자바 변수를 출력하는 자바코드 영역 
	-->
	<h4>var3 : <%= var3 %></h4>
	<h4>var4 : <%= var4 %></h4>
</body>
</html>


