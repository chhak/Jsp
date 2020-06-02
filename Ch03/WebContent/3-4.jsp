<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3-4</title>
</head>
<body>
	<h3>4.회원가입 데이터 수신</h3>
	<%
		request.setCharacterEncoding("UTF-8");
		String name      = request.getParameter("name");
		String gender    = request.getParameter("gender");
		String[] hobbies = request.getParameterValues("hobby");
		String addr      = request.getParameter("addr");
	%>
	
	<p>
		회원가입 정보<br />
		이름 : <%= name %><br />
		성별 : <%= gender %><br />
		취미 : 
		<% 
			for(String hobby : hobbies){
				out.print(hobby+", ");
			}		
		%>
		<br />
		주소 : <%= addr %><br />	
	</p>
	<a href="./3-2.jsp">뒤로가기</a>
	
</body>
</html>