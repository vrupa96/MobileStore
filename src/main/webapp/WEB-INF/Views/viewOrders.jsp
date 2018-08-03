<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="header.jsp" %>


<div class="container">
<div class="col-sm-12 col-md-6 col-lg-6 col-lg-offset-3 col-sm-offset-0">
        		 <table class="table table-hover">
			<thead>
			      <tr>
			        <th class="hidden-xs">Order ID</th>
			        <th>Order Date</th>
			        <th>Total Amount</th>
			        <th class="hidden-xs">Status</th>
			      </tr>
			    </thead>
			    <tbody>
			    <c:forEach items="${orderList}" var="order">
			      <tr>
			        <td class="hidden-xs">${order.orderId}</td>
			        <td>${order.orderDate}</td>
			        <td>${order.totalAmount}</td>
			        <td class="hidden-xs">${order.orderStatus}</td>
			      </tr>
			    </c:forEach>
			     <tr>
			        <td class="hidden-xs"></td>
			        <td class="hidden-xs"></td>
			        <td class="hidden-xs"></td>
			        <td><a href="<c:url value = "/"/>" class="btn btn-lg btn-secondary">Continue Shopping</a></td>
			      </tr>
			    </tbody>			  
  </table>
        	</div>
</div>

<%@include file="footer.jsp" %>
</body>
</html>