

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
 * Servlet implementation class increment
 */
@WebServlet("/increment")
public class increment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 HttpSession session=request.getSession(false);  
		  String db_name = (String)session.getAttribute("db_name");
		  String attend = (String)session.getAttribute("attend");
		  String sub  = (String)session.getAttribute("sub");
		  

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
			pstmt = (PreparedStatement) con.prepareStatement("select * from "+db_name);
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
				  String lab = rs.getString("lab");
				  String attend1 = rs.getString("attend");
				  if(lab.equals(sub))
				  {
					 int attendance = Integer.parseInt(attend1);
					 attendance++;
					 
				        Statement statement = (Statement) con.createStatement();

			            String command = "update "+db_name+" set attend = "+attendance+" where lab = "+lab ;
			            ((java.sql.Statement) statement).executeUpdate(command);  
					 RequestDispatcher rd = request.getRequestDispatcher("/Profile.jsp");
					 rd.forward(request,response);
				  }
			
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch blobhishck
				e.printStackTrace();
			}
			

			}
}
