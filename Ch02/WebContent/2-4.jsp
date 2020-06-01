<%@page import="sub1.Account"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2-4</title>
</head>
<body>
	<h3>4.JSP 클래스</h3>
	<%
		Account kb = new Account("국민은행", "101-12-1111", "김유신", 10000);
		kb.deposit(40000);
		kb.withdraw(7000);	
	%>
	<h4>현재잔액</h4>
	<p>
		은 행 명 : <%= kb.getBank() %><br/>
		계좌번호 : <%= kb.getId() %><br/>
		입 금 주 : <%= kb.getName() %><br/>
		현재잔액 : <%= kb.getMoney() %><br/>
	</p>
	<%
		Account wr = new Account("우리은행", "101-11-1234", "김춘추", 10000);
		wr.deposit(10000);
		wr.withdraw(5000);
		wr.show(out);
	%>
</body>
</html>






