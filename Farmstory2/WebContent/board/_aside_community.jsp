<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="sub" class="community">
    <div>
        <img src="../img/sub_top_tit5.png" alt="COMMUNITY"/>
    </div>
    <section>
        <aside>
            <img src="../img/sub_aside_cate5_tit.png" alt="커뮤니티"/>
            <ul>
                <li class="${cate=='notice'?'on':''}"><a href="/Farmstory2/board/list.do?group=community&cate=notice">공지사항</a></li>
                <li class="${cate=='menu'?'on':''}"><a href="/Farmstory2/board/list.do?group=community&cate=menu">오늘의식단</a></li>
                <li class="${cate=='chef'?'on':''}"><a href="/Farmstory2/board/list.do?group=community&cate=chef">나도요리사</a></li>
                <li class="${cate=='qna'?'on':''}"><a href="/Farmstory2/board/list.do?group=community&cate=qna">고객문의</a></li>
                <li class="${cate=='faq'?'on':''}"><a href="/Farmstory2/board/list.do?group=community&cate=faq">자주묻는질문</a></li>
            </ul>
        </aside>
        <article>
            <nav>
                <img src="../img/sub_nav_tit_cate5_tit_${cate}.png" alt="이벤트"/>
                <p>
                    HOME > 커뮤니티 > 
                    <c:if test="${cate=='notice'}"><span>공지사항</span></c:if>
                    <c:if test="${cate=='menu'}"><span>오늘의 식단</span></c:if>
                    <c:if test="${cate=='chef'}"><span>나도요리사</span></c:if>
                    <c:if test="${cate=='qna'}"><span>1:1고객문의</span></c:if>
                    <c:if test="${cate=='faq'}"><span>자주묻는 질문</span></c:if>                    
                </p>
            </nav>
            <div class="content">
            	<!-- 컨텐츠 내용 시작 -->
            
            
            
            