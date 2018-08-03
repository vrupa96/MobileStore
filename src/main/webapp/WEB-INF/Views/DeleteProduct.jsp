<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Delete Product</title>
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
                    <i class="fa fa-mobile fa-2x"></i>&nbsp;&nbsp;	<b>Delete Product: ${supplierInfo.supplierName}</b></div>
                <div class="panel-body">
                
                    <form id="deleteProd" action="<c:url value = "/DeleteProduct"/>" method="post" class="form-horizontal" role="form" >
                    <div class="form-group">
                        <label for="proid" class="col-sm-3 control-label">
                            Product ID</label>
                        <div class="col-sm-9">
                            <input type="text" readonly id="proid" name="proid" value="${productDel.productID}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="prodname" class="col-sm-3 control-label">
                            Product Name</label>
                        <div class="col-sm-9">
                            <input type="text" readonly id="prodname" name="prodname" value="${productDel.productName}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="desc" class="col-sm-3 control-label">
                            Info</label>
                        <div class="col-sm-9">
                            <textarea id="desc" name="desc" readonly
                            style="max-height: 150px; max-width: 225px; min-width: 225px; min-height: 30px; 
                            text-align: left;"  rows="4" cols="30" form="deleteProd">${productDel.productDesc}</textarea>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="price" class="col-sm-3 control-label">
                            Price</label>
                        <div class="col-sm-9">
                            <input type="number" readonly step="any" id="price" name="price" value="${productDel.price}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stock" class="col-sm-3 control-label">
                            Stock</label>
                        <div class="col-sm-9">
                            <input type="text" readonly id="stock" name= "stock" value="${productDel.stock}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="catid" class="col-sm-3 control-label">
                            CategoryID</label>
                        <div class="col-sm-9">
                            <input type = "text" readonly id = "catid" name = "catid" value="${productDel.categoryID}" />
                        </div>
                    </div>
                      <div class="form-group">
                        <label for="suppid" class="col-sm-3 control-label">
                            SupplierID</label>
                        <div class="col-sm-9">
                            <input type = "text" readonly id = "suppid" name = "suppid" value="${productDel.supplierID}" />
                        </div>
                    </div>
                    
                    <div class="form-group last">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="submit" class="btn btn1">
                                Delete</button>
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