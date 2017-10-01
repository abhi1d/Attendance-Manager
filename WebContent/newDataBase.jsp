<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<html>
    <head>
        <title>User Table</title>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<link rel="stylesheet" href= "MyStyle.css" type = "text/css">
    </head>
    
    <body>
        <%
            String name = (String)request.getAttribute("udatabase");
           // out.println("name is : "+name);
            String connectionURL = "jdbc:mysql://localhost:3306/attendenceManager";
            Connection connection = null;
            Statement statement = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                connection = DriverManager.getConnection(connectionURL, "root", "root");
                statement = connection.createStatement();
                String QueryStringForSub = "create table "+name+"Sub (sub varchar(20),attend " +
                        "int , primary key(sub));";
                        String QueryStringForLab = "create table "+name+"Lab (lab varchar(20),attend " +
                                "int , primary key(lab));";        
                statement.executeUpdate(QueryStringForSub);
                statement.executeUpdate(QueryStringForLab);
                        %> 
                        Table of specified name is created successfully.
            <%      }
                        catch (Exception ex) {
                        out.println("<h2>you already Created database with this name</h2> <br><h2>go to back <a href'specificUser.jsp'>Home</a>");	
                        } 
                        finally {
                 
                statement.close();
                connection.close();
                
            }
            %>
            Go to Back <a href = "specificUser.jsp">Back</a>
    </body>
</html>