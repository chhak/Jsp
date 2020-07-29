<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../_header.jsp" %>
<jsp:include page="./_aside_${group}.jsp"/>
    <section id="board" class="view">
    	
        <h3>글보기</h3>
        <table>
            <tr>
                <td>제목</td>
                <td><input type="text" name="title" value="${vo.title}" readonly/></td>
            </tr>
            
            <c:if test="${vo.file == 1}">
             <tr>
                 <td>첨부파일</td>
                 <td>
                     <a href="#">${vo.fv.oldName}</a>
                     <span>${vo.fv.download}회 다운로드</span>
                 </td>
             </tr>
            </c:if>
            
            <tr>
                <td>내용</td>
                <td>
                    <textarea name="content" readonly>${vo.content}</textarea>
                </td>
            </tr>
        </table>
        <div>
            <a href="#" class="btnDelete">삭제</a>
            <a href="#" class="btnModify">수정</a>
            <a href="#" class="btnList">목록</a>
        </div>
        <!-- 댓글리스트 -->
        <section class="commentList">
            <h3>댓글목록</h3>
            
            <c:forEach var="comment" items="${comments}">
	            <article class="comment">
	                <span>
	                    <span>${comment.nick}</span>
	                    <span>${comment.rdate}</span>
	                </span>
	                <textarea name="comment" readonly>${comment.content}</textarea>
	                <div>
	                    <a href="#">삭제</a>
	                    <a href="#">수정</a>
	                </div>
	            </article>
            </c:forEach>
            
            <c:if test="${empty comments}">
           		<p class="empty">등록된 댓글이 없습니다.</p>
           	</c:if>
        </section>

        <!-- 댓글입력폼 -->
		<section class="commentForm">
			<h3>댓글쓰기</h3>
			<form action="/Farmstory2/board/comment.do" method="post">
				<input type="hidden" name="group" value="${requestScope.group}" />
				<input type="hidden" name="parent" value="${vo.seq}" />
				<input type="hidden" name="cate" value="${requestScope.cate}" />
				<input type="hidden" name="uid" value="${sessionScope.member.uid}" />
				<textarea name="comment"></textarea>
				<div>
					<a href="#" class="btnCancel">취소</a>
					<input type="submit" class="btnWrite" value="작성완료"/>
				</div>
			</form>
		</section>
	</section>
			
			<!-- 컨텐츠 내용 끝 -->
            </div>

        </article>
    </section>
</div>

<%@ include file="../_footer.jsp" %>