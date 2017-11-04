

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.corba.se.pept.transport.Connection;

/**
 * Servlet implementation class Interconnection
 */
@WebServlet("/Interconnection")
public class Interconnection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Interconnection() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String database_name = request.getParameter("database_name");
		HttpSession se1 = request.getSession(false);
		String database_name = (String) se1.getAttribute("db_name");
		// String first_name = (String)ses.getAttribute("fname");
		 //request.setAttribute("udatabase",database_name);
		 //request.setAttribute("fname",first_name);
		 System.out.println(database_name);
		 
		 //RequestDispatcher rd = request.getRequestDispatcher("/newDataBase.jsp");
		 //rd.forward(request,response); 
		 HttpSession ses=request.getSession();  
		 ses.setAttribute( "db",database_name);  
		 request.setAttribute("udatabase",database_name);
		 		//-- Return some output to the client 
		 request.getRequestDispatcher("newDataBase.jsp").forward(request, response); 
		 // response.sendRedirect("/newDataBase.jsp");
	}

}
