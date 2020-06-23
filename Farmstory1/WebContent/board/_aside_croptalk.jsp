<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String cate  = request.getParameter("cate");
%>
<div id="sub" class="croptalk">
    <div>
        <img src="../img/sub_top_tit3.png" alt="CROP TALK"/>
    </div>
    <section>
        <aside>
            <img src="../img/sub_aside_cate3_tit.png" alt="농작물이야기"/>
            <ul>
                <li class="<%= (cate.equals("croptalk")) ? "on":"" %>"><a href="./list.jsp?group=croptalk&cate=croptalk">농작물이야기</a></li>
                <li class="<%= (cate.equals("grow")) ? "on":"" %>"><a href="./list.jsp?group=croptalk&cate=grow">텃밭가꾸기</a></li>
                <li class="<%= (cate.equals("school")) ? "on":"" %>"><a href="./list.jsp?group=croptalk&cate=school">귀농학교</a></li>
            </ul>
        </aside>
        <article>
            <nav>
                <img src="../img/sub_nav_tit_cate3_tit_<%= cate %>.png" alt="농작물이야기"/>
                <p>
                    HOME > 농작물이야기 > 
                    <% if(cate.equals("croptalk")){ %>
                    	<span>농작물이야기</span>
                    <% }else if(cate.equals("grow")){ %>
                    	<span>텃밭가꾸기</span>
                    <% }else if(cate.equals("school")){ %>
                    	<span>귀농학교</span>
                    <% } %>
                </p>
            </nav>
            <div class="content">
                <!-- 컨텐츠 내용 시작 -->
                
                
                
                
                
                