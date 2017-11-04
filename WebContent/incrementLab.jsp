<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Attedance Loading ...</title>
</head>

<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="javax.servlet.*" %>
<%
HttpSession ses2=request.getSession(false);  
String lab = (String)ses2.getAttribute("sub");
String db_name = (String)ses2.getAttribute("db_name");
int attend = Integer.parseInt((String)ses2.getAttribute("attend"));
out.println(lab);
out.println(db_name);
out.println(attend);
int newAttend = attend;
String connectionURL = "jdbc:mysql://localhost:3306/attendenceManager";
Connection connection = null;
Statement statement = null;
try {
    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
    connection = DriverManager.getConnection(connectionURL, "root", "root");
    statement = connection.createStatement();
   String QueryStringForLab = "select * from "+db_name+";";        
    //statement.executeUpdate(QueryStringForSub);
    ResultSet rs = statement.executeQuery(QueryStringForLab);
    while(rs.next())
    {
    	if(lab.equals(rs.getString("lab")))
    	{
    		newAttend++; 
    	}
    }
}
catch(Exception e)
{
	out.println("Something went wrong\n check your connection");
}
attend = newAttend;
out.println(attend);


PreparedStatement ps = null;

String sql="Update "+db_name+" set attend = " +attend + " where lab = '"+lab+"'";
ps = connection.prepareStatement(sql);
int i = ps.executeUpdate();
if(i > 0)
{
	
  	response.sendRedirect("Profile.jsp");
}
else
{
	out.println("Error Occured");	
} 

%>   
</body>
</html>