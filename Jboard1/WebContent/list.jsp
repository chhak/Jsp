<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.jboard1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.config.DBConfig"%>
<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//세션체크 및 사용자 정보객체 구하기
	MemberBean mb = (MemberBean) session.getAttribute("member");
		
	if(mb == null){		
		response.sendRedirect("/Jboard1/user/login.jsp");
		return; // 아래 로직실행을 못하게 프로그램을 여기서 종료 
	}
	
	// 파라미터 수신
	request.setCharacterEncoding("utf-8");
	String pg = request.getParameter("pg");
	
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
	psmt.setInt(1, limitIdx); // 1pg = 0, 2pg = 10, 3pg = 20...
	
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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글목록</title>
    <link rel="stylesheet" href="/Jboard1/css/style.css">    
</head>
<body>
    <div id="wrapper">
        <section id="board" class="list">
            <h3>글목록</h3>
            <article>
                <p>
					<%= mb.getNick() %>님 반갑습니다.
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
                    <% for(ArticleBean article : articles){ %>
                    <tr>
                        <td><%= listCount-- %></td>
                        <td><a href="/Jboard1/view.jsp?seq=<%= article.getSeq() %>"><%= article.getTitle() %></a>&nbsp;[<%= article.getComment() %>]</td>
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
                <a href="/Jboard1/list.jsp?pg=<%= groupStart - 1 %>" class="prev">이전</a>
            	<% } %>
            	
                <% for(int i=groupStart ; i<=groupEnd ; i++){ %>
                <a href="/Jboard1/list.jsp?pg=<%= i %>" class="num <%= (currentPg == i) ? "current":"" %>"><%= i %></a>                
                <% } %>
                
                <% if(groupEnd < lastPage){ %>                
                <a href="/Jboard1/list.jsp?pg=<%= groupEnd + 1 %>" class="next">다음</a>
            	<% } %>
            </div>

            <!-- 글쓰기 버튼 -->
            <% if(mb.getGrade() > 2){ %>
            <a href="/Jboard1/write.jsp" class="btnWrite">글쓰기</a>
			<% } %>
        </section>
    </div>    
</body>
</html>