package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WelcomeService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		
		return "/welcome.jsp";
	}
}
















