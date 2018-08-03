<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart page</title>

</head>
<body>
<%@include file="header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


		<c:if test="${empty cartList}">
        	<h3 align="center">Your Cart is empty!</h3>
        	<a style="align:center;" href="ViewCategories" class="btn btn-primary" role="button">Continue Shopping</a>        
        </c:if>
        
        <c:if test="${not empty cartList}">
        
		<div class="container">
    		<div class="row">
        	<div class="col-sm-12 col-md-10 col-md-offset-1">
        	<c:url value="/confirmOrder" var="confirmOrder"></c:url>
        	<form:form action="${confirmOrder}" >
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
                		<c:set var="tot" value="0"></c:set>
                <c:forEach items="${cartList}" var="cart">
                	<c:set var = "productIdFromCart" value = "${cart.productId}"/>
                		<c:forEach items="${productDetails}" var="prod">
                		<c:set var = "productIdFromProductList" value = "${prod.key}"/>
                			<c:if test="${productIdFromCart==productIdFromProductList}">
								<c:set var="productName" value="${prod.value}" />
							</c:if>
                		</c:forEach>
                    <tr>
                        <td class="col-sm-3 col-md-3">
                        <div class="media">
                            <a class="thumbnail pull-left" href="#"> <img class="media-object" src="<c:url value="/resources/images/productImg/${cart.productId}.jpg"/>" style="width: 72px; height: 72px;"> </a>
                            <div class="media-body">
                                <h4 class="media-heading">&nbsp;&nbsp;${productName}</h4>
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
                        <input type="number" class="form-control" id="quantity" value="${cart.quantity}" readonly/>
                        </td>
                        
                        <td class="col-sm-1 col-md-1 text-center hidden-xs">
                        	<strong><input type="number" readonly class="form-control" id="total" value="${cart.subTotal}"></strong></td>
                        	<c:set var="t" value="${cart.subTotal}"></c:set>
                                 <c:set var="tot" value="${tot+t }"></c:set>
                        <td class="col-sm-1 col-md-1">
                        <div class="btn-group btn-group-sm">
                        	<a href="<c:url value = "/editCart/${cart.cartItemId}"/>"><button type="button" class="btn btn-primary">
                             Update
                        </button></a>
                       <a href="<c:url value = "/deleteCart/${cart.cartItemId}"/>"><button type="button" class="btn btn-secondary">
                             Remove
                        </button></a>
                        </div>
                        </td>
                    </tr>
               
                    </c:forEach>

                    <tr>
                        <td class="hidden-xs">   </td>
                        <td class="hidden-xs">   </td>
                        <td><h5>Subtotal</h5></td>
                        <td class="text-right"><h5><strong><c:out value="${tot}"/></strong></h5></td>
                    </tr>
                    <tr>
                        <td class="hidden-xs">   </td>
                        <td class="hidden-xs">   </td>
                        <td><h5>Estimated shipping</h5></td>
                        <c:set var="ship" value="${(tot/100) * 0.5}"></c:set>
                        <td class="text-right"><h5><strong><c:out value="${ship}"/></strong></h5></td>
                    </tr>
                    <tr>
                        <td class="hidden-xs">   </td>
                        <td class="hidden-xs">   </td>
                        <td><h3>Total</h3></td>
                        <td class="text-right"><h3><strong><c:out value="${ship + tot}"/></h3></td>
                    </tr>
                    <tr>
                         <td class="hidden-xs">   </td>
                        <td class="hidden-xs">   </td>
                        <td>
                        <a href="<c:url value="/ViewCategories"/>" class="btn btn-default">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
                            </a>
                        </td>
                        <td>
                        <a href="<c:url value = "/confirmOrder"/>" class="btn btn-success">
                            Checkout <span class="glyphicon glyphicon-play"></span>
                        </a></td>
                    </tr>
                </tbody>
            </table>
            </form:form>
        </div>
    </div>
</div>
		</c:if>
<%@include file="footer.jsp" %>
</body>
</html>