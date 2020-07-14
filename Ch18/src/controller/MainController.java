package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.javafx.image.impl.General;

import model.CommonService;
import model.GreetingService;
import model.HelloService;
import model.WelcomeService;

public class MainController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {

	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	}
	
	private void requestProc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = req.getContextPath();
		String uri  = req.getRequestURI();
		
		String action = uri.substring(path.length());
		String view = null;
		
		if(action.equals("/hello.do")) {
			
			CommonService service = new HelloService();
			view = service.requestProc(req, resp);
			
		}else if(action.equals("/welcome.do")) {
			
			CommonService service = new WelcomeService();
			view = service.requestProc(req, resp);
			
		}else if(action.equals("/greeting.do")) {
			
			CommonService service = new GreetingService();
			view = service.requestProc(req, resp);
		}
		
		// View Æ÷¿öµå
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
				
	}
}
