<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>

<head>

<title>The Mobile Store</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
  <link href='https://fonts.googleapis.com/css?family=Jua' rel='stylesheet'>
  
 <script>
function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}
</script> 
</head>

<style>

/* Remove the jumbotron's default bottom margin */ 
 .jumbotron {
      margin-bottom: 0;
      font-family:'Jua';
    }
    
    .bg-cover {
    background-image: url("resources/images/webPages/header4.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    }
    
    .body {
    font-family:'Jua';
    font-size: 18px;
    }
    
    .affix {
      top: 0;
      width: 100%;
      z-index: 9999 !important;
  }

  .affix + .container-fluid {
      padding-top: 70px;
  }
 
</style>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<c:url value="/resources/images/webPages" var="imgUrl"></c:url>
<c:url value="/" var="url"></c:url>
<body class="body">
<div class="jumbotron jumbotron bg-cover">
		<div class="background">
  			<div class="container text-center">
    			<h1>Motivo Store</h1>      
    			<%-- <h4><p><img src="${imgUrl}/titleIcon.png" alt="ICON"></p></h4> --%>
  			</div>
		</div>
</div>
<nav class="navbar navbar-inverse" ><!-- data-spy="affix" data-offset-top="197" -->
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" onclick="topFunction()" id="top"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="<c:url value = "/"/>">Home</a></li>
        <c:if test="${pageContext.request.userPrincipal.name == null}">
        <li><a href="login">Login</a></li>
        <li><a href="register">Register</a></li>
        </c:if>
        <security:authorize access="hasRole('ROLE_ADMIN')">
        <li><a href="Supplier">Seller</a></li>
        <li><a href="Category">Category</a></li>
        <li><a href="Product">Product</a></li>
        </security:authorize>
        <security:authorize access="hasRole('ROLE_USER')">
        <li><a href="${url}ViewCategories">Shop By Product</a></li>
        </security:authorize>
        <li><a href="${url}aboutUs">About Us</a></li>
        <li><a href="#">Stores</a></li>  
      </ul>
      
      
      <ul class="nav navbar-nav navbar-right">
      <c:if test="${pageContext.request.userPrincipal.name != null}">
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
        <span class="glyphicon glyphicon-user"></span>&nbsp;${pageContext.request.userPrincipal.name}</a>
        		<ul class="dropdown-menu">
        		<security:authorize access="hasRole('ROLE_USER')">
            <li><a href="<c:url value="/viewOrders"/>">Your Orders</a></li>
            	</security:authorize>
            <li><a href="#">Manage Account</a></li>
         		 </ul>
        </li>
        <security:authorize access="hasRole('ROLE_USER')">
        <li><a href="<c:url value = "/viewCart"/>"><span class="glyphicon glyphicon-shopping-cart"></span> Cart<span class="badge">${cartSize}</span></a></li>
        </security:authorize>
        <li><a href="<c:url value = "/logout"/>"><span class="glyphicon glyphicon-off"></span>&nbsp;Logout</a></li>
        </c:if>
      </ul>
    </div>
  </div>
</nav>

</body>
</html>