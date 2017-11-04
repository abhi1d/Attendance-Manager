<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<html>
    <head>
        <title>Profile</title>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<link rel="stylesheet" href= "profile.css" type = "text/css">
    </head>
    
    <body>
        <%
        HttpSession ses=request.getSession(false);  
        String db_name=(String)ses.getAttribute("db");
        String user_name = (String)ses.getAttribute("usr");
        HttpSession ses1=request.getSession();  
        ses1.setAttribute("db_name",db_name);
       %>
       <br>
       <br>
       <h2 class = "text-center"><strong>Attendance Table </strong></h2>
       <br>
       <br>
        <table  align="center">
  <tr>
    <th><h3><strong>SUB/LAB</strong></h3></th>
    <th><h3><strong>Attendance</strong></h3></th>
  </tr>
  
  <%
  
  String connectionURL = "jdbc:mysql://localhost:3306/attendenceManager";
  Connection connection = null;
  Statement statement = null;
  try {
       Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
       connection = DriverManager.getConnection(connectionURL, "root", "root");
       
  }catch(Exception e)
  {
	  out.println("Error in Database connection let me fix");
  }
  PreparedStatement pstmt_Sub = null;
  PreparedStatement pstmt_Lab = null;
  try {
    pstmt_Lab = (PreparedStatement) connection.prepareStatement("select * from "+db_name+"Lab;");
    pstmt_Sub = (PreparedStatement) connection.prepareStatement("select * from "+db_name+"Sub;");
     } catch (SQLException e1) {
    	 out.println("Error in query extraction from database ! \n let me fix");
 }
            	
  ResultSet rs = null;
  try {
    rs =pstmt_Sub.executeQuery();
    } catch (SQLException e) {
    	out.println("Error in Execute Query !\n let me fix");
    } 
  try {
     while(rs.next()) {
        String sub = rs.getString("sub");
        String attend = rs.getString("attend");
        HttpSession ses3=request.getSession();  
        ses3.setAttribute("sub",sub);
        ses3.setAttribute("db_name",db_name+"Sub");
        ses3.setAttribute("attend",attend);
        %>
    <tr>
    <td><%out.print(sub);%></td>
    <td><button  class = "btn btn-default btn-danger"  id = "dec_button" ><h6 style = "padding:15px;">-</h6></button><%out.print(attend);%><a href = "incrementSub.jsp"><button class = "btn btn-default btn-success"  id = "inr_button"><h6 style = "padding:15px;">+</h6></button></a></td>
     
    </tr>
        <% 
        
       }
    } catch (SQLException e) {
   	 out.println("Error in making tables ! \n let me fix");
     		
    }        	
 ResultSet rs1 = null;
  try {
    rs =pstmt_Lab.executeQuery();
    } catch (SQLException e) {
    	out.println("Error in Execute Query !\n let me fix");
    } 
  try {
     while(rs.next()) {
        String lab = rs.getString("lab");
        String attend = rs.getString("attend");
        HttpSession ses2=request.getSession();  
        ses2.setAttribute("sub",lab);
        ses2.setAttribute("db_name",db_name+"Lab");
        ses2.setAttribute("attend",attend);
        
        
        %>
    <tr>
    <td><%out.print(lab);%></td>
    <td><a href = "decrement.java"><button  class = "btn-danger"  id = "dec_button" ><h6 style = "padding:15px;">-</h6></button></a><%out.print(attend);%><a href = "incrementLab.jsp"><button class = "btn-success"  id = "inr_button"><h6 style = "padding:15px;">+</h6></button></a></td>
      
    </tr>
        <% 
        
        
       }
    } catch (SQLException e) {
   	 out.println("Error in making tables ! \n let me fix");
     		
    }        	
 %>

</table>

    </body>
</html>