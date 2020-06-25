<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String group = request.getParameter("group");
	String cate  = request.getParameter("cate");
	String asideFile  = "./_aside_"+group+".jsp"; 
	
	if(mb == null){
		response.sendRedirect("./list.jsp?code=101&group="+group+"&cate="+cate);
		return;
	}	
	
%>
<script>
	$(document).ready(function() {
		$('#summernote').summernote();
	});
</script>
<jsp:include page="<%= asideFile %>">
	<jsp:param value="<%= cate %>" name="cate"/>
</jsp:include>
<section id="board" class="write">
    <h3>글쓰기</h3>
    <article>
        <form action="/Farmstory1/board/proc/write.jsp" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="group" value="<%= group %>" />
        	<input type="hidden" name="cate" value="<%= cate %>" />
        	<input type="hidden" name="uid" value="<%= mb.getUid() %>" />        	
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" placeholder="제목을 입력하세요."/></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea id="summernote" name="content"></textarea>                                
                    </td>
                </tr>
                <tr>
                    <td>첨부</td>
                    <td><input type="file" name="file"/></td>
                </tr>
            </table>
            <div>
                <a href="./list.jsp?group=<%= group %>&cate=<%= cate %>" class="btnCancel">취소</a>
                <input type="submit"  class="btnWrite" value="작성완료"/>
            </div>
        </form>
    </article>
</section>
    <!-- 컨텐츠 내용 끝 -->
            </div>

        </article>
    </section>
</div>

<%@ include file="../_footer.jsp" %>    