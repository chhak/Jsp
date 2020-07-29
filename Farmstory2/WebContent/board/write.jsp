<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<jsp:include page="./_aside_${group}.jsp"/>
<section id="board" class="write">
    <h3>글쓰기</h3>
    <article>
        <form action="/Farmstory2/board/write.do" method="post">
        	<input type="hidden" name="group" value="${requestScope.group}" />
        	<input type="hidden" name="cate" value="${requestScope.cate}" />
        	<input type="hidden" name="uid" value="${sessionScope.member.uid}" />
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" placeholder="제목을 입력하세요."/></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content"></textarea>                                
                    </td>
                </tr>
                <tr>
                    <td>첨부</td>
                    <td><input type="file" name="fname"/></td>
                </tr>
            </table>
            <div>
                <a href="/Farmstory2/board/list.do" class="btnCancel">취소</a>
                <input type="submit"  class="btnWrite" value="작성완료">
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