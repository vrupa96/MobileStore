<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Edit Cart</title>
<script type="text/javascript">

function calculateSubTotal(price){
	var quantity = document.getElementById("quantity").value;
	document.getElementById("subTotal").value = quantity*price;
}

</script>
</head>
<body>
<%@include file="header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="container">
    		<div class="row">
        	<div class="col-sm-12 col-md-10 col-md-offset-1">
        	<c:url value="/updateCart" var="updateCart"></c:url>
        	<form action="${updateCart}" method="post">
        	
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th class="text-center hidden-xs">Total</th>
                        <th> </th>
        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="col-sm-3 col-md-3">
                        <div class="media">
                            <a class="thumbnail pull-left" href="#"> <img class="media-object" src="<c:url value="/resources/images/productImg/${product.productID}.jpg"/>" style="width: 72px; height: 72px;"> </a>
                            <div class="media-body">
                                <h4 class="media-heading">&nbsp;&nbsp;${product.productName}</h4>
                                <span>&nbsp;&nbsp;Status: </span>
                                	<c:set value="${product.stock}" var="stock"></c:set>
                                	<c:if test="${ stock > 0}">
                      					<span class="text-success"><strong> In Stock</strong></span>
                  					</c:if>
                  					<c:if test="${stock <= 0 }">
                  						<span class="text-danger"><strong> Stock Unavailable</strong></span>             
                                    </c:if>
                            </div>
                        </div></td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
                        <select id="quantity" name="quantity" class="form-control" onchange="calculateSubTotal(${product.price});" required>
                        			<option value="0" >---select---</option>
                        	<c:forEach begin="1" end="${product.stock}" varStatus="status">
									<option value="${status.count}">${status.count}</option>
								</c:forEach>
                        </select>
                        </td>
                        
                        <td class="col-sm-1 col-md-1 text-center hidden-xs">
                        	<strong><input type="number" class="form-control" id="subTotal" name="subTotal" value="" readonly/></strong></td>
                        	
                        <td class="col-sm-1 col-md-1">
                        <input type="hidden" id="cartId" name="cartId" value="${cartItem.cartItemId}"/>
        				<input type="hidden" id="prodId" name="prodId" value="${product.productID}"/>
        				<input type="hidden" id="price" name="price" value="${product.price}"/>
                        
                        <button type="submit" class="btn btn-primary form-control">Update</button>
                        </td>
                    </tr>

                    <tr>
                         <td class="hidden-xs">   </td>
                        <td class="hidden-xs">   </td>
                        <td>
                        <a href="<c:url value="/ViewCategories"/>" class="btn btn-default">
                        
                            <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
                            </a>
                        </td>
                    </tr>
                </tbody>
            </table>
            </form>
        </div>
    </div>
</div>

<%@include file="footer.jsp" %>

</body>
</html>