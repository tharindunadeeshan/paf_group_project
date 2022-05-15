<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.*"%>  
    
<%
if (request.getParameter("user_Email") != null) {
	
	String email=request.getParameter("user_Email");
	String pass=request.getParameter("user_password");
	
	out.println(email + pass);
	
	User slarObj = new User();
	
	
	if(slarObj.check(email, pass)){
		// out.println("ok");
		
		//session set email;
		//page redirect
	
		 
		HttpSession session2 = request.getSession();
        session.setAttribute("email", email);
        response.sendRedirect("user_profile.jsp");
		
		
	}else if(slarObj.admincheck(email, pass)){
		  //  block of code to be executed if the condition1 is false and condition2 is true
		  
		HttpSession session2 = request.getSession();
        session.setAttribute("email", email);
        response.sendRedirect("user_profile.jsp");
	}
	
	
	else{
		out.println("no");
		
		
        response.sendRedirect("#");
		
	}
		
}else{
	//out.println("xxx");
}
%>    
    
    
<html>
    <head>
        <title>Login Page</title>
        <link rel="stylesheet" href="css/stylesheet2.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>


            <nav>
        <input type="checkbox" id="check">
        <label for="check" class="checkbtn">
            <i class="fas fa-bars"></i>
        </label>
        <img style="max-width: 250px;" class="logo" src="img/mainlogo5.png">
        
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

            <h1>Login Here</h1>

            <form>

                <label for="user_Email">Email</label>
                <input type="text" name="user_Email" placeholder="Enter Email">

                <label for="user_password">Password</label>
                <input type="text" name="user_password" placeholder="Enter Password">

                <input type="submit" name="btnSubmit  value="Login">

                
                <a href="#">Don't have an account?</a>

            </form>

        </div>

    </body>
</html>