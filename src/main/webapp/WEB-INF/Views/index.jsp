<html>
<head>
<link href='https://fonts.googleapis.com/css?family=Jua' rel='stylesheet'>
</head>
<style>
body {
    font-family:'Jua';
    font-size: 18px;
    }
    
    .image-block {
    border: 3px solid white ;
    background-color: black;
    padding: 0px;    
    margin: px;
    height:200px;
    text-align: center;
    vertical-align: bottom;
    }
    
    .image-block > p {
    width: 100%;
    height: 100%;
    font-weight: normal;
    font-size: 19px;
    padding-top: 150px;
    background-color: rgba(3,3,3,0.0);
    color: rgba(6,6,6,0.0);
}
.image-block:hover > p {
    background-color: rgba(3,3,3,0.5);    
    color: white;    
}
    
  /*  .background-body  {
    background-image: url("resources/images/webPages/bg-color.PNG");
    background-repeat: no-repeat;
    background-size: cover;
    } */ 
</style>
<body>
<%@include file="header.jsp" %>
<div class="background-body">
<div class="container-fluid">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
    
      <div class="item active">
       <img src="<c:url value='resources/images/webPages/slide1.png'/>" alt="Your Pocket Friend" width=1920 height="1080px" />
      </div>

      <div class="item">
        <img src="<c:url value='resources/images/webPages/slide2.jpg'/>" alt="Your Pocket Friends" width=1920 height="1080px"/>
      </div>
    
      <div class="item">
         <img src="<c:url value='resources/images/webPages/slide3.jpg'/>" alt="Your Pocket Friend" width=1920  height="1080px"/>
      </div>
      
      <div class="item">
        <img src="<c:url value='resources/images/webPages/slide4.jpg'/>" alt="Your Pocket Friend" width=1920 height="1080px"/>
      </div>
      
      <div class="item">
        <img src="<c:url value='resources/images/webPages/slide5.jpg'/>" alt="Your Pocket Friend" width=1920 height="1080px"/>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
 </div>
<br>
<br>
<br>
<div class="container-fluid">
	
	<h1 align="center"><!-- <img src="resources/images/webPages/brandIcon.png" alt="ICON"> -->Available Products</h1>
</div>
    <div class="container">
        <div class="row">
        <c:forEach items="${Categories}" var = "category">
              <div class="image-block col-xs-6 col-sm-4 col-md-4 col-lg-4" 
              style="background: url('./resources/images/categoryImg/${category.categoryID}.jpg') no-repeat center; background-size:contain;">      
              <p>${category.categoryName}</p>
              </div>
   
          </c:forEach>
            </div>
    </div>
</div>
<br>
<br>
<%@include file="footer.jsp" %>
</body>
</html>
