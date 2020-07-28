<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="sub" class="croptalk">
    <div>
        <img src="../img/sub_top_tit3.png" alt="CROP TALK"/>
    </div>
    <section>
        <aside>
            <img src="../img/sub_aside_cate3_tit.png" alt="농작물이야기"/>
            <ul>
                <li class="${cate=='croptalk'?'on':''}"><a href="/Farmstory2/board/list.do?group=croptalk&cate=croptalk">농작물이야기</a></li>
                <li class="${cate=='grow'?'on':''}"><a href="/Farmstory2/board/list.do?group=croptalk&cate=grow">텃밭가꾸기</a></li>
                <li class="${cate=='school'?'on':''}"><a href="/Farmstory2/board/list.do?group=croptalk&cate=school">귀농학교</a></li>
            </ul>
        </aside>
        <article>
            <nav>
                <img src="../img/sub_nav_tit_cate3_tit_${cate}.png" alt="농작물이야기"/>
                <p>
                    HOME > 농작물이야기 >
                    <c:if test="${cate=='croptalk'}"><span>농작물이야기</span></c:if>
                    <c:if test="${cate=='grow'}"><span>텃밭가꾸기</span></c:if>
                    <c:if test="${cate=='school'}"><span>귀농학교</span></c:if>
                </p>
            </nav>
            <div class="content">
                <!-- 컨텐츠 내용 시작 -->
                
                
                
                
                
                