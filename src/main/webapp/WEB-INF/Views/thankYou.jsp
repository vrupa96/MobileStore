<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Thank You</title>
</head>
<body>
<%@include file="header.jsp" %>

<div class="container" style="margin-top:5%;">
	<div class="row">
        <div class="jumbotron" style="box-shadow: 2px 2px 4px #000000;">
            <h3>Thank You ${username}</h3>
            <div class="row">
            <h4>Your Order ID is ${orderID}</h4>
            </div>
        <div class="row">
        Your order will be delivered within 7 business days. Kindly find the seller Details.
        </div>
        	<div class="row">
        	<div class="col-sm-12 col-md-5 col-lg-5 col-md-offset-3">
        		 <table class="table table-hover">
			<thead>
			      <tr>
			        <th>Product</th>
			        <th>Seller</th>
			      </tr>
			    </thead>
			    <tbody>
			    <c:forEach items="${productSupplierMap}" var="details">
			      <tr>
			        <td>${details.key}</td>
			        <td>${details.value}</td>
			      </tr>
			    </c:forEach>
			     <tr>
			        <td></td>
			        <td><a href="<c:url value = "/"/>" class="btn btn-lg btn-secondary">Continue Shopping</a></td>
			      </tr>
			    </tbody>			  
  </table>
        	</div>
            </div>
        </div>
	</div>
	
</div>
<%@include file="footer.jsp" %>
</body>
</html>