<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Seller Page</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>

<body>
<%@include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="bg">
<div class ="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-5">
		<div class="panel panel-default">
			<div class="panel-heading">
                    <i class="fa fa-truck fa-2x"></i>&nbsp;&nbsp;	<b>Seller Page</b></div>
                <div class="panel-body">
                
                    <form id="insertSup" action="InsertSupplier" method="post" class="form-horizontal" role="form" >
                    <div class="form-group">
                        <label for="supname" class="col-sm-3 control-label">
                            Seller</label>
                        <div class="col-sm-9">
                            <input type = "text" id= "supname" name ="supname" placeholder="Enter Seller Name" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="supinfo" class="col-sm-3 control-label">
                            Description</label>
                        <div class="col-sm-9">
                            <textarea id="supinfo" name="supinfo" required 
                            style="max-height: 150px; max-width: 225px; min-width: 225px;
                             min-height: 30px; text-align: left;"  rows="4" cols="30" form="insertSup"></textarea>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="supcont" class="col-sm-3 control-label">
                            Contact</label>
                        <div class="col-sm-9">
                            <input type="tel" pattern="[6789][0-9]{9}" id="supcont" name="supcont" required placeholder="contact number"/>
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
                        <th class="hidden-xs">Description</th>
                        <th>Contact</th>
                        <th><em class="fa fa-cog"></em></th>
                    </tr> 
                  </thead>
                  <tbody>
                  	<c:forEach items="${listSuppliers}" var="supplier">
                          <tr>
                            <td class="hidden-xs">${supplier.supplierID}</td>
                            <td>${supplier.supplierName}</td>
                            <td class="hidden-xs">${supplier.supplierInfo}</td>
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
<%@include file="footer.jsp" %>
</body>
</html>