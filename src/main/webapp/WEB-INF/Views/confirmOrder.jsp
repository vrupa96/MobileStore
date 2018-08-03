<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Confirm Order</title>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<script type="text/javascript">
function copyBillingAddress() {
	var isChecked = document.getElementById("shippingAndBilling").value;
	if(isChecked==1) {
		document.getElementById("billAddr").value = document.getElementById("shipAddr").value;
	}
	else {
		document.getElementById("billAddr").value = null;
	}		
}
</script>

<style type="text/css">
body { 
margin-top:20px;
}
.panel-title {
display: inline;font-weight: bold;
}
.checkbox.pull-right {
 margin: 0; 
 }
.pl-ziro { 
padding-left: 0px; 
}
</style>
</head>
<body>
<%@include file="header.jsp" %>

<div class="container">
  <div class="row style_featured">
                  <!-- panel 1 -->
<div class="col-sm-12 col-md-10 col-md-offset-1">              
<c:url value="/thankYou" var="urlString"></c:url>                  
<form:form action="${urlString}" modelAttribute="order" cssClass="form-horizontal" id="thankYou">

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
                <c:forEach items="${listCart}" var="cart">
                	<c:set var = "productIdFromCart" value = "${cart.productId}"/>
                		<c:forEach items="${product}" var="prod">
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

                    <c:set var="ship" value="${(tot/100) * 0.5}"></c:set>    
                    <tr>
                        <td class="hidden-xs">   </td>
                        <td class="hidden-xs">   </td>
                        <td><h4>Total</h4></td>
                        <td class="text-right"><h4><strong><c:out value="${ship + tot}"/></strong></h4></td>
                    </tr>
                </tbody>
            </table>



<!-- payment details panel -->                                    
	<div class="col-md-4 col-md-offset-4">
  		<div class="panel panel-default">
    		<div class="panel-heading">
    			<h3 class="panel-title">Payment Options</h3>
   	</div>
  
      <div class="panel-body">
      		<!--Radio group-->
				<div class="form-check">
						<input type="radio" name="toggle" value="CC" required> Credit Card
				</div>
				
				<div class="form-check">
						<input type="radio" name="toggle" value="DC"> Debit Card
				</div>
				
				<div class="form-check">
						<input type="radio" name="toggle" value="EW"> e-Wallets
				</div>
					
					<div class="form-check">
						<input type="radio" name="toggle" value="COD"> Cash on Delivery
				</div>
			<!--Radio group-->
	  </div>
    	</div>
  	</div>
  	
<!-- Address  panel -->                                    
	<div class="col-md-4 col-md-offset-4">
  		<div class="panel panel-default">
    		<div class="panel-heading">
    			<h3 class="panel-title">Address Details</h3>
  		 	</div>
  		 	<div class="panel-body">
  		 		
  		 		<div class="col-sm-9">
  		 			<label for="shipAddr">Shipping Address</label>
                            <textarea id="shipAddr" name="shipAddr" required class="form-group"
                            style="max-height: 150px; max-width: 230px; min-width: 230px; min-height: 30px; 
                            text-align: left; overflow: auto;"  rows="4" cols="30" form="thankYou"></textarea>
                </div>
                
                <div class="input-group">
                	<div class="checkbox" style="margin-bottom: 25px">
                    	<label>
                        	<input id="shippingAndBilling" type="checkbox" name="remember" value="1" onclick="copyBillingAddress();"> Both shipping address and billing address are the same.
                        </label>
                    </div>
                 </div>
                
  		 		<div class="col-sm-9">
  		 			<label for="billAddr">Billing Address</label>
                            <textarea id="billAddr" name="billAddr" required class="form-group"
                            style="max-height: 150px; max-width: 230px; min-width: 230px; min-height: 30px; 
                            text-align: left; overflow: auto;"  rows="4" cols="30" form="thankYou"></textarea>
                </div>
  		 	</div>
  		 	<div class="form-group">
				<div class="col-md-offset-2 col-md-9">
					<input type="submit" value="Proceed to checkout" class="btn btn-md btn-secondary btnAlign"/>	
				</div>
  		</div>
  	</div>
  	</div>
</form:form>
   </div>
  </div>
</div>  
  
  
<%@include file="footer.jsp" %>
</body>
</html>