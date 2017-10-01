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
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fname=request.getParameter("fname");
		String lname = request.getParameter("lname");
		String uname=request.getParameter("uname");
	    String pass=request.getParameter("pass");
	    String pass1=request.getParameter("pass1");
	    PrintWriter out = response.getWriter();
	    boolean st=false;
	    
	    if(!pass.equals(pass1))
	    {
	    	ServletContext context= getServletContext();
			RequestDispatcher rd= context.getRequestDispatcher("/index.html");
			out.println("<font color=red>password did not match</font>");
			rd.include(request, response);
	    }
	    else {

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
	pstmt=(PreparedStatement) con.prepareStatement("select * from attendence where uname='"+uname+"'");
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
		RequestDispatcher rd= context.getRequestDispatcher("/index.html");
		out.println("<font color=red>username already exists</font>");
		rd.include(request, response);
	 
 }
	 else
 {
 try {
	pstmt = (PreparedStatement) con.prepareStatement("insert into attendence values('"+fname+"','"+lname+"','"+uname+"','"+pass+"')");
} catch (SQLException e2) {
	// TODO Auto-generated catch block
	e2.printStackTrace();
}
		try {
			 int rs1 = pstmt.executeUpdate();
			if( rs1 > 0)
			{
				//out.println("You are successfully registered");
			ServletContext context= getServletContext();
			RequestDispatcher rd= context.getRequestDispatcher("/home.html");
			out.println("<font color=blue>You are Successfully registered \n</font>");
			rd.include(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    }
	   }
	}


	}

