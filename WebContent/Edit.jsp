<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit your Profile</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
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
<body class = "background_specific_user" >
  <div>
  <%
   HttpSession ses = request.getSession(false);
   String db = (String)ses.getAttribute("usr");
   
   HttpSession ses1 = request.getSession();
 ses1.setAttribute("db_name",db);
  %>
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
 <div class = "col-xs-10"> 
   <h2>Have you created a database ?</h2>
   
       <a href="Interconnection"><button>No</button></a>
      <a href="specificUser.jsp"><button>Yes</button></a>
     <br>
     <br>
     <br>
  

      <h2>Haven't you added labs or Subjects to your profile ? </h2>
           <br>
      <h1> <a href = "lab.jsp"><button class = "btn btn-default btn-primary">Add Labs To Your Profile</button></a></h1>
        
         <br>
        <h1> <a href = "subject.jsp"><button class = "btn btn-default btn-primary">Add Subjects To Your Profile</button></a></h1>
         <br>
         <br>
      
   </div>
   </div>
   
</body>
</html>