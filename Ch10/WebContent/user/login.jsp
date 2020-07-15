<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String result = request.getParameter("result");
	
	// 현재 세션(사용자)이 세션테이블에 저장되어 있는지 확인
	String uid = (String)session.getAttribute("uid");
	
	if(uid != null){
		response.sendRedirect("./loginSuccess.jsp");
		return; // 여기서 login.jsp 프로그램 종료
	}	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script>
	var result = "<%= result %>";
	if(result == "fail"){
		alert("로그인에 실패했습니다.\n다시 확인하시기 바랍니다.");
	}
</script>

</head>
<body>
	<h3>로그인</h3>
	<form action="./loginProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" /></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="로그인하기" />
				</td>
			</tr>
		</table>		
	</form>
</body>
</html>