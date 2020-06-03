<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./inc/config.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>7-2</title>
</head>
<body>
	<h3>2.JSP include 액션태그</h3>
	
	<%-- 
		include 지시자
		 - 공통의 전역파일을 삽입하는 include
		 - 일반적으로 UI뷰, 공통전역 파일 변수를 삽입
		 - 정적타임(컴파일타임)에 삽입  
		
		include 액션태그
		 - 공통의 전역파일을 삽입하는 include
		 - 일반적으로 UI뷰를 모듈화해서 삽입
		 - 런타임에 삽입	
	--%>
	
	<%@ include file="./inc/header.jsp" %>
	<jsp:include page="./inc/header.jsp"/>
	 
	<main>
		<h2>메인 컨텐츠 영역</h2>
		<p>
			DB주소 : <%= HOST %><br />
			DB계정 : <%= USER %><br />
			DB비번 : <%= PASS %><br />
		</p>
	</main>
	
	<jsp:include page="./inc/footer.jsp"/>
	
</body>
</html>


