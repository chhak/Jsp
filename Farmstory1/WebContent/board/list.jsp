<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<div id="sub" class="community">
    <div>
        <img src="../img/sub_top_tit5.png" alt="COMMUNITY"/>
    </div>
    <section>
        <aside>
            <img src="../img/sub_aside_cate5_tit.png" alt="커뮤니티"/>
            <ul>
                <li class="on"><a href="./notice.jsp">공지사항</a></li>
                <li><a href="./menu.jsp">오늘의식단</a></li>
                <li><a href="./chef.jsp">나도요리사</a></li>
                <li><a href="./qna.jsp">고객문의</a></li>
                <li><a href="./faq.jsp">자주묻는질문</a></li>
            </ul>
        </aside>
        <article>
            <nav>
                <img src="../img/sub_nav_tit_cate5_tit1.png" alt="이벤트"/>
                <p>
                    HOME > 커뮤니티 > <span>공지사항</span>
                </p>
            </nav>
            <div class="content">
                <!-- 컨텐츠 내용 시작 -->

   <section id="board" class="list">
       <h3>글목록</h3>
       <article>
           <p>
				홍길동님 반갑습니다.
               <a href="/Jboard1/user/proc/logout.jsp" class="logout">[로그아웃]</a>
           </p>
           <table border="0">
               <tr>
                   <th>번호</th>
                   <th>제목</th>
                   <th>글쓴이</th>
                   <th>날짜</th>
                   <th>조회</th>
               </tr>
               <tr>
                   <td>1</td>
                   <td><a href="#">제목입니다.</a>&nbsp;[3]</td>
                   <td>길동</td>
                   <td>20-06-23</td>
                   <td>12</td>
               </tr>
           </table>
       </article>

       <!-- 페이지 네비게이션 -->
    <div class="paging">
        <a href="#" class="prev">이전</a>
        <a href="#" class="num current">1</a>                
        <a href="#" class="next">다음</a>
    </div>

    <!-- 글쓰기 버튼 -->
    <a href="#" class="btnWrite">글쓰기</a>
</section>

<!-- 컨텐츠 내용 끝 -->
            </div>

        </article>
    </section>
</div>

<%@ include file="../_footer.jsp" %>    
    
    
    
    
    
    
    
    
    
    
    
    