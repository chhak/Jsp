<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="kr.co.jboard1.bean.FileBean"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="kr.co.jboard1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.config.DBConfig"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	// 세션에 저장된 파일객체 가져오기
	FileBean fBean = (FileBean) session.getAttribute("fBean");
	
	int    seq     = fBean.getSeq();
	int    parent  = fBean.getParent();
	String oldName = fBean.getOldName();
	String newName = fBean.getNewName();

	// 1) 파일 다운로드 카운트 업데이트
	// 1, 2단계
	Connection conn = DBConfig.getConnection();
	// 3단계
	PreparedStatement psmt = conn.prepareStatement(SQL.UPDATE_FILE_DOWN_COUNT);
	psmt.setInt(1, seq);
	
	// 4단계
	psmt.executeUpdate();
	
	// 5단계
	// 6단계
	psmt.close();
	conn.close();

	// 2) response 헤더 정보 수정
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode(oldName, "utf-8"));
	response.setHeader("Content-Transfer-Encoding", "binary");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private");

	// 3) response 객체 파일내용 스트림작업
	String realPath = request.getServletContext().getRealPath("/file");
	
	try{
		File file = new File(realPath+"/"+newName);
	
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());

		while(true){
			int data = bis.read();
			if(data == -1){
				break;	
			}
			bos.write(data);		
		}
		
		bos.close();
		bis.close();
		
	}catch(Exception e){
		response.sendRedirect("/Jboard1/view.jsp?seq="+parent+"&download=fail");
		return;
	}	
%>














