<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>6-2</title>
</head>
<body>
	<%
		String name = null;
		
		if(name.equals("홍길동")){
			
			out.println("홍길동님 반갑습니다.");	
		}else{
			
			out.println("OOO님 반갑습니다.");
		}	
	%>	
</body>
</html>