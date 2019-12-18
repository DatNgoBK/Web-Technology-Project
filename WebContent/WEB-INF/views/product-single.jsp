<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title> Mobistore Online Mobile Store Template - Product Single Page </title>
    <!-- Bootstrap -->
    <link href="<c:url value="/resources/theme1/css/bootstrap.min.css" />" rel="stylesheet">
    <!-- Style CSS -->
    <link href="<c:url value="/resources/theme1/css/style.css"/>" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i" rel="stylesheet">
    <!-- FontAwesome CSS -->
    <link href="<c:url value="/resources/theme1/css/font-awesome.min.css"/>" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/resources/theme1/css/jquery.desoslide.css"/>" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/theme1/css/animate.min.css"/>" >
    <link href="<c:url value="/resources/theme1/css/scrolling-nav.css"/>" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/theme1/css/jquery.rateyo.min.css"/>">
	<script src="<c:url value="/resources/theme1/js/jquery.min.js" />" ></script>
  <script src="<c:url value="/resources/theme1/js/jquery-ui.js" />"></script>
  <script type="text/javascript" src="<c:url value="/resources/theme1/js/home.js" />"  charset="UTF-8"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<title>${phone.name}</title>
</head>
<body>

<!-- top-header-->
    <%@include file="_header.jsp" %>
    <!-- /. header-section-->
    <!-- page-header -->
    <div class="page-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="page-breadcrumb">
                        <ol class="breadcrumb">
                            <li><a href="home.htm">Home</a></li>
                            <li>Product Single</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.page-header-->
    <!-- product-single -->
    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="box">
                        <!-- product-description -->
                        <div class="box-body">
                            <div class="row">
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                    <ul id="demo1_thumbs" class="slideshow_thumbs">
                                    	<c:forEach var="image" items="${images}">
        	                                <li>
    	                                        <a href="<c:url value="/resources/theme1/images/products/${image}.jpg" />">
	                                                <div class=" thumb-img">
	                                                	<img src="<c:url value="/resources/theme1/images/products/${image}.jpg" />" alt="">
	                                                </div>
                                            	</a>
                                        	</li>
                                       	</c:forEach>                               
                                    </ul>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <div id="slideshow"></div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <div class="product-single">
                                        <h2>${phone.name} </h2>
                                        <div class="product-rating">
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star"></i></span>
                                            <span><i class="fa fa-star-o"></i></span>
                                            <span class="text-secondary">&nbsp;(4.8 Review Stars)</span>
                                        </div>
                                        <p class="product-price" style="font-size: 38px;"> 
                                        	<f:formatNumber type="number" value="${phone.price}" ></f:formatNumber>đ
                                        </p>
                                        <p>${phone.followingCamera} MP Rear | ${phone.frontCamera} MP Front Camera, 
                                        	${phone.ram}GB RAM, ${phone.battery}, ${phone.os},
                                        	${phone.memoryCard}</p>
                                        <div class="product-quantity">
                                            <h5>Quantity</h5>
                                            <div class="quantity mb20">
                                                <input id="${phone.phoneID}" type="number" class="input-text qty text quantity-single" step="1" min="1" max="6" name="quantity" value="1" title="Qty" size="4" pattern="[0-9]*">
                                            </div>
                                        </div>
                                        <a class="btn btn-default" id="add-to-cart"><i class="fa fa-shopping-cart" ></i>&nbsp;Add to cart</a>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="box-head scroll-nav">
                        <div class="head-title"> <a class="page-scroll active" href="#product">Product Details</a>
                            <a class="page-scroll" href="#rating">Ratings &amp; Reviews</a>
                            <a class="page-scroll" href="#review">Add Your Reviews</a></div>
                    </div>
                </div>
            </div>
            <!-- highlights -->
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="box" id="product">
                        <div class="box-body">
                            <div class="highlights">
                                <h4 class="product-small-title">Highlights</h4>
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                        <ul class="arrow">
                                            <li>${phone.followingCamera} MP Rear | ${phone.frontCamera} MP Front Camera </li>
                                            <li>${phone.ram}GB RAM </li>
                                            <li>${phone.battery}</li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                        <ul class="arrow">
                                            <li>${phone.os} </li>
                                            <li>${phone.memoryCard}</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="highlights">
                                <h4 class="product-small-title">Specification</h4>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <h4>General</h4>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 mb30">
                                        <ul>
                                            <li>Brand</li>
                                            <li>Sim Size</li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 mb30">
                                        <ul>
                                            <li style="color: #1c1e1e;">${brandName} </li>
                                            <li style="color: #1c1e1e;">${phone.sim}</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <h4>Display</h4>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                        <ul>
                                            <li>Screen Size </li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                        <ul>
                                            <li style="color: #1c1e1e;">${phone.screen} </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- rating reviews  -->
           
    <!-- /.reviews-form -->
            </div>
        </div>
        <!-- /.product-description -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="box-head">
                    <h3 class="head-title">Related Product</h3>
                </div>
            </div>
        </div>
        <div class="box">
            <div class="box-body">
                <div class="row">
                    <!-- product -->
                    <c:forEach var="item" items="${relatedPhones}" end="3">
                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 mb30">
                        <div class="product-block">
                            <a href="product-single.htm?phoneID=${item.phoneID}"><div class="product-img">
                            	<img src="<c:url value="/resources/theme1/images/products/${item.image}.jpg" />" alt="">
                            </div></a>
                            <div class="product-content">
                                <h5><a href="product-single.htm?phoneID=${item.phoneID}" class="product-title">${item.name} <strong>(${item.ram}GB)</strong></a></h5>
                                <div class="product-meta"><a href="#" class="product-price">
                                	<f:formatNumber value="${item.price}" type="number"></f:formatNumber>đ</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <!-- /.product -->
            	</div>
            </div>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 mb30 row">
        	<div class="fb-comments" style="margin: 0 auto" data-width="700" data-numposts="5"></div>
        </div>
    </div>
    <!-- /.product-single -->
    </div>
    <!-- footer -->
    <%@include file="_footer.jsp" %>
    <!-- /.footer -->
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<c:url value="/resources/theme1/js/jquery.min.js"/>" type="text/javascript"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value="/resources/theme1/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/theme1/js/menumaker.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/theme1/js/jquery.sticky.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/theme1/js/sticky-header.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/theme1/js/scrolling-nav.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/theme1/js/jquery.easing.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/theme1/js/jquery.rateyo.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/theme1/js/jquery.desoslide.js"/>"></script>
 
    <script type="text/javascript">
    $('#slideshow').desoSlide({
        thumbs: $('ul.slideshow_thumbs li > a'),
        effect: {
            provider: 'animate',
            name: 'fade'
        }

    });
    </script>

    <script type="text/javascript">
        $(function () {
 
  $("#rateYo").rateYo({
    rating: 3.6,
    starWidth: "16px"
  });
 
});
        
       

    
    </script>
		<div id="fb-root"></div>
		<script>(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.12&appId=613051249035298&autoLogAppEvents=1';
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		</script>

</body>
</html>