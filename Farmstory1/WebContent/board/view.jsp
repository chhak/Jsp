<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String group = request.getParameter("group");
	String cate  = request.getParameter("cate");
	String asideFile  = "./_aside_"+group+".jsp"; 
%>
<jsp:include page="<%= asideFile %>">
	<jsp:param value="<%= cate %>" name="cate"/>
</jsp:include>
<script>
	var download = "";

	if(download == 'fail'){
		alert('해당하는 파일이 없습니다.\n관리자에게 문의하시기 바랍니다.');
	}
</script>
<section id="board" class="view">
    <h3>글보기</h3>
    <table>
        <tr>
            <td>제목</td>
            <td><input type="text" name="title" value="제목입니다." readonly/></td>
        </tr>
        <tr>
            <td>첨부파일</td>
            <td>
                <a href="#">전체수업일정.xlsx</a>
                <span>12회 다운로드</span>
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" readonly>내용입니다.</textarea>
            </td>
        </tr>
    </table>
    <script>
    	
    	function onDelete(){
    		var result = confirm("정말 삭제하시겠습니까?");
    		if(result){
    			return true;
    		}else{
    			return false;
    		}            		
    	}
    </script>
    <div>
        <a href="#" onclick="return onDelete()" class="btnDelete">삭제</a>
        <a href="./modify.jsp?group=<%= group %>&cate=<%= cate %>" class="btnModify">수정</a>
        <a href="./list.jsp?group=<%= group %>&cate=<%= cate %>" class="btnList">목록</a>
    </div>
    
    <!-- 댓글리스트 -->
    <section class="commentList">
        <h3>댓글목록</h3>
        <article class="comment">
            <span>
                <span>길동</span>
                <span>20-06-23</span>
            </span>
            <textarea name="comment" readonly>댓글 내용입니다.</textarea>
            <div>
                <a href="#">삭제</a>
                <a href="#">수정</a>
            </div>
        </article>
       	<p class="empty">등록된 댓글이 없습니다.</p>
    </section>

    <!-- 댓글입력폼 -->
    <section class="commentForm">
        <h3>댓글쓰기</h3>
        <form action="#" method="post">
        	<input type="hidden" name="parent" value="" />
        	<input type="hidden" name="uid" value="" />
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