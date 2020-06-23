<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String cate  = request.getParameter("cate");
%>
<div id="sub" class="community">
    <div>
        <img src="../img/sub_top_tit5.png" alt="COMMUNITY"/>
    </div>
    <section>
        <aside>
            <img src="../img/sub_aside_cate5_tit.png" alt="커뮤니티"/>
            <ul>
                <li class="<%= (cate.equals("notice")) ? "on":"" %>"><a href="./list.jsp?group=community&cate=notice">공지사항</a></li>
                <li class="<%= (cate.equals("menu")) ? "on":"" %>"><a href="./list.jsp?group=community&cate=menu">오늘의식단</a></li>
                <li class="<%= (cate.equals("chef")) ? "on":"" %>"><a href="./list.jsp?group=community&cate=chef">나도요리사</a></li>
                <li class="<%= (cate.equals("qna")) ? "on":"" %>"><a href="./list.jsp?group=community&cate=qna">고객문의</a></li>
                <li class="<%= (cate.equals("faq")) ? "on":"" %>"><a href="./list.jsp?group=community&cate=faq">자주묻는질문</a></li>
            </ul>
        </aside>
        <article>
            <nav>
                <img src="../img/sub_nav_tit_cate5_tit_<%= cate %>.png" alt="이벤트"/>
                <p>
                    HOME > 커뮤니티 > 
                    <% if(cate.equals("notice")){ %>
                    	<span>공지사항</span>
                    <% }else if(cate.equals("menu")){ %>
                    	<span>오늘의 식단</span>
                    <% }else if(cate.equals("chef")){ %>
                    	<span>나도요리사</span>
                    <% }else if(cate.equals("qna")){ %>
                    	<span>고객문의</span>
                    <% }else if(cate.equals("faq")){ %>
                    	<span>자주묻는 질문</span>
                    <% } %>
                </p>
            </nav>
            <div class="content">
            	<!-- 컨텐츠 내용 시작 -->
            
            
            
            