package kr.jboard2.service.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.jboard2.bean.TermsBean;
import kr.jboard2.config.DBConfig;
import kr.jboard2.config.SQL;
import kr.jboard2.controller.CommonService;

public class TermsService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		// 1, 2단계
		Connection conn = DBConfig.getConnection();

		// 3단계
		Statement stmt = conn.createStatement();
				
		// 4단계
		ResultSet rs = stmt.executeQuery(SQL.SELECT_TERMS);
		
		// 5단계
		TermsBean tb = new TermsBean();
		
		if(rs.next()) {
			tb.setTerms(rs.getString(1));
			tb.setPrivacy(rs.getString(2));
		}
		
		// 6단계
		rs.close();
		stmt.close();
		conn.close();
		
		// View에서 공유하기 위해 bean객체 request영역에 저장
		req.setAttribute("tb", tb);
				
		
		return "/user/terms.jsp";
	}

}



