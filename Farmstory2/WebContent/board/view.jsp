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
        
        <script>
        
        	$(function(){
        		
        		var currentComment = "";
        		
        		var btnModify   = $('.commentList .modify');
        		var btnComplete = $('.commentList .Complete');
        		var btnCancel   = $('.commentList .cancel');
        		var btndel      = $('.commentList .del');
        		
        		// 취소 클릭
        		btnCancel.click(function(e){
        			e.preventDefault();
        			
        			// textarea 비활성화
        			var textarea = $(this).parent().prev();        			
        			textarea.attr('readonly', true);
        			textarea.val(currentComment);
        			
        			// 삭제 노출, 수정완료 숨김, 취소 메뉴 숨김
        			var parent = $(this).parent();
        			parent.children().eq(0).removeClass('off');
        			parent.children().eq(1).addClass('off');
        			parent.children().eq(2).addClass('off');
        			parent.children().eq(3).removeClass('off');
        			
        		});
        		
        		// 수정 클릭
        		btnModify.click(function(e){
        			e.preventDefault();
        			
        			// textarea 활성화
        			var textarea = $(this).parent().prev();        			
        			textarea.attr('readonly', false);
        			textarea.focus();
        			
        			// 취소를 누를경우 원래 댓글로 복원하기 위해 현재 댓글 보관
        			currentComment = textarea.val();
        			
        			// 삭제 숨김, 수정완료 노출, 취소 메뉴 노출
        			var parent = $(this).parent();
        			parent.children().eq(0).addClass('off');
        			parent.children().eq(1).removeClass('off');
        			parent.children().eq(2).removeClass('off');
        			parent.children().eq(3).addClass('off');
        			
        		});
        		
        	});
        
        
        </script>
        
        
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
	                    <a href="#" class="del">삭제</a>
	                    <a href="#" class="cancel off">취소</a>
	                    <a href="#" class="complete off">수정완료</a>
	                    <a href="#" class="modify">수정</a>
	                </div>
	            </article>
            </c:forEach>
            
            <c:if test="${empty comments}">
           		<p class="empty">등록된 댓글이 없습니다.</p>
           	</c:if>
        </section>

		<script>
			function getToday(){
				
				var date = new Date();
			    var year = date.getFullYear();
			    var month = date.getMonth()+1
			    var day = date.getDate();
			    if(month < 10){
			        month = "0"+month;
			    }
			    if(day < 10){
			        day = "0"+day;
			    }
			 
			    var today = year+'-'+month+'-'+day;
				var rdate = today.substring(2);
				
				return rdate;		
			}	
		
		
		
			$(function(){
				
				var btnWrite = $('.commentForm .btnWrite');
				
				btnWrite.click(function(e){
					e.preventDefault();
					
					var group   = $('.commentForm input[name=group]').val();
					var cate    = $('.commentForm input[name=cate]').val();
					var parent  = $('.commentForm input[name=parent]').val();
					var uid     = $('.commentForm input[name=uid]').val();
					var nick    = $('.commentForm input[name=nick]').val();
					var comment = $('.commentForm textarea[name=comment]');
					
					var jsonData = {'group': group,
									'cate': cate,
									'parent': parent,
									'uid': uid,
									'comment': comment.val()};
					
					
					$.ajax({
						url: '/Farmstory2/board/comment.do',
						type: 'post',
						data: jsonData,
						dataType: 'json',
						success: function(data){
							
							if(data.result == 1){
								
								// 화면 부분갱신 작업
								var strHtml = "<article class='comment'>"
											 + "<span>"
											 	+ "<span class='nick'></span>"
											 	+ "<span class='rdate'></span>"
											 + "</span>"
											 + "<textarea name='comment' readonly></textarea>"
											 + "<div>"
											 	+ "<a href='#'>삭제</a>"
											 	+ "<a href='#'>수정</a>"
											 + "</div>"
										 + "</article>";
										 
								var html = $.parseHTML(strHtml);
								var dom = $(html);
								
								dom.find('.nick').text(nick);
								dom.find('.rdate').text(getToday());
								dom.find('textarea').text(comment.val());
								
								$('.commentList').append(dom);
								comment.val("");
							}
						}
					});
					
					
					
					
				});
				
			});
		
		
		</script>

        <!-- 댓글입력폼 -->
		<section class="commentForm">
			<h3>댓글쓰기</h3>
			<form action="#" method="post">
				<input type="hidden" name="group" value="${requestScope.group}" />
				<input type="hidden" name="parent" value="${vo.seq}" />
				<input type="hidden" name="cate" value="${requestScope.cate}" />
				<input type="hidden" name="uid" value="${sessionScope.member.uid}" />
				<input type="hidden" name="nick" value="${sessionScope.member.nick}" />
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