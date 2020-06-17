<%@page import="kr.co.jboard1.config.DBConfig"%>
<%@page import="kr.co.jboard1.bean.TermsBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Connection conn = DBConfig.getConnection();
	
	// 3단계
	Statement stmt = conn.createStatement();
	
	// 4단계
	String sql = "SELECT * FROM `JBOARD_TERMS`";
	ResultSet rs = stmt.executeQuery(sql);
	
	// 5단계
	TermsBean tb = new TermsBean();
	
	if(rs.next()){
		tb.setTerms(rs.getString(1));
		tb.setPrivacy(rs.getString(2));
	}
	
	// 6단계
	rs.close();
	stmt.close();
	conn.close();	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>약관</title>
    <link rel="stylesheet" href="/Jboard1/css/style.css"/>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<script>		
		$(function(){
			
			var checkbox = $('input[type=checkbox]');
			var nextBtn = $('.terms > div > a:eq(1)');

			nextBtn.click(function(){

				var chkTerms   = checkbox.eq(0).is(':checked');
				var chkPrivacy = checkbox.eq(1).is(':checked');
				
				if(chkTerms && chkPrivacy){
					return true;
				}else{
					alert('동의 하셔야 합니다.');
					return false;
				}
			});
		});
	</script>    
    
</head>
<body>
    <div id="wrapper">
        <section id="user" class="terms">
            <table>
                <caption>사이트 이용약관</caption>
                <tr>
                    <td>
                        <textarea readonly><%= tb.getTerms() %></textarea>
                        <p>
                            <label><input type="checkbox" name="chk1"/>동의합니다.</label>
                        </p>
                    </td>
                </tr>
            </table>
            <table>
                <caption>개인정보 취급방침</caption>
                <tr>
                    <td>
                        <textarea readonly><%= tb.getPrivacy() %></textarea>
                        <p>
                            <label><input type="checkbox" name="chk2"/>동의합니다.</label>
                        </p>
                    </td>
                </tr>
            </table>
            <div>
                <a href="/Jboard1/user/login.jsp">취소</a>
                <a href="/Jboard1/user/register.jsp">다음</a>
            </div>
        </section>
    </div>
    
</body>
</html>