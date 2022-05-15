<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.*"%>
<html>
<head>
<title>Sign Up Page</title>
<link rel="stylesheet" href="css/stylesheet.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<%
if (request.getParameter("user_Name") != null) {
	User userObj = new User();
	String stsMsg = userObj.insertUser(request.getParameter("user_Name"), request.getParameter("user_nic"),
	request.getParameter("user_Email"), request.getParameter("user_Contact"),
	request.getParameter("user_password"));

	session.setAttribute("statusMsg", stsMsg);
%>

<script>
	alert("Reister succsees");
	window.location.replace("user_login.jsp");
</script>

<%
}
%>


<body>


	<nav>
		<input type="checkbox" id="check"> <label for="check"
			class="checkbtn"> <i class="fas fa-bars"></i>
		</label> <img style="max-width: 250px;" class="logo" src="img/mainlogo5.png">

		<ul>
			<li><a class="active" href="#">Home</a></li>
			<li><a href="#">solar request</a></li>
			<li><a href="#">power cut schedule</a></li>
			<li><a href="#">About US</a></li>
			<li><a href="#">COntact Us</a></li>
			<li><a href="#">My Account</a></li>
		</ul>
	</nav>

	<div class="main-box">

		<img src="img/user.png" class="avatar" alt="avatar">

		<h1>Sign Up Here</h1>

		<form>
		<label for="username">Username</label> 
			<input type="text"name="user_Name" placeholder="Enter Username"> 
			
			<label for="user_nic">User NIC</label> 
			<input type="text"name="user_nic" placeholder="Enter user_nic"> 
			
			<label for="user_Email">User Email</label> 
			<input type="text"name="user_Email" placeholder="Enter user_Email">
			
			<label for="user_Contact">User Contact</label> 
			<input type="text"name="user_Contact" placeholder="Enter user_Contact">
			
			<label for="user_password">User PAssword</label> 
			<input type="text"name="user_password" placeholder="Enter user_password">
			
			<label for="password">Password</label> <input type="text" name="password"placeholder="Enter Password">
			 <input type="submit" name="btnSubmit" value="Login"> 
			 <a href="#">Don't have an account?</a>

		</form>

	</div>

</body>
</html>