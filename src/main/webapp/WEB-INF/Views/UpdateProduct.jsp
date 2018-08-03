<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Product Update</title>
</head>

<body>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<br>
<button type="button" class="btn" onclick="history.back()">
      <span class="glyphicon glyphicon-chevron-left"></span> Back
    </button>
<div class="bg">
<div class ="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-5">
		<div class="panel panel-default">
			<div class="panel-heading">
                    <i class="fa fa-mobile fa-2x"></i>&nbsp;&nbsp;	<b>Update Product: ${supplierInfo.supplierName}</b></div>
                <div class="panel-body">
                
                    <form id="updateProd" action="<c:url value = "/UpdateProduct"/>" method="post" class="form-horizontal" role="form" >
                    <div class="form-group">
                        <label for="proid" class="col-sm-3 control-label">
                            Product ID</label>
                        <div class="col-sm-9">
                            <input type="text" readonly id="proid" name="proid" value="${productInfo.productID}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="prodname" class="col-sm-3 control-label">
                            Product Name</label>
                        <div class="col-sm-9">
                            <input type="text" id="prodname" name="prodname" value="${productInfo.productName}" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="desc" class="col-sm-3 control-label">
                            Info</label>
                        <div class="col-sm-9">
                            <textarea id="desc" name="desc" required
                            style="max-height: 150px; max-width: 225px; min-width: 225px; min-height: 30px; 
                            text-align: left;"  rows="4" cols="30" form="updateProd">${productInfo.productDesc}</textarea>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="price" class="col-sm-3 control-label">
                            Price</label>
                        <div class="col-sm-9">
                            <input type="number" step="any" id="price" name="price" value="${productInfo.price}" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stock" class="col-sm-3 control-label">
                            Stock</label>
                        <div class="col-sm-9">
                            <input type="number" id="stock" name="stock" min="1" max= "20" value="${productInfo.stock}"required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="category" class="col-sm-3 control-label">
                            CategoryID</label>
                        <div class="col-sm-9">
                            <select name="category" id="category">
	 									<c:forEach items="${listCategories }" var="category">
	 											<option value="${category.categoryID}">[${category.categoryID}] - ${category.categoryName}</option>
	 									</c:forEach>
	 								</select>
                        </div>
                    </div>
                      <div class="form-group">
                        <label for="supplier" class="col-sm-3 control-label">
                            SupplierID</label>
                        <div class="col-sm-9">
                            <select name="supplier" id="supplier">
	 									<c:forEach items="${listSuppliers }" var="supplier">
	 											<option value="${supplier.supplierID}">[${supplier.supplierID}] - ${supplier.supplierName}</option>
	 									</c:forEach>
	 						</select>
                        </div>
                    </div>
                    
                    <div class="form-group last">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="submit" class="btn btn1">
                                Update</button>
                        </div>
                    </div>
                    </form>
                </div>
		</div>
		</div>
	</div>
<br>
<br>
</div>  
</div>

<br>
<br>
<br>
<%@ include file="footer.jsp" %>

</body>
</html>