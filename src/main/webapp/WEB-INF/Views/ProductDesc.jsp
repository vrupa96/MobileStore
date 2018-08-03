<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Product Description</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
.style_featured{
    padding: 20px 0;
    text-align: center;
}
.style_featured > div > div{
    padding: 10px;
    border: 1px solid transparent;
    border-radius: 4px;
    transition: 0.5s;
}
.style_featured > div:hover > div{
	border-radius: 15%;
    border: 1px solid rgb(153, 200, 250);
    box-shadow: rgba(0, 0, 0, 0.1) 0px 9px 9px 9px;
    background: rgba(153, 200, 250, 0.1);
    transition: 0.55s;
}
</style>

</head>
<body>
<%@include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<h3 align = "center"> Product Page</h3>

		<c:url value="/resources/images/productImg" var="imgUrl"></c:url>

<div class="container">
        <div class="row style_featured">
        <c:forEach items="${showProducts}" var="product">
            <div class="col-md-4">
                <div>
                    <img src="${imgUrl}/${product.productID}.jpg" alt="" class="img-rounded img-thumbnail" style="height: 200px; width: 300px; border: 0px;"/>
                    <h2>${product.productName}</h2>
                  
                    <a href="<c:url value = "/ProductPage/${product.productID}"/>"><button class="btn btn1">View</button></a>

                    
                </div>
            </div>
           </c:forEach>
        </div>
    </div>
	
<%@include file="footer.jsp" %>
</body>
</html>