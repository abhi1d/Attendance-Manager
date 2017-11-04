<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Info</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<link rel="stylesheet" href= "MyStyle.css" type = "text/css">
</head>

<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333333;
   
   
}

li {
    float:right;
     padding: 10px 2px 5px 20px;
     font-size:18px;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 16px;
    text-decoration: none;
}

li a:hover {
    background-color: #111111;
}
#hello{
background-color:white;
margin : 2px;
padding:5px;
border-corner: 5px;
font-color:white;
}
</style>
<body class = "background_specific_user">
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="javax.servlet.*" %>
 <%
 HttpSession ses=request.getSession(false);  
 String n=(String)ses.getAttribute("uname");  
 String first_name = (String)ses.getAttribute("fname");
 HttpSession ses1 = request.getSession();
 ses1.setAttribute("uname",n);
 %>
 <div>
 <br>
 <br>
 <br>
<div  class = "text-center" id = "hello"  ><h3  class = "text-center" font-color="#fffff"> Hello,</h3><h3 class = "text-center" color = "#fff"><% out.print(first_name);%></h3></div>
<br>
<br>
<div class = "row">
<div class = "col-xs-2">
<br>
<br>

<ul>

<li><a href="#" color = "white">Profile</a></li><br>
  <li><a href="Profile.jsp">Attendance</a></li><br>
  <li><a href="Edit.jsp">Edit</a></li><br>
  <li><a href="#">About</a></li><br>
  <br>
  <br>
  <br>
  <br>
</ul>
</div>
</div>

 <br>
 <br>

 <br>
 <br>
 </div>

</body>
</html>