<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.farmstory1.config.SQL"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory1.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	request.setCharacterEncoding("utf-8");		
	String group = request.getParameter("group");	
	String cate  = request.getParameter("cate");
	String pg    = request.getParameter("pg");
	String asideFile  = "./_aside_"+group+".jsp";
	
	if(pg == null){
		pg = "1";
	}
	
	// 페이지 관련 변수선언
	int total = 0;
	int lastPage = 0;
	int listCount = 0;
	int currentPg = Integer.parseInt(pg);
	int limitIdx  = (currentPg - 1) * 10;
	int groupCurrent = (int)Math.ceil(currentPg / 10.0);
	int groupStart = (groupCurrent - 1) * 10 + 1;
	int groupEnd = groupCurrent * 10;
	
	// 1, 2단계
	Connection conn = DBConfig.getConnection();
	
	// 전체 게시물 갯수 구하기
	PreparedStatement psmtCount = conn.prepareStatement(SQL.SELECT_TOTAL_COUNT);
	psmtCount.setString(1, cate);
	ResultSet rsCount = psmtCount.executeQuery();
	
	if(rsCount.next()){
		total = rsCount.getInt(1);
		
		if(total % 10 == 0){
			lastPage = total / 10;
		}else{
			lastPage = total / 10 + 1;
		}
		
		if(groupEnd > lastPage){
			groupEnd = lastPage;
		}	
		
		listCount = total - limitIdx;		
	}
	
	// 3단계
	PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_ARTICLES);
	psmt.setString(1, cate);
	psmt.setInt(2, limitIdx); // 1pg = 0, 2pg = 10, 3pg = 20...
	
	// 4단계
	ResultSet rs = psmt.executeQuery();
	
	// 5단계 - 결과셋 처리
	List<ArticleBean> articles = new ArrayList<>();
	
	while(rs.next()){
		ArticleBean article = new ArticleBean();
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
		article.setNick(rs.getString(12));
		
		articles.add(article);
	}
	
	
	// 6단계
	rsCount.close();
	psmtCount.close();
	rs.close();
	psmt.close();
	conn.close();
	
%>
<jsp:include page="<%= asideFile %>">
	<jsp:param value="<%= cate %>" name="cate"/>
</jsp:include>
<section id="board" class="list">
    <h3>글목록</h3>
    <article>
        <table border="0">
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>날짜</th>
                <th>조회</th>
            </tr>
            <% for(ArticleBean article : articles){ %>
            <tr>
                <td><%= listCount-- %></td>
                <td><a href="./view.jsp?seq=<%= article.getSeq() %>&group=<%= group %>&cate=<%= cate %>"><%= article.getTitle() %></a>&nbsp;[<%= article.getComment() %>]</td>
                <td><%= article.getNick() %></td>
                <td><%= article.getRdate().substring(2, 10) %></td>
                <td><%= article.getHit() %></td>
            </tr>
            <% } %>
        </table>
    </article>

    <!-- 페이지 네비게이션 -->
    <div class="paging">
    	<% if(groupStart > 1){ %>
        	<a href="./list.jsp?group=<%= group %>&cate=<%= cate %>&pg=<%= groupStart-1 %>" class="prev">이전</a>
        <% } %>
        <% for(int i=groupStart ; i<=groupEnd ; i++){ %>
        	<a href="./list.jsp?group=<%= group %>&cate=<%= cate %>&pg=<%= i %>" class="num <%= (currentPg == i) ? "current": "" %>"><%= i %></a>
        <% } %>
        
        <% if(groupEnd < lastPage){ %>
        	<a href="./list.jsp?group=<%= group %>&cate=<%= cate %>&pg=<%= groupEnd+1 %>" class="next">다음</a>
        <% } %>
    </div>

    <!-- 글쓰기 버튼 -->
    <a href="./write.jsp?group=<%= group %>&cate=<%= cate %>" class="btnWrite">글쓰기</a>
</section>

<!-- 컨텐츠 내용 끝 -->
            </div>

        </article>
    </section>
</div>

<%@ include file="../_footer.jsp" %>

    
    
    
    
    
    
    
    
    
    