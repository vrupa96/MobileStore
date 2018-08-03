<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Product Page</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>
.zoom {
    transition: transform .2s; /* Animation */
}

.zoom:hover {
    transform: scale(0.9); /* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
}

input {
	border: none;
	
}
</style>

<script type="text/javascript">
function sum() {
	var priceValue = document.getElementById('price').value;
	var quantityValue = document.getElementById('quantity').value;
	
	var result = parseInt(priceValue) * parseInt(quantityValue);
	
	if(!isNaN(result)) {
		document.getElementById('total').value = result;
	}
}
</script>

</head>
<body>
<%@include file="header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
			
<div class="container">
    <div class="row">
    <c:url value="/addToCart/${viewProduct.productID}" var="addToCart"></c:url>
			<form action="${addToCart}" method="post">
    	<div class="col-md-12 col-md-offset-3" >
			<div class="col-sm-12 col-md-4">		
				<div class="thumbnail" >
					<h3 class="text-center"><span class="label label-default" style="text-transform: uppercase">${category.categoryName}</span></h3>
					<div class= "zoom">
					<img src="<c:url value="/resources/images/productImg/${productID}.jpg"/>" class="img-responsive">
					</div>
					<div class="caption">
						<div class="row">
							<div class="col-md-6 col-xs-6">
								<h3>${viewProduct.productName}</h3>
							</div>
							<div class="col-md-6 col-xs-6 price">
								<h3>
								<label><input type="hidden" id="price" name="price" readonly value="${viewProduct.price}" class="form-control"> ${viewProduct.price}</label></h3>
							</div>
						</div>
						<div class="row" align="center">
						<textarea rows="3" cols="40" class="form-control"  style="max-height: 150px; max-width: 225px; min-width: 225px; min-height: 30px; border-style: hidden;" >${viewProduct.productDesc}</textarea>
						<p></p>
						</div>
						<div class="row">
							<div class="col-md-6">
								<select class="form-control" title="select quantity" id="quantity" name="quantity" onmouseup="sum();" onclick="sum();" required>
								<c:forEach begin="1" end="${viewProduct.stock}" varStatus="status">
										<option value="${status.count}" class="form-control">${status.count}</option>
									</c:forEach>
								</select> 
							</div>
							<div class="col-md-6">
								<button type="submit" class="btn btn-success form-control"><span class="glyphicon glyphicon-shopping-cart"></span> Add to Cart</button>
							</div>
						</div>
						<p> </p>
						<div class="row">
						<div class="col-md-6">
								<input type="text" class="form-control" readonly id="total" name="total" value="" required/>
							</div>
						</div>
						

						<p> </p>
					</div>
				</div>
			</div>
			</div>
</form>           
			</div>
        </div> 
<%@include  file="footer.jsp"%>
</body>
</html>