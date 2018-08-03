<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
  	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<!------ Include the above in your HEAD tag ---------->

<!-- Social Footer, Colour Matching Icons -->
<!-- Include Font Awesome Stylesheet in Header -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet"  crossorigin="anonymous">

<style type="text/css">

.social:hover {
     -webkit-transform: scale(1.1);
     -moz-transform: scale(1.1);
     -o-transform: scale(1.1);
 }
 .social {
     -webkit-transform: scale(0.8);
     /* Browser Variations: */
     
     -moz-transform: scale(0.8);
     -o-transform: scale(0.8);
     -webkit-transition-duration: 0.5s;
     -moz-transition-duration: 0.5s;
     -o-transition-duration: 0.5s;
 }

/*
    Multicoloured Hover Variations
*/
 
 #social-fb:hover {
     color: #3b5998;
 }
 #social-tw:hover {
     color: #1da1f2;
 }
 #social-gp:hover {
     color: #d34836;
 }
 #social-em:hover {
     color: #f39c12;
 }
  #social-ig:hover {
     color: #e4405f;
 }
  #social-gh:hover {
     color: #f5f5f5;
 }
 #social-li:hover {
     color: #8d6cab;
 }
 .center-block {
     background-color: #222;
     border-color: #080808;
}

.container {
width: 100%;
}
</style>
</head>

<body>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/resources/images/webPages" var="imgUrl"></c:url>

<nav class="navbar navbar-inverse">
<div class="container text-center">
    <hr>
            <p>- themobilestore.com -</p>
            <br />
                <a href="https://www.facebook.com"><i id="social-fb" class="fa fa-facebook-square fa-3x social"></i></a>
	            <a href="https://twitter.com"><i id="social-tw" class="fa fa-twitter-square fa-3x social"></i></a>
	            <a href="https://plus.google.com"><i id="social-gp" class="fa fa-google-plus-square fa-3x social"></i></a>
	            <a href="mailto:bugcreeper@protonmail.com"><i id="social-em" class="fa fa-envelope-square fa-3x social"></i></a>
	            <a href="https://www.instagram.com"><i id="social-ig" class="fa fa-instagram fa-3x social"></i></a>
	            <a href="https://github.com/"><i id="social-gh" class="fa fa-github-square fa-3x social"></i></a>
	             <a href="https://www.linkedin.com"><i id="social-li" class="fa fa-linkedin-square fa-3x social"></i></a>
	            <%--  <img src="${imgUrl}/footerImg.png" alt="footerIcon" align="middle">
	             --%>
    <hr>
</div>	
 </nav>  
</body>
</html>


