package kr.jboard2.service.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.jboard2.bean.MemberBean;
import kr.jboard2.config.DBConfig;
import kr.jboard2.config.SQL;
import kr.jboard2.controller.CommonService;

public class LoginService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		if(req.getMethod().equals("POST")) {
			
			// 파라미터 수신
			String uid  = req.getParameter("uid");
			String pass = req.getParameter("pass");
			
			// 1, 2 단계
			Connection conn = DBConfig.getConnection();
			
			// 3 단계
			PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_MEMBER);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			
			// 4 단계
			ResultSet rs = psmt.executeQuery();
			
			// 5 단계
			MemberBean mb = null;
			
			if(rs.next()) {
				mb = new MemberBean();
				mb.setUid(rs.getString(1));
				mb.setPass(rs.getString(2));
				mb.setName(rs.getString(3));
				mb.setNick(rs.getString(4));
				mb.setEmail(rs.getString(5));
				mb.setHp(rs.getString(6));
				mb.setGrade(rs.getInt(7));
				mb.setZip(rs.getString(8));
				mb.setAddr1(rs.getString(9));
				mb.setAddr2(rs.getString(10));
				mb.setRegip(rs.getString(11));
				mb.setRdate(rs.getString(12));			
			}
			
			// 6 단계
			rs.close();
			psmt.close();
			conn.close();
						
			if(mb != null) {
				// 회원이 맞을 경우 사용자 객체 세션 저장 후 리스트 이동 
				HttpSession session = req.getSession();
				session.setAttribute("member", mb);
				// 리다이렉트
				return "redirect:/Jboard2/list.do";	
			}else {
				// 회원이 아닐 경우 다시 로그인 이동
				return "redirect:/Jboard2/login.do";
			}
			
		}else {
			// GET 요청일때 View를 forward를 위한 view정보 리턴
			return "/user/login.jsp";			
		}		
	}
}
