<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="regBean" class="sub1.RegisterBean">
	<jsp:setProperty name="regBean" property="name" />
	<jsp:setProperty name="regBean" property="gender" />
	<jsp:setProperty name="regBean" property="hobby" />
	<jsp:setProperty name="regBean" property="addr" />
</jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>8-2</title>
</head>
<body>
	<h3>2.JSP useBean 액션태그</h3>
	
	<p>
		이름 : <%= regBean.getName() %><br />
		성별 : <%= (regBean.getGender() == 1) ? "남자" : "여자" %><br />
		취미 : 
		<% 
			for(String hobby : regBean.getHobby()){
				out.print(hobby+", ");
			}		
		%>
		<br />
		주소 : <%= regBean.getAddr() %><br />
	</p>
</body>
</html>