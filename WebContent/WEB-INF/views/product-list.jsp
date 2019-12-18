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
		    
		   /* $("#search-select").submit(function() {
		    	var brands = [];
		        $('#search-select input[name="brand"]:checked').each(function() {
		        	brands.push(this.value)
		        });
		        $('#listProduct').load('search-by-properties.htm', {brand: brands});
			});
		   */ 
		    
	});
</script>
</head>
<body>

<!-- Load Facebook SDK for JavaScript -->
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.12&autoLogAppEvents=1';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<!-- Your customer chat code -->
<div class="fb-customerchat"
  page_id="240971893141219">
</div>



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
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.page-header-->
	<!-- product-list -->
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
					<!-- sidenav-section -->
					<div id='cssmenu'>
					
						<ul>
							<li class='has-sub'><a href='#'>Brand (07)</a>
								<ul>
									<c:forEach items="${brands}" var="brand" >
										<li><label> <input type="checkbox" name="brand" value="${brand.brandID}" class="checkbox-brand checkbox-single"> <span class="checkbox-list">${brand.name}</span></label> </li>
									</c:forEach>
								</ul></li>
							<li class='has-sub'><a href='#'>Price</a>
								<ul>
									<li><label> <input type="checkbox" name="price" value="1000000-3000000" class="checkbox-price checkbox-single"> <span
											class="checkbox-list">1.000.000-3.000.000</span>
									</label></li>
									<li><span> <label> <input type="checkbox" name="price" value="3000000-5000000" class="checkbox-price checkbox-single">
												<span class="checkbox-list">3.000.000-5.000.000</span>
										</label></span></li>
									<li><label> <input type="checkbox"  name="price" value="5000000-10000000" class="checkbox-price checkbox-single"> <span
											class="checkbox-list">5.000.000-10.000.000</span>
									</label></li>
									<li><label> <input type="checkbox"  name="price" value="10000000-20000000" class="checkbox-price checkbox-single"> <span
											class="checkbox-list">10.000.000-20.000.000</span>
									</label></li>
									<li><label> <input type="checkbox" name="price" value="2000000-1000000000" class="checkbox-price checkbox-single"> <span
											class="checkbox-list">Above-20.000.000</span>
									</label></li>
								</ul></li>
							<li class='has-sub'><a href='#'>RAM</a>
								<ul>
									<li><label> <input type="checkbox" name="ram" value="1-2" class="checkbox-ram checkbox-single"> <span
											class="checkbox-list">1 - 2 GB</span>
									</label></li>
									<li><label> <input type="checkbox" name="ram" value="2-4" class="checkbox-ram checkbox-single"> <span
											class="checkbox-list">2 - 4 GB</span>
									</label></li>
									<li><label> <input type="checkbox"  name="ram" value="4-8" class="checkbox-ram checkbox-single"> <span
											class="checkbox-list">4 - 8 GB</span>
									</label></li>
									<li><label> <input type="checkbox" name="ram" value="8-1000" class="checkbox-ram checkbox-single"> <span
											class="checkbox-list">above 8 GB</span>
									</label></li>
								</ul></li>
							<li class='has-sub'><a href='#'>MEMORY</a>
								<ul>
									<li><label> <input type="checkbox" name="memory" value="16" class="checkbox-memory checkbox-single"> <span
											class="checkbox-list">16 GB</span>
									</label></li>
									<li><label> <input type="checkbox"  name="memory" value="32" class="checkbox-memory checkbox-single"> <span
											class="checkbox-list">32 GB</span>
									</label></li>
									<li><label> <input type="checkbox"  name="memory" value="64" class="checkbox-memory checkbox-single"> <span
											class="checkbox-list">64 GB</span>
									</label></li>
								</ul></li>
						</ul>
						
					</div>
					<!-- /.sidenav-section -->
				</div>
				<div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
					<div class="row">
						<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb10 alignright">
							<form action="sort.htm">
								<div class="select-option form-group">
									<select id="sort" name="sort" class="form-control">
										<option value="" disabled="disabled" selected="selected">Select</option>
										<option value="name">Name</option>
										<option value="low-price">Low Price</option>
										<option value="high-price" selected="selected">High Price</option>
									</select>
								</div>
							</form>
						</div>
					</div>
					<div class="row"  id="listProduct">
						<c:forEach var="phone" items="${listProduct}" varStatus="status">
							<!-- product -->
							<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb30">
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
												class="product-btn btn-cart add-to-cart" >
												<i class="fa fa-shopping-cart"></i></a>
										</div>
										
									</div>
								</div>
							</div>
							<!-- /.product -->
						</c:forEach>

					</div>
					<div class="row">
						<!-- pagination start -->
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="st-pagination">
								<ul class="pagination">
									<%-- <c:if test="${currentPage > 0}">
									<li><a href="home.htm?page=${currentPage - 1}" aria-label="previous"><span
											aria-hidden="true">Previous</span></a></li>
									</c:if> --%>
									<!--<c:forEach var="i" begin="${beginPage}" end="${endPage}">
										<c:choose>
										<c:when test="${i == currentPage}">
											<li class="active"><a href="#">${i}</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="home.htm?page=${i}">${i}</a></li>
										</c:otherwise>
										</c:choose>										
									</c:forEach>-->
									<li><a aria-label="Next" id="load-more"><span
											aria-hidden="true">Load more</span></a></li>
								</ul>
							</div>
						</div>
						<!-- pagination close -->
					</div>
				</div>
			</div>
		</div>	
	
		
		 <div class="fb-customerchat" style="z-index: 999;"
			 page_id="240971893141219">
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
	<script type="text/javascript" charset="UTF-8">
		(function($) {
			$(document).ready(
					function() {
						$('#cssmenu ul ul li:odd').addClass('odd');
						$('#cssmenu ul ul li:even').addClass('even');
						$('#cssmenu > ul > li > a').click(
								function() {
									$('#cssmenu li').removeClass('active');
									$(this).closest('li').addClass('active');
									var checkElement = $(this).next();
									if ((checkElement.is('ul'))
											&& (checkElement.is(':visible'))) {
										$(this).closest('li').removeClass(
												'active');
										checkElement.slideUp('normal');
									}
									if ((checkElement.is('ul'))
											&& (!checkElement.is(':visible'))) {
										$('#cssmenu ul ul:visible').slideUp(
												'normal');
										checkElement.slideDown('normal');
									}
									if ($(this).closest('li').find('ul')
											.children().length == 0) {
										return true;
									} else {
										return false;
									}
								});
					});
		})(jQuery);
		
		
	</script>
	
	<script>
		  window.fbAsyncInit = function() {
		    FB.init({
		      appId            : '613051249035298',
		      autoLogAppEvents : true,
		      xfbml            : true,
		      version          : 'v2.12'
		    });
		  };
		
		  (function(d, s, id){
		     var js, fjs = d.getElementsByTagName(s)[0];
		     if (d.getElementById(id)) {return;}
		     js = d.createElement(s); js.id = id;
		     js.src = "https://connect.facebook.net/en_US/sdk.js";
		     fjs.parentNode.insertBefore(js, fjs);
		   }(document, 'script', 'facebook-jssdk'));
		</script>
</body>
</html>