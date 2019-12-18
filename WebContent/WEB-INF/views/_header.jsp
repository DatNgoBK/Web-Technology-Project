<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body >
<div class="top-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-7 col-sm-6 hidden-xs">
					<p class="top-text">Flexible Delivery, Fast Delivery.</p>
				</div>
				<div class="col-lg-4 col-md-5 col-sm-6 col-xs-12">
					<ul>
						<li>+180-123-4567</li>
						<li>info@demo.com</li>
						<li><a href="#">Help</a></li>
					</ul>
				</div>
			</div>
			<!-- /.top-header-->
		</div>
	</div>
	<!-- header-section-->
	<div class="header-wrapper">
		<div class="container" id="search-div">
			<div class="row">
				<!-- logo -->
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-8">
					<div class="logo">
						<a href="home.htm"><img src="<c:url value="/resources/theme1/images/logo.png" />" alt="">
						</a>
					</div>
				</div>
				<!-- /.logo -->
				<!-- search -->
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="search-bg">
						<form action="search.htm">
							<input type="text" class="form-control" placeholder="Search Here" name="name" id="txtName">
							<button type="Submit">
								<i class="fa fa-search"></i>
							</button>
						</form>
					</div>
				</div>
				<!-- /.search -->
				<!-- account -->
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
					<div class="account-section">
						<ul>
							<li><a href="cart.htm" class="title"><i
									class="fa fa-shopping-cart"></i> <sup class="cart-quantity">${cart.countItem()}</sup></a>
							</li>
						</ul>
					</div>
					<!-- /.account -->
				</div>
				<!-- search -->
			</div>
		</div>
		<!-- navigation -->
		<div class="navigation" >
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<!-- navigations-->
						<div id="navigation">
							<ul>
								<li class="active"><a href="home.htm">Home</a></li>
								<li><a href="about.htm">About</a></li>
								<li><a href="list-blog.htm">Blog</a></li>
								<li><a href="contact-us.htm">Contact Us</a></li>
							</ul>
						</div>
					</div>
					<!-- /.navigations-->
				</div>
			</div>
		</div>
	</div>
	<!-- <script type="text/javascript">


	var iScrollPos = 0;

		$(window).scroll(function () {
		    var iCurScrollPos = $(this).scrollTop();
		    if (iCurScrollPos > iScrollPos) {
		        $('#search-div').hide();
		        $('.navigation').css({"top":"0px"});
		        $('.header-wrapper').css({"padding-top":"0px"});
		        $('.header-wrapper').css({"padding-bottom":"0px"});
		    } else {
		    	 $('#search-div').show();

			        $('.navigation').css({"top":"20px"});
			        $('.header-wrapper').css({"padding-top":"20px"});
			        $('.header-wrapper').css({"padding-bottom":"20px"});
		    }
		    iScrollPos = iCurScrollPos;
		});
	</script> -->
</body>
</html>