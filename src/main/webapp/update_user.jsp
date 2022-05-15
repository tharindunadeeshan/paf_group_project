<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.*"%>
<%@page import="java.sql.*"%>
<html>
<head>
<title>Sign Up Page</title>
<link rel="stylesheet" href="css/stylesheet.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<%
if (request.getParameter("user_id") != null) {
	User slr = new User();
	
	
	
	
	String user_id = request.getParameter("user_id");
	String user_Name = request.getParameter("user_Name");
	String user_Nic = request.getParameter("user_Nic");
	String user_Email = request.getParameter("user_Email");
	String user_Contact = request.getParameter("user_Contact");
	String user_password = request.getParameter("user_password");
	

	String stsMsg =slr.updateUser(user_id,user_Name,user_Nic,user_Email,user_Contact,user_password); 
%>

<script>
	alert("Update succsees");
	window.location.replace("user_profile.jsp");
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

		<h1>Edit Profile</h1>

		<form>
		<%
				Connection conn;
				PreparedStatement pst;
				ResultSet rs;

				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost/test123", "root", "");

				String id = request.getParameter("id");
				pst = conn.prepareStatement("select * from user_register where user_id=?");

				pst.setString(1, id);
				rs = pst.executeQuery();

				while (rs.next()) {
				%>
		
		<input type="hidden" id="user_id" name=user_id
					value="<%=rs.getString("user_id")%>"> 
		
		
		
		<label for="username">Username</label> 
			<input type="text"name="user_Name" value="<%=rs.getString("user_Name")%>"> 
			
			<label for="user_nic">User NIC</label> 
			<input type="text"name="user_Nic" value="<%=rs.getString("user_Nic")%>"> 
			
			<label for="user_Email">User Email</label> 
			<input type="text"name="user_Email"  value="<%=rs.getString("user_Email")%>">
			
			<label for="user_Contact">User Contact</label> 
			<input type="text"name="user_Contact"  value="<%=rs.getString("user_Contact")%>">
			
			<label for="user_password">User Psssword</label> 
			<input type="text"name="user_password" value="<%=rs.getString("user_password")%>">
			
			
			
			<%
				}
				%>
			 <input type="submit" value="Submit"> 
			 

		</form>

	</div>

</body>
</html>