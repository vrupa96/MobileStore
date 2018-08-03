<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Category</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<style type="text/css">
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
<body>
<%@ include file="header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="bg">
<div class ="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-5">
		<div class="panel panel-default">
			<div class="panel-heading">
                    <i class="glyphicon glyphicon-earphone"></i>&nbsp;&nbsp;<b>Category Page</b></div>
                <div class="panel-body">
                
                    <form:form id="insertCat" action="InsertCategory" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="catname" class="col-sm-3 control-label">
                            Name</label>
                        <div class="col-sm-9">
                            <input type = "text" id= "catname" name ="catname" placeholder="Enter Category Name" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="catdesc" class="col-sm-3 control-label">
                            Description</label>
                        <div class="col-sm-9">
                            <textarea id="catdesc" name="catdesc" required 
                            style="max-height: 150px; max-width: 225px; min-width: 225px; min-height: 30px; 
                            text-align: left; overflow: auto;"  rows="4" cols="30" form="insertCat"></textarea>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="cimage" class="col-sm-3 control-label">
                            Image</label>
                        <div class="col-sm-9">
                            <input type="file"  placeholder="upload Image" id="cimage" name="cimage" accept=".jpg" required />	
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
	
	
<div class="container">
	<div class="row">
	<div class="col-md-10 col-md-offset-1">
	
		 <div class="panel panel-default panel-table">
			 <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-6">
                    <h3 class="panel-title">Categories</h3>
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
                        <th><em class="fa fa-cog"></em></th>
                    </tr> 
                  </thead>
                  <tbody>
                  	<c:forEach items="${listCategories}" var="category">
                          <tr>
                            <td class="hidden-xs">${category.categoryID}</td>
                            <td>${category.categoryName}</td>
                            <td>${category.categoryDesc}</td>
                            <td align="center">
                              <a class="btn btn-default" href="<c:url value="/UpdateCategory/${category.categoryID}"/>"><span class="glyphicon glyphicon-pencil"></span></a>
                              <a class="btn btn-danger" href="<c:url value="/DeleteCategory/${category.categoryID}"/>"><span class="glyphicon glyphicon-trash"></span></a>  
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