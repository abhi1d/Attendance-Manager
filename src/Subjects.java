import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.jdbc.PreparedStatement;

//import com.mysql.cj.jdbc.PreparedStatement;

import com.mysql.cj.jdbc.PreparedStatement;

/**
 * Servlet implementation class go
 */
@WebServlet("/Subjects")
public class Subjects extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String s_name=request.getParameter("subname");
        String database_name = request.getParameter("database_name");
		int at=0;
	    PrintWriter out = response.getWriter();
	    out.println("good");
	   boolean st=false;

		try{
			Class.forName("com.mysql.cj.jdbc.Driver");	
	}
		catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 
	java.sql.Connection con = null;
	try {
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/attendenceManager","root","root");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 
	//Statement st = null;
 PreparedStatement pstmt = null;
	
 try {
	pstmt=(PreparedStatement) con.prepareStatement("select * from "+database_name+"Sub where name='"+s_name+"'");
	ResultSet rs =pstmt.executeQuery();
	 //rs1=pstmt.executeUpdate();
	st=rs.next();
} catch (SQLException e1) {
	// TODO Auto-generated catch block
	e1.printStackTrace();
}
 if(st)
 {
	 ServletContext context= getServletContext();
		RequestDispatcher rd= context.getRequestDispatcher("/Edit.html");
		out.println("<font color=red>Subject already exists</font>");
		rd.include(request, response);
	 
 }
	 else
 {
 try {
	pstmt = (PreparedStatement) con.prepareStatement("insert into "+database_name+"Sub values('"+s_name+"','"+at+"')");
} catch (SQLException e2) {
	// TODO Auto-generated catch block
	e2.printStackTrace();
}
		try {
			 int rs1 = pstmt.executeUpdate();
			if( rs1 > 0)
			{
				//out.println("You are successfully registered");
			/*ServletContext context= getServletContext();
			RequestDispatcher rd= context.getRequestDispatcher("/Edit.html");
			out.println("<font color=blue>You have Successfully added your subject \n</font>");
			rd.include(request, response);
			
			ServletContext context1= getServletContext();
			RequestDispatcher rd1= context1.getRequestDispatcher("/home.html");
			out.println("<font color=blue>Go back \n</font>");
			rd1.include(request, response);*/
			out.println("<h2>You successfully added subject to your profile</h2>");
			out.println("<br>");
			out.println("<h2>If you want to add more then <a href = 'Edit.html'>click Here</a></h2>");
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    }
	    
	   }



	}
