

import java.beans.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.jdbc.PreparedStatement;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userid=request.getParameter("usr"); 
		//session.putValue("userid",userid); 
		String pwd=request.getParameter("pwd"); 
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
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
		pstmt = (PreparedStatement) con.prepareStatement("select * from attendence");
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
		ResultSet rs = null;
		try {
			rs =pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		//rs = st.executeQuery(query);
		 PrintWriter out = response.getWriter();
		try {
			while(rs.next()) {
			  String name = rs.getString("username");
			  String uid = rs.getString("password");
			  if(name.equals(userid) && uid.equals(pwd))
			  {
				  
				  String fname = rs.getString("firstName");
				  String lname = rs.getString("lastName");
				  HttpSession session=request.getSession();  
				  session.setAttribute("fname",fname);
				  session.setAttribute("lname",lname);
				  session.setAttribute("usr",name);
				  session.setAttribute("pwd",uid);
				  
				 // response.sendRedirect("/specificUser.jsp");
			        
				  RequestDispatcher rd = request.getRequestDispatcher("/specificUser.jsp");
				 rd.forward(request,response);
			  }
			  
			   out.println(uid+ ":" + name);
			   out.println();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch blobhishck
			e.printStackTrace();
		}
		try {
			if(rs.next()) 
			{ 
			if(rs.getString(2).equals(pwd)) 
			{ 
			out.println("welcome"+userid); 

			} 
			else 
			{ 
			out.println("Invalid password try again"); 
			} 
}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
