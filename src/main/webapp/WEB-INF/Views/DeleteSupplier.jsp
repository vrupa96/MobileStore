<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Delete Supplier</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <link href='https://fonts.googleapis.com/css?family=Jua' rel='stylesheet'>
<style>
.bg, .container {
    font-family:'Jua';
    font-size: 18px;
    }
    
  .btn {
     background-color: #222;
     border-color: #080808;
     color: white;
}
.btn:hover {
	color: #222;
	background-color: #D2D7D3;
}
</style>
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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
                    <i class="fa fa-truck fa-2x"></i>&nbsp;&nbsp;	<b>Delete Seller: ${supplierInfo.supplierName}</b></div>
                <div class="panel-body">
                
                    <form id="deleteSup" action="<c:url value = "/DeleteSupplier" />" method="post" class="form-horizontal" role="form" >
                    <div class="form-group">
                        <label for="supid" class="col-sm-3 control-label">
                            Seller ID</label>
                        <div class="col-sm-9">
                            <input type="text" readonly id="supid" name="supid" value="${supplierDel.supplierID}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="supname" class="col-sm-3 control-label">
                            Seller Name</label>
                        <div class="col-sm-9">
                            <input type="text" readonly id="supname" name="supname" value="${supplierDel.supplierName}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="supinfo" class="col-sm-3 control-label">
                            Description</label>
                        <div class="col-sm-9">
                            <textarea id="supinfo" name="supinfo" readonly
                            style="max-height: 150px; max-width: 225px; min-width: 225px; min-height: 30px; text-align: left;"  rows="4" cols="30" form="deleteSup">
                            ${supplierDel.supplierInfo}
                            </textarea>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="supcont" class="col-sm-3 control-label">
                            Contact</label>
                        <div class="col-sm-9">
                            <input type="text" readonly id="supcont" name="supcont" value="${supplierDel.supplierContactNo}"/>
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

<div class="container">
	<div class="row">
	<div class="col-md-10 col-md-offset-1">
	
		 <div class="panel panel-default panel-table">
			 <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-6">
                    <h3 class="panel-title">Sellers</h3>
                  </div>
                 
                </div>
              </div>	
			<div class="panel-body">
			<table class="table table-striped table-bordered table-list">
                  <thead>
                    <tr>
                        <th class="hidden-xs">ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Contact</th>
                        <th><em class="fa fa-cog"></em></th>
                    </tr> 
                  </thead>
                  <tbody>
                  	<c:forEach items="${listSuppliers}" var="supplier">
                          <tr>
                            <td class="hidden-xs">${supplier.supplierID}</td>
                            <td>${supplier.supplierName}</td>
                            <td>${supplier.supplierInfo}</td>
                            <td>${supplier.supplierContactNo}</td>
                            <td align="center">
                              <a class="btn btn-default" href="<c:url value="/UpdateSupplier/${supplier.supplierID}"/>"><span class="glyphicon glyphicon-pencil"></span></a>
                              <a class="btn btn-danger" href="<c:url value="/DeleteSupplier/${supplier.supplierID}"/>"><span class="glyphicon glyphicon-trash"></span></a>
                              
                            </td>
                          </tr>
                     </c:forEach>
                        </tbody>
                </table>
	</div>
</div>
</div>
</div>
</div>
<br>
<br>
<br>


<form  action="<c:url value = "/DeleteSupplier"/>" method = "post">
			<table align = "center">
			
					<tr>
						<td colspan = "2">Delete Supplier: ${supplierDel.supplierName}</td>
					</tr>
					<tr>
							<td>supplier ID</td>
							<td><input type="text" readonly id="supid" name="supid" value="${supplierDel.supplierID}"/></td>
					</tr>
					<tr>
							<td>supplier Name</td>
							<td><input type="text" readonly id="supname" name="supname" value="${supplierDel.supplierName}"/></td>
					</tr>
					<tr>
							<td>supplier Info</td>
							<td><input type="text" readonly id="supinfo" name="supinfo" value="${supplierDel.supplierInfo}"/></td>
					</tr>
					<tr>
							<td>supplier Contact No</td>
							<td><input type="text" readonly id="supcont" name="supcont" value="${supplierDel.supplierContactNo}"/></td>
					</tr>
					<tr>
							<td colspan="2" align="center">
							<input type="submit" value="Delete"/>
							</td>
					</tr>
			</table>
</form>
<%@ include file="footer.jsp" %>
</body>
</html>