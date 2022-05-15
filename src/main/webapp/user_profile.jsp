<%@page import="model.User"%>
<%@page import="com.mysql.cj.jdbc.PreparedStatementWrapper"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
if (request.getParameter("id") != null) {

	String id = request.getParameter("id");

	User solar = new User();

	solar.deleteUser(id);
%>
<script>
	alert("delete succsees");
	window.location.replace("user_profile.jsp");
</script>

<%
}
%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Interruption Details</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="css/style.css">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>


<style type="text/css">
body {
	color: #404E67;
	background: #F5F7FA;
	font-family: 'Open Sans', sans-serif;
}

.table-wrapper {
	width: 1000px;
	margin: 10px auto;
	background: #fff;
	padding: 20px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 10px;
	margin: 0 0 10px;
}

.table-title h2 {
	margin: 6px 0 0;
	font-size: 22px;
}

.table-title .add-new {
	float: right;
	height: 30px;
	font-weight: bold;
	font-size: 12px;
	text-shadow: none;
	min-width: 100px;
	border-radius: 50px;
	line-height: 13px;
}

.table-title .add-new i {
	margin-right: 4px;
}



table.table tr th, table.table tr td {
	border-color: #e9e9e9;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table th:last-child {
	width: 100px;
}

table.table td a {
	cursor: pointer;
	display: inline-block;
	margin: 0 1px;
	min-width: 12px;
}

table.table td a.add {
	color: #27C46B;
}

table.table td a.edit {
	color: #FFC107;
}

table.table td a.delete {
	color: #E34724;
}

table.table td i {
	font-size: 19px;
}

table.table td a.add i {
	font-size: 24px;
	margin-right: -1px;
	position: relative;
	top: 3px;
}

table.table .form-control {
	height: 32px;
	line-height: 32px;
	box-shadow: none;
	border-radius: 2px;
}

table.table .form-control.error {
	border-color: #f50000;
}

table.table td .add {
	display: none;
}
</style>

</head>
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
	<section>
		<div class="container">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-8">
							<h2>
								Customer <b>Solar Details</b>
							</h2>
						</div>
						<div class="col-sm-4">
							<button type="button" class="btn btn-info add-new">
								<i class="fa fa-plus"></i> Add New
							</button>
						</div>
					</div>
				</div>
				<table class="table table-bordered">
					<thead>
						<tr>
							
							<th>User id</th>
							<th>User Name</th>
							<th>User NIC</th>
							<th>User Email</th>
							<th>User Contact</th>
							
							<th>Actions</th>
						</tr>
					</thead>
					<%
					Connection conn;
					PreparedStatementWrapper pst;
					ResultSet rs;

					Class.forName("com.mysql.jdbc.Driver");

					conn = DriverManager.getConnection("jdbc:mysql://localhost/test123", "root", "");

					String query = "select * from user_register";
					Statement st = conn.createStatement();

					rs = st.executeQuery(query);

					while (rs.next()) {

						String id = rs.getString("user_id");

						
					%>



					<tbody>

						<tr>
							<td><%=rs.getString("user_id")%></td>
							<td><%=rs.getString("user_Name")%></td>
							<td><%=rs.getString("user_Nic")%></td>
							<td><%=rs.getString("user_Email")%></td>
							<td><%=rs.getString("user_Contact")%></td>
							
							
							
							
							<td><a class="add" title="Add" data-toggle="tooltip"><i
									class="material-icons">&#xE03B;</i></a> 
									
									<a class="edit" title="Edit" data-toggle="tooltip"href="update_user.jsp?id=<%=rs.getString("user_id")%>"><i class="material-icons">&#xE254;</i></a>
									
									 <a class="delete"
								title="Delete" href="?id=<%=rs.getString("user_id")%>"><i
									class="material-icons">&#xE872;</i></a></td>
						<tr>
					</tbody>
					<%
					}
					%>
				</table>
			</div>
		</div>


	</section>


</body>
</html>