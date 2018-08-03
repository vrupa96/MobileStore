<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Register Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-formhelpers/2.3.0/css/bootstrap-formhelpers.css"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-formhelpers/2.3.0/css/bootstrap-formhelpers.min.css"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-formhelpers/2.3.0/js/bootstrap-formhelpers.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-formhelpers/2.3.0/js/bootstrap-formhelpers.min.js"></script>
  
  <link href='https://fonts.googleapis.com/css?family=Jua' rel='stylesheet'>
  
  
  <style type="text/css">
  #country, #state {
  width: 225px;
  height: 32px;
  }
  
   .bg { 
  background: url("resources/images/webPages/background3.jpg");
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
.login:hover {
color: #F5E050;
}
#pswd, #cpswd, #phone, #country, #state, #city, #pin, #mail, #uname {
border-radius: 5px;
}
  </style>
</head>
<body>
<%@include file="header.jsp" %>


<div class="bg">
<div class ="container">
	<div class="row">
		<div class="col-md-5 col-md-offset-5">
		<div class="panel panel-default">
			<div class="panel-heading">
                    <span class="glyphicon glyphicon-user"></span> Register</div>
                <div class="panel-body">
                
                    <form id="registerForm" action="AddUser" method="post" class="form-horizontal" role="form" >
                    <div class="form-group">
                        <label for="uname" class="col-sm-3 control-label">
                            UserName</label>
                        <div class="col-sm-9">
                            <input type = "text" id= "uname" name ="uname" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="mail" class="col-sm-3 control-label">
                            E-mail</label>
                        <div class="col-sm-9">
                            <input type="email" id ="mail" name = "mail" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pswd" class="col-sm-3 control-label">
                            Password</label>
                        <div class="col-sm-9">
                            <input type = "password" id= "pswd" name ="pswd"pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
							title="Must contain at least one number and one uppercase and lowercase letter, 
							and at least 8 or more characters" onkeyup='check();' required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cpswd" class="col-sm-3 control-label">
                            Confirm Password</label>
                        <div class="col-sm-9">
                            <input type="password" id ="cpswd" name = "cpswd" onkeyup='check();' required/>
							<span id="msg"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-sm-3 control-label">
                            Phone</label>
                        <div class="col-sm-9">
                            <input type="tel" id ="phone" name = "phone" pattern="[6789][0-9]{9}" required/>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="country" class="col-sm-3 control-label">
                            Country</label>
                        <div class="col-sm-9">
                            <select id = "country" name="country" class="input-medium bfh-countries" data-country="US" ></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="state" class="col-sm-3 control-label">
                            State</label>
                        <div class="col-sm-9">
                            <select id = "state" name="state" class="bfh-states" data-country = "country"></select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="city" class="col-sm-3 control-label">
                            City</label>
                        <div class="col-sm-9">
                            <input type="text" id = "city" name= "city" required/>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="pin" class="col-sm-3 control-label">
                            Pincode</label>
                        <div class="col-sm-9">
                            <input type="number" id = "pin" name = "pin" pattern="[0-9]{6}" required />
                        </div>
                    </div>
                    	
                    <div class="form-group last">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="submit" class="btn btn1">
                                Sign Up</button>
                                 <button type="reset" class="btn btn2">
                                Reset</button>
                        </div>
                    </div>
                    </form>
                    <p align="center">Existing User?  <a class="login" href="<c:url value ="/login"/>" style="text-decoration: none;">Login here...</a></p>
                </div>
		</div>
		</div>
	</div>
<br>
<br>
<br>
</div>  
</div>

	<script type="text/javascript">
function check() {
	if (document.getElementById('pswd').value == 
		document.getElementById('cpswd').value) {
		document.getElementById('msg').style.color = 'green';
		document.getElementById('msg').innerHTML = 'Matching';
	} else {
		document.getElementById('msg').style.color = 'red';
		document.getElementById('msg').innerHTML = 'Not matching';
	}
}
</script>
<%@include file="footer.jsp" %>
</body>
</html>