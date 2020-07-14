<%@tag import="java.util.Calendar"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);
	int hour = cal.get(Calendar.HOUR);
	int min = cal.get(Calendar.MINUTE);
	int sec = cal.get(Calendar.SECOND);
%>
<p>
	오늘날짜 : <%= year %>년 <%= month %>월 <%= date %>일<br />
	현재시간 : <%= hour %>시 <%= min %>분 <%= sec %>초<br />	
</p>
