<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글보기</title>
    <link rel="stylesheet" href="./css/style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="view">
            <h3>글보기</h3>
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" value="${article.title}" readonly/></td>
                </tr>
                
                <c:if test="${article.file == 1}">
	                <tr>
	                    <td>첨부파일</td>
	                    <td>
	                        <a href="#">${article.fileBean.oldName}</a>
	                        <span>${article.fileBean.download}회 다운로드</span>
	                    </td>
	                </tr>
                </c:if>
                
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content" readonly>${article.content}</textarea>
                    </td>
                </tr>
            </table>
            <div>
                <a href="#" class="btnDelete">삭제</a>
                <a href="./modify.html" class="btnModify">수정</a>
                <a href="/Jboard2/list.do" class="btnList">목록</a>
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
			
			<script>
			
				$(document).ready(function(){
					
					var commentForm = $('.commentForm > form');
					var btnSubmit = $('.commentForm input[type=submit]');
					
					btnSubmit.click(function(e){
						e.preventDefault();
						
						var parent  = commentForm.find('input[name=parent]').val();
						var uid     = commentForm.find('input[name=uid]').val();
						var comment = commentForm.find('textarea').val();
						
						var json = {"parent": parent,
									"uid": uid,
									"comment": comment};
						
						$.ajax({
							url: '/Jboard2/comment.do',
							type: 'post',
							data: json,
							dataType: 'json',
							success: function(data){
								alert(data.result);
							}
						});
						
						
						
						
					});
					
					
				});
			
			
			</script>
			
            <!-- 댓글입력폼 -->
            <section class="commentForm">
                <h3>댓글쓰기</h3>
                <form action="#" method="post">
                	<input type="hidden" name="parent" value="${article.seq}" />
                	<input type="hidden" name="uid" value="${member.uid}" />
                    <textarea name="comment"></textarea>
                    <div>
                        <a href="#" class="btnCancel">취소</a>
                        <input type="submit" class="btnWrite" value="작성완료"/>
                    </div>
                </form>
            </section>

        </section>
    </div>    
</body>
</html>