<%@page import="kr.co.farmstory1.bean.TermsBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.farmstory1.config.SQL"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.farmstory1.config.DBConfig"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//1, 2단계
	Connection conn = DBConfig.getConnection();
	// 3단계
	Statement stmt = conn.createStatement();
	
	// 4단계
	ResultSet rs = stmt.executeQuery(SQL.SELECT_TERMS);
	
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
<%@ include file="../_header.jsp" %>
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
        <a href="/Farmstory1/user/login.jsp">취소</a>
        <a href="/Farmstory1/user/register.jsp">다음</a>
    </div>
</section>
<%@ include file="../_footer.jsp" %>
