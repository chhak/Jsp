<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	// 선언부(Declaration)
	public int add(int x, int y){
		return x + y;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3-1</title>
</head>
<body>
	<h3>1.JSP 스크립트 요소</h3>
	<%
		// 스크립트릿(Scriptlet) : HTML문서 내에 자바코드 영역
		String name = "홍길동";
	%>	
	<p>
		<%-- 표현식(Expression) : 자바 변수를 출력하는 스크립트 요소 --%>
		<%= name %>님 안녕하세요.<br />
		1 + 2 = <%= add(1, 2) %>	
	</p>
</body>
</html>


