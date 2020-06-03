<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./inc/config.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>7-1</title>
</head>
<body>
	<h3>1.JSP include 지시자(디렉티브)</h3>
	
	<%@ include file="./inc/header.jsp" %>
	
	<main>
		<h2>메인 컨텐츠 영역</h2>
		<p>
			DB주소 : <%= HOST %><br />
			DB계정 : <%= USER %><br />
			DB비번 : <%= PASS %><br />
		</p>
	</main>	
	
	<%@ include file="./inc/footer.jsp" %>
	
</body>
</html>



