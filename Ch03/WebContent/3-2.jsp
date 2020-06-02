<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3-2</title>
</head>
<body>
	<h3>2.request 내장 객체</h3>
	<%--
		전송방식 GET, POST 교재 p80
		
		GET
		 - 기본 데이터 전송 방식
		 - 서버에게 페이지나 데이터를 요청하는 전송방식(OOO 주세요~)
		 - 파라미터가 주소창에 노출
		 
		POST
		 - 서버에게 데이터를 전달하면서 처리를 요청하는 방식(OOO 해주세요~)
		 - 파라미터가 주소창에 노출되지 않음
	--%>
	
	<h4>로그인</h4>
	<form action="./3-3.jsp" method="get">
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
				<td colspan="2" align="right"><input type="submit" value="로그인" /></td>
			</tr>
		</table>
	</form>
	
	<h4>회원가입</h4>
	<form action="./3-4.jsp" method="post">
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<label><input type="radio" name="gender" value="1"/>남</label>
					<label><input type="radio" name="gender" value="2"/>여</label>
				</td>
			</tr>
			<tr>
				<td>취미</td>
				<td>
					<label><input type="checkbox" name="hobby" value="등산"/>등산하기</label>
					<label><input type="checkbox" name="hobby" value="여행"/>여행하기</label>
					<label><input type="checkbox" name="hobby" value="독서"/>독서하기</label>
					<label><input type="checkbox" name="hobby" value="운동"/>운동하기</label>
					<label><input type="checkbox" name="hobby" value="영화"/>영화보기</label>
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<select name="addr">
						<option>서울</option>
						<option>대전</option>
						<option>대구</option>
						<option>부산</option>
						<option>광주</option>
					</select>
				</td>
			</tr>
			<tr>				
				<td colspan="2" align="right">
					<input type="submit" value="가입하기"/>
				</td>
			</tr>		
		</table>	
	</form>

</body>
</html>












