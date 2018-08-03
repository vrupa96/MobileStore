<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Login Page</title>

  <link href='https://fonts.googleapis.com/css?family=Jua' rel='stylesheet'>
  
  <style type="text/css">
  .bg { 
 /*  background: url("resources/images/webPages/background2.jpg"); */
  background-repeat: no-repeat; 
  background-size: cover;
}

.panel-default {
opacity: 0.8;
margin-top:100px;
}
.form-group.last { margin-bottom:0px; }

#username, #password {
border-radius: 5px;
}

.btn {
     background-color: #222;
     border-color: #080808;
     color: white;
}
.btn:hover {
	color: #222;
	background-color: #D2D7D3;
}

.signup:hover {
color: #F5E050;
}
  </style> 
</head>
<body>
<%@include file="header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="bg">
<div class ="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-5">
		<div class="panel panel-default">
			<div class="panel-heading">
                    <span class="glyphicon glyphicon-lock"></span> Login</div>
                <div class="panel-body">
                
                <c:url var="loginURL" value="/perform_login"/>
                    <form id="loginForm" action="${loginURL}" method="post" class="form-horizontal" role="form" >
                    <div class="form-group">
                        <label for="username" class="col-sm-3 control-label">
                            Email</label>
                        <div class="col-sm-9">
                            <input type="email" id="username" name="username" placeholder="Enter registered mail" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-3 control-label">
                            Password</label>
                        <div class="col-sm-9">
                            <input type="password" id="password" name="password" placeholder="Enter Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
				title="Must contain at least one number and one uppercase and lowercase letter, 
							and at least 8 or more characters" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"/>
                                    Remember me
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group last">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="submit" class="btn btn1">
                                Sign in</button>
                                 <button type="reset" class="btn btn2">
                                Reset</button>
                        </div>
                    </div>
                    </form>
                    <p align="center">New User?  <a class="signup" href="<c:url value ="/register"/>" style="text-decoration: none;">Sign Up here...</a></p>
                </div>
		</div>
		</div>
	</div>
<br>
<br>
<br>
</div>  
</div>
<%@include file="footer.jsp" %>
</body>
</html>