<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Product</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

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

<body>
<%@include file="header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="bg">
<div class ="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-5">
		<div class="panel panel-default">
			<div class="panel-heading">
                    <i class="fa fa-mobile-phone fa-2x"></i>&nbsp;&nbsp;	<b>Product Page</b></div>
                <div class="panel-body">
                
                    <form:form id="insertProd" action="InsertProduct" method="post" class="form-horizontal" enctype="multipart/form-data" >
                    <div class="form-group">
                        <label for="prodname" class="col-sm-3 control-label">
                            Name</label>
                        <div class="col-sm-9">
                            <input type = "text" id= "prodname" name ="prodname" class="form-group" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="supinfo" class="col-sm-3 control-label">
                            Price</label>
                        <div class="col-sm-9">
                        	<input type="number" id="price" name="price" step="any" class="form-group" required />
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="supcont" class="col-sm-3 control-label">
                            Stock&nbsp; (1-15)</label>
                        <div class="col-sm-9">
                           <input type="number" id="stock" name="stock" min="1" max= "15" class="form-group" required/>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="supcont" class="col-sm-3 control-label">
                            Description</label>
                        <div class="col-sm-9">
                            <textarea id="desc" name="desc" required class="form-group"
                            style="max-height: 150px; max-width: 225px; min-width: 225px; min-height: 30px; 
                            text-align: left; overflow: auto;"  rows="4" cols="30" form="insertProd"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="category" class="col-sm-3 control-label">
                            CategoryID</label>
                        <div class="col-sm-9">
                            <select name="category" id="category" class="form-group" required>
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
                            <select name="supplier" id="supplier" class="form-group" required>
	 									<c:forEach items="${listSuppliers }" var="supplier">
	 											<option value="${supplier.supplierID}">[${supplier.supplierID}] - ${supplier.supplierName}</option>
	 									</c:forEach>
	 								</select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pimage" class="col-sm-3 control-label">
                            Image</label>
                        <div class="col-sm-9">
                            <input type = "file" id= "pimage" name ="pimage" accept=".jpg" class="form-group" required/>
                        </div>
                    </div>
                    
                    
                    <div class="form-group last">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="submit" class="btn btn1">
                                Submit</button>
                                 <button type="reset" class="btn btn2">
                                Reset</button>
                        </div>
                    </div>
                    </form:form>
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
 <div class="container">
        <div class="row style_featured">
        <c:forEach items="${listProducts}" var="product">
            <div class="col-md-4">
                <div>
                    <img src="<c:url value="./resources/images/productImg/${product.productID}.jpg"/>" alt="" class="img-rounded img-thumbnail" style="height: 200px; width: 300px; border: 0px;"/>
                    <h2>${product.productName}</h2>
                    <table class="table table-stripped">
                    <tbody>
                    <tr>
                    <td width="20%">ID <i class="fa fa-vcard-o"></i></td>
                    <td>${product.productID}</td>
                    </tr>
                    <tr>
                    <td width="30%">Info <span class="fa fa-info-circle"></span></td>
                    <td><textarea style="max-height: 50px; max-width: 225px; min-width: 225px; min-height: 50px; 
                            text-align: left; overflow: auto; border: " readonly rows="4" cols="30">${product.productDesc}</textarea></td>
                    </tr>
                    <tr>
                    <td width="30%">Price <i class="fa fa-rupee"></i></td>
                    <td>${product.price}</td>
                    </tr>
                     <tr>
                    <td width="30%">Quantity <i class="fa fa-cubes"></i></td>
                    <td>${product.stock}</td>
                    </tr>
                     <tr>
                    <td width="30%">Category ID <i class="fa fa-mobile"></i></td>
                    <td>${product.categoryID}</td>
                    </tr>
                     <tr>
                    <td width="30%">Supplier ID <i class="fa fa-truck"></i></td>
                    <td>${product.supplierID}</td>
                    </tr>
                    </tbody>
                    </table>
                    <a href="<c:url value = "/UpdateProduct/${product.productID}"/>"><button class="btn btn1">Update</button></a>
                    <a href="<c:url value = "/DeleteProduct/${product.productID}"/>"><button class="btn btn2">Delete</button></a>
                    
                </div>
            </div>
           </c:forEach>
        </div>
    </div>	
<br>
<%@include file="footer.jsp" %>
</body>
</html>