<%@page import="member.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 파라미터 수신
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");

	//DB정보
	String host = "jdbc:mysql://192.168.44.46:3306/chhak";
	String user = "chhak";
	String pass = "1234";
	
	// 1단계
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2단계
	Connection conn = DriverManager.getConnection(host, user, pass);
	
	// 3단계
	Statement stmt = conn.createStatement();
	
	// 4단계
	String sql = "SELECT * FROM `MEMBER` WHERE `uid`='"+uid+"'";
	ResultSet rs = stmt.executeQuery(sql);
	
	// 5단계
	MemberBean mb = new MemberBean();
	if(rs.next()){
		mb.setUid(rs.getString(1));
		mb.setName(rs.getString(2));
		mb.setHp(rs.getString(3));
		mb.setPos(rs.getString(4));
		mb.setDep(rs.getInt(5));
		mb.setRdate(rs.getString(6));
	}
	
	// 6단계
	rs.close();
	stmt.close();
	conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원수정</title>
</head>
<body>
	<h3>직원수정</h3>
	<form action="modifyProc.jsp" method="get">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" value="<%= mb.getUid() %>" readonly /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%= mb.getName() %>" /></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp" maxlength="13" value="<%= mb.getHp() %>" /></td>
			</tr>
			<tr>
				<td>직급</td>
				<td>
					<select name="pos">
						<option>사원</option>
						<option>대리</option>
						<option>과장</option>
						<option>차장</option>
						<option>부장</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>부서</td>
				<td>
					<select name="dep">
						<option value="101">영업1부</option>
						<option value="102">영업2부</option>
						<option value="103">영업3부</option>
						<option value="104">영업4부</option>
						<option value="105">영업지원부</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="직원 수정하기" />
				</td>
			</tr>		
		</table>	
	</form>
	
</body>
</html>