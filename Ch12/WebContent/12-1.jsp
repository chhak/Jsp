<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>12-1</title>
</head>
<body>
	<h3>1.JSTL(Java Standards Tag Library) 기본</h3>
	<h4>Scriptlet 표현</h4>
	<%
		String str = "Hello";
		out.println("<p>str :"+str+"</p>");
		
		int num1 = 1;
		int num2 = 2;
		int num3 = 3;
		
		if(num1 < num2){
			out.println("<p>num1이 num2보다 작다.</p>");
		}
		
		if(num1 > num2){
			out.println("<p>num1이 num2보다 크다.</p>");
		}else{
			out.println("<p>num1이 num2보다 작다.</p>");
		}
		
		if(num1 > num2){
			out.println("<p>num1이 num2보다 크다.</p>");
		}else if(num2 > num3){
			out.println("<p>num2이 num3보다 크다.</p>");
		}else{
			out.println("<p>num3 가장 크다.</p>");
		}
		
		for(int i=1 ; i<=5 ; i++){
			out.println("<p>"+i+".Hello JSTL!</p>");			
		}
		
		String[] people = {"김유신", "김춘추", "장보고", "강감찬", "이순신"};
		
		for(String person : people){
			out.print("<i>"+person+"</i>, ");
		}
		
		int sum = 0;
		
		for(int k=1 ; k<=10 ; k++){
			sum += k;
		}
		
		out.println("<p>1부터 10까지 합 : "+sum+"</p>");
		
	%>
	
	<h4>JSTL 표현</h4>
	<c:set var="str" value="Hello" />
	<p>str : ${str}</p>
	
	<c:set var="num1" value="1" />
	<c:set var="num2" value="2" />
	<c:set var="num3" value="3" />
	
	<c:if test="${num1 lt num2}">
		<p>num1이 num2보다 작다.</p>
	</c:if>
	
	<c:choose>
		<c:when test="${num1 > num2}">
			<p>num1이 num2보다 크다.</p>
		</c:when>
		<c:otherwise>
			<p>num1이 num2보다 작다.</p>
		</c:otherwise>	
	</c:choose>
	
	<c:choose>
		<c:when test="${num1 gt num2}">
			<p>num1이 num2보다 크다.</p>
		</c:when>
		<c:when test="${num2 gt num3}">
			<p>num2이 num3보다 크다.</p>
		</c:when>
		<c:otherwise>
			<p>num3가 가장 크다.</p>
		</c:otherwise>	
	</c:choose>
	
	<c:forEach var="i" begin="1" end="5">
		<p>${i}.Hello JSTL!</p>		
	</c:forEach>
	
	<c:set var="people">김유신, 김춘추, 장보고, 강감찬, 이순신</c:set>
	<c:forEach var="person" items="${people}">
		<i>${person},</i>
	</c:forEach>
	
	<c:set var="sum" value="0" />
	<c:forEach var="k" begin="1" end="10">
		<c:set var="sum" value="${sum + k}"/>			
	</c:forEach>
	
	<p>1부터 10까지 합 : ${sum}</p>
	
</body>
</html>