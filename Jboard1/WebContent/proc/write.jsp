<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@page import="kr.co.jboard1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.config.DBConfig"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 파라미터 수신
	request.setCharacterEncoding("utf-8");
	
	// Multipart-form 데이터 수신	
	String realPath = request.getServletContext().getRealPath("/file");
	int maxFileSize = 1024 * 1024 * 10;
	
	MultipartRequest mRequest = new MultipartRequest( request, realPath, maxFileSize, "utf-8", new DefaultFileRenamePolicy());
	String uid     = mRequest.getParameter("uid");
	String title   = mRequest.getParameter("title");
	String content = mRequest.getParameter("content");
	String fname   = mRequest.getFilesystemName("file");
	String regip   = request.getRemoteAddr();
	
	int hasFile = (fname != null) ? 1 : 0;
	
	// 1, 2단계
	Connection conn = DBConfig.getConnection();
	
	// 3단계	
	PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
	psmt.setString(1, title);
	psmt.setString(2, content);
	psmt.setInt(3, hasFile);	
	psmt.setString(4, uid);
	psmt.setString(5, regip);
	
	Statement stmt = conn.createStatement();	
	
	// 4단계
	psmt.executeUpdate();
	ResultSet rs = stmt.executeQuery(SQL.SELECT_ARTICLE_MAX_SEQ);
	
	// 5단계
	int parent = 0;
	
	if(rs.next()){
		parent = rs.getInt(1);
	}
	
	
	// 파일을 첨부했을 경우 파일명 코드화
	if(fname != null){
		
		// 파일명 만들기
		int i = fname.lastIndexOf(".");
		String ext = fname.substring(i);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss_");
		String now = sdf.format(new Date());
		
		String newName = now + uid + ext; // 200615104203_chhak.xlsx
		
		// 저장된 첨부 파일명 수정
		File oldFile = new File(realPath+"/"+fname);
		File newFile = new File(realPath+"/"+newName);
		
		oldFile.renameTo(newFile);
		
		// 3단계
		PreparedStatement psmtFile = conn.prepareStatement(SQL.INSERT_FILE);
		psmtFile.setInt(1, parent);
		psmtFile.setString(2, fname);
		psmtFile.setString(3, newName);
		
		// 4단계
		psmtFile.executeUpdate();
		psmtFile.close();
	}
	
	// 6단계	
	psmt.close();
	conn.close();
	
	// 리다이렉트
	response.sendRedirect("/Jboard1/list.jsp");
%>





