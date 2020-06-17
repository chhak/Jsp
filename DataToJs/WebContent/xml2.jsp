<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.MemberBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DBConfig"%>
<%@ page contentType="text/xml;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%
	// 1) DB에서 데이터 가져오기
	Connection conn = DBConfig.getConnection();
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT * FROM `MEMBER`");
	
	List<MemberBean> memberList = new ArrayList<>();
	
	while(rs.next()){
		MemberBean mb = new MemberBean();
		mb.setUid(rs.getString(1));
		mb.setName(rs.getString(2));
		mb.setHp(rs.getString(3));
		mb.setPos(rs.getString(4));
		mb.setDep(rs.getInt(5));
		mb.setRdate(rs.getString(6));		
		
		memberList.add(mb);
	}
	
	rs.close();
	stmt.close();
	conn.close();

	// 2) XML 생성하기 - 편리한 XML 동적태그 생성을 위한 JDOM 라이브러리 사용
	Document doc = new Document();
	Element members = new Element("members");
	
	for(MemberBean mb : memberList){
		
		Element member = new Element("member");
		Element uid    = new Element("uid");
		Element name   = new Element("name");
		Element hp     = new Element("hp");
		Element pos    = new Element("pos");
		Element dep    = new Element("dep");
		Element rdate  = new Element("rdate");
		
		uid.setText(mb.getUid());
		name.setText(mb.getName());
		hp.setText(mb.getHp());
		pos.setText(mb.getPos());
		dep.setText(""+mb.getDep());
		rdate.setText(mb.getRdate());
		
		member.addContent(uid);
		member.addContent(name);
		member.addContent(hp);
		member.addContent(pos);
		member.addContent(dep);
		member.addContent(rdate);
		
		members.addContent(member);		
	}

	// xml문서의 루트 엘레먼트로 members 태그 설정
	doc.setRootElement(members);	

	// 3) XML 출력하기
	String xml = new XMLOutputter(Format.getPrettyFormat()).outputString(doc);  
	out.print(xml);
%>