package model.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.MemberBean;
import model.CommonService;

public class ListService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//DB정보
		String host = "jdbc:mysql://192.168.50.82:3306/test";
		String user = "chhak";
		String pass = "1234";
		
		Connection conn = null;
		Statement stmt = null;
		
		try {
			// 1단계
			Class.forName("com.mysql.jdbc.Driver");
			// 2단계
			conn = DriverManager.getConnection(host, user, pass);
			
			// 3단계
			stmt = conn.createStatement();
			
			// 4단계
			ResultSet rs = stmt.executeQuery("SELECT * FROM `MEMBER`");
			
			// 5단계
			List<MemberBean> members = new ArrayList<>();
			
			while(rs.next()) {
				MemberBean mb = new MemberBean();
				mb.setUid(rs.getString(1));
				mb.setName(rs.getString(2));
				mb.setHp(rs.getString(3));
				mb.setPos(rs.getString(4));
				mb.setDep(rs.getInt(5));			
				mb.setRdate(rs.getString(6).substring(2, 10));			
				
				members.add(mb);				
			}		
			
			// 6단계
			rs.close();
			stmt.close();
			conn.close();
			
			// View에서 출력할 데이터 공유
			req.setAttribute("members", members);
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/user/list.jsp";	
				
	}
}
