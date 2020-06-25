<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.farmstory1.bean.FileBean"%>
<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.farmstory1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory1.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String group    = request.getParameter("group");
	String cate     = request.getParameter("cate");
	String seq      = request.getParameter("seq");
	String download = request.getParameter("download");
	String asideFile  = "./_aside_"+group+".jsp";
	
	if(mb == null){		
		response.sendRedirect("./list.jsp?code=101&group="+group+"&cate="+cate);
		return;
	}

	// 1, 2단계
	Connection conn = DBConfig.getConnection();
	// 트랜젝션 시작
	conn.setAutoCommit(false);
	
	// 3단계
	PreparedStatement psmtHit = conn.prepareStatement(SQL.UPDATE_HIT);
	psmtHit.setString(1, seq);
	
	PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_ARTICLE);
	psmt.setString(1, seq);
	
	PreparedStatement psmtComment = conn.prepareStatement(SQL.SELECT_COMMENTS);
	psmtComment.setString(1, seq);
	
	// 4단계
	psmtHit.executeUpdate();
	ResultSet rs = psmt.executeQuery();
	ResultSet rsComment = psmtComment.executeQuery();
	
	// 5단계
	ArticleBean article = new ArticleBean();
	FileBean fileBean = new FileBean();
	
	if(rs.next()){		
		article.setSeq(rs.getInt(1));
		article.setParent(rs.getInt(2));
		article.setComment(rs.getInt(3));
		article.setCate(rs.getString(4));
		article.setTitle(rs.getString(5));
		article.setContent(rs.getString(6));
		article.setFile(rs.getInt(7));
		article.setHit(rs.getInt(8));
		article.setUid(rs.getString(9));
		article.setRegip(rs.getString(10));
		article.setRdate(rs.getString(11));
		
		fileBean.setSeq(rs.getInt(12));
		fileBean.setParent(rs.getInt(13));
		fileBean.setOldName(rs.getString(14));
		fileBean.setNewName(rs.getString(15));
		fileBean.setDownload(rs.getInt(16));
		fileBean.setRdate(rs.getString(17));		
		article.setFileBean(fileBean);
	}
			
	List<ArticleBean> comments = new ArrayList<>();
	while(rsComment.next()){
		ArticleBean comment = new ArticleBean();
		
		comment.setSeq(rsComment.getInt(1));
		comment.setContent(rsComment.getString(6));
		comment.setUid(rsComment.getString(9));
		comment.setRegip(rsComment.getString(10));
		comment.setRdate(rsComment.getString(11));
		comment.setNick(rsComment.getString(12));
		
		comments.add(comment);		
	}
	
	// 트랜젝션 끝
	conn.commit();
	
	// 6단계
	rsComment.close();
	psmtComment.close();
	psmtHit.close();
	rs.close();	
	psmt.close();
	conn.close();
	
	// 수정을 대비하기 위한 article객체 세션에 저장
	session.setAttribute("article", article);
%>
<jsp:include page="<%= asideFile %>">
	<jsp:param value="<%= cate %>" name="cate"/>
</jsp:include>
<script>
	var download = "";

	if(download == 'fail'){
		alert('해당하는 파일이 없습니다.\n관리자에게 문의하시기 바랍니다.');
	}
	
	$(document).ready(function() {
		$('#summernote').summernote({
			airMode: true,
			focus: false
		});
	});
</script>

<section id="board" class="view">
    <h3>글보기</h3>
    <table>
        <tr>
            <td>제목</td>
            <td><input type="text" name="title" value="<%= article.getTitle() %>" readonly/></td>
        </tr>
        <% if(article.getFile() == 1){ %>
        <tr>
            <td>첨부파일</td>
            <td>
                <a href="#"><%= fileBean.getOldName() %></a>
                <span><%= fileBean.getDownload() %>회 다운로드</span>
            </td>
        </tr>
        <% } %>
        <tr>
            <td>내용</td>
            <td>
                <textarea id="summernote" name="content" readonly><%= article.getContent() %></textarea>
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
        <% for(ArticleBean comment : comments){ %>
        <article class="comment">
            <span>
                <span><%= comment.getNick() %></span>
                <span><%= comment.getRdate().substring(2, 10) %></span>
            </span>
            <textarea name="comment" readonly><%= comment.getContent() %></textarea>
            <div>
                <a href="#">삭제</a>
                <a href="#">수정</a>
            </div>
        </article>
        <% } %>
        
        <% if(article.getComment() == 0){ %>	
       		<p class="empty">등록된 댓글이 없습니다.</p>
       	<% } %>
    </section>

    <!-- 댓글입력폼 -->
    <section class="commentForm">
        <h3>댓글쓰기</h3>
        <form action="./proc/comment.jsp" method="post">
        	<input type="hidden" name="parent" value="<%= seq %>" />
        	<input type="hidden" name="group" value="<%= group %>" />
        	<input type="hidden" name="cate" value="<%= cate %>" />
        	<input type="hidden" name="uid" value="<%= mb.getUid() %>" />
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