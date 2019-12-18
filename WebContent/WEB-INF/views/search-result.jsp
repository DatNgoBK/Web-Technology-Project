<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="keywords" content="">
<title>Mobistore Online Mobile Store Template - Product-list
	Page</title>
<!-- Bootstrap -->
<link href="<c:url value="/resources/theme1/css/bootstrap.min.css" />"
	rel="stylesheet" />
<!-- Style CSS -->
<link href="<c:url value="/resources/theme1/css/style.css" />"
	rel="stylesheet" />
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i"
	rel="stylesheet" />
<!-- FontAwesome CSS -->
<link href="<c:url value="/resources/theme1/css/font-awesome.min.css" />"
	rel="stylesheet" />
	<script src="<c:url value="/resources/theme1/js/jquery.min.js" />" ></script>
  <script src="<c:url value="/resources/theme1/js/jquery-ui.js" />"></script>
  <script type="text/javascript" src="<c:url value="/resources/theme1/js/home.js" />"  charset="UTF-8"></script>
    
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<title>Insert title here</title>
 
<script type="text/javascript">
	$(document).ready(function(){ 
		    $( "#txtName" ).autocomplete({
		      source: ${nameList},
		      minLength: 3
		    });
	});
</script>
</head>
<body>
	<!-- top-header-->
	<%@include file="_header.jsp" %>
	<!-- /. header-section-->
	
	<!-- product-list -->
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-9 col-sm-8 col-xs-12">
					<div class="row">
						<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb10 alignright">
							<p>Có ${quantity} kết quả tìm kiếm cho từ khóa: "${search}"</p>
						</div>
					</div>
					<div class="row"  id="listProduct">
						<c:forEach var="phone" items="${listProduct}" varStatus="status">
							<!-- product -->
							<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 mb30">
								<div class="product-block">
									<div class="product-img">
									<a href="product-single.htm?phoneID=${phone.phoneID}">
										<img src="<c:url value="/resources/theme1/images/products/${listProduct[status.index].image}.jpg" />"
											alt="">
									</div>
									</a>
									<div class="product-content">
										<h5>
											<a href="product-single.htm?phoneID=${phone.phoneID}" class="product-title">${listProduct[status.index].name}
												<strong>(${phone.ram}GB, ${phone.memory}GB)</strong>
											</a>
										</h5>
										<div class="product-meta">
											<a href="#" class="product-price">
												<f:formatNumber value="${listProduct[status.index].price}" type="number"></f:formatNumber>đ
											</a>
											<!--  <a href="#"
											class="discounted-price">$1400 </a><span class="offer-price">20%off</span> -->
										</div>
										<div class="shopping-btn">
											<a id="${listProduct[status.index].phoneID}"
												
												class="product-btn btn-cart add-to-cart" ><i
												class="fa fa-shopping-cart"></i></a>
										</div>
									</div>
								</div>
							</div>
							<!-- /.product -->
						</c:forEach>
					</div>
				</div>
			</div>
		</div>	
	</div>
	
	<!-- /.product-list -->
	<!-- footer -->
	<%@include file="_footer.jsp" %>
	<!-- /.footer -->
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	  
	<script src="<c:url value="/resources/js/jquery.min.js" />"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	
	<script src="<c:url value="/resources/theme1/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/theme1/js/menumaker.js" />"></script>
	<script src="<c:url value="/resources/theme1/js/jquery.sticky.js" />"></script>
	<script src="<c:url value="/resources/theme1/js/tsticky-header.js" />"></script>
</body>
</html>