<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSP 필터 실습하기</h3>
	<form action="/Ch19/register.do" method="post">
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" /></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="전송하기" /></td>
			</tr>
		</table>
	</form>
	

</body>
</html>