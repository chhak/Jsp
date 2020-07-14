package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/welcome.do")
public class Welcome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void init(ServletConfig config) throws ServletException {
		System.out.println("Welcome init!!!");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestProc(request, response);
	}
	
	private void requestProc(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		
		resp.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Welcome</title>");
		out.println("<meta charset='utf-8'/>");		
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>Welcome Servlet!!!</h1>");
		out.println("<a href='/Ch17/hello.do'>hello</a>");
		out.println("<a href='#'>greeting</a>");
		out.println("</body>");		
		out.println("</html>");
		
	}
	

}
