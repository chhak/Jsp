<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2-3</title>
</head>
<body>
	<h3>3.JSP 반복문</h3>
	
	<h4>for</h4>
	<%
		for(int i=1 ; i<=5 ; i++){
			out.println("<h4>Hello JSP!!!</h4>");
		}
	%>
	
	<h4>while</h4>
	<%
		int i = 1;
		while(i <= 5){
	%>
		<h4>Hello Everybody~</h4>	
	<%
			i++;
		}
	%>
	
	<h4>구구단 표</h4>
	<table border="1">
		<tr>
			<th>2단</th>
			<th>3단</th>
			<th>4단</th>
			<th>5단</th>
			<th>6단</th>
			<th>7단</th>
			<th>8단</th>
			<th>9단</th>
		</tr>
		<% for(int x=1 ; x<=9 ; x++){ %>
		<tr>
			<% for(int y=2 ; y<=9 ; y++){ %>
			<td><%= y %> x <%= x %> = <%= y*x %></td>			
			<% } %>
		</tr>
		<% } %>		
	</table>
</body>
</html>





