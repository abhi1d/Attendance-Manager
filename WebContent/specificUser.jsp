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
 <div >
 <br>
 <br>
 <br>
<h3  class = "text-center" style ="font-color:white;"> Hello,</h3><h3 class = "text-center"><% out.println(first_name);%></h3>
<br>
<br>
 <h1  class = "text-center"><a href = "Profile.jsp"><button class = "btn btn-default btn-primary">Profile</button></a></h1><br><br>
 <h1 class = "text-center"><a href = "Edit.html"><button class = "btn btn-default btn-primary" >Edit</button></a></h1>

 <br>
 <br>

 <br>
 <br>
 </div>

</body>
</html>