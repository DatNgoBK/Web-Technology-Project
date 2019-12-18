<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="keywords" content="">
<title>contact us</title>
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
    
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
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
                                <li><a href="#">Home</a></li>
                                <li>Contact</li>
                            </ol>
                        </div>
                   
                </div>
            </div>
        </div>
    </div>
    <!-- /.page-header-->
      <!-- contact-form -->
    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <div class="box">
                        <div class="box-head">
                            <h2 class="head-title">Contact Us</h2>
                        </div>
                        <div class="box-body contact-form">
                        	<div class="row">
                                ${result}                               
                            </div>
                        </div>
                    </div>
                </div>
                      <!-- /.contact-form -->
                            <!-- address-block -->
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <div class="box">
                        <div class="box-head">
                            <h2 class="head-title">Contact Info</h2>
                        </div>
                        <div class="box-body">
                            <div class="contact-block">
                                <h4>Corporate Headquater</h4>
                                <p>3718 Pretty View Lane Santa Rosa, CA 95401</p>
                            </div>
                            <div class="contact-block">
                                <h4>Sales Info &amp; Inquiries</h4>
                                <p class="mb0">Toll Free: <span class="text-default">180-456-8910</span></p>
                                <p class="mb0">Email: <span class="text-default">help@mobistore.com</span></p>
                            </div>
                            <div class="contact-block">
                                <h4>General Contact</h4>
                                <p class="mb0">Phone: <span class="text-default">180-123-4567</span></p>
                                <p class="mb0">Email: <span class="text-default">demo@mobistore.com</span></p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.address-block -->
            </div>
            <!-- support-block -->
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="box">
                        <div class="box-head">
                            <h3 class="head-title">How Can We Help You?</h3>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <div class="suport-block">
                                        <div class="support-icon">
                                            <img src="./images/inquiry_icon.png" alt="">
                                        </div>
                                        <div class="support-content">
                                            <h4>Sales Inquiry</h4>
                                            <p>Suspendisse sodales venenatis velitut fringilla lorem on vulputateam augue nislpretium qutristique sodales serotut fringilla.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <div class="suport-block">
                                        <div class="support-icon">
                                            <img src="./images/support_icon.png" alt="">
                                        </div>
                                        <div class="support-content">
                                            <h4>Customer Support</h4>
                                            <p>Pendisse sodales venenatis velitut fringilla lorem on vulputateam augue nislpretium qutristique sodales seron magna.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
       <!-- /.support-block -->
          <!-- contact-map -->
    <div id="contact-map">
    </div>
        <!-- /.contact-map -->
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
	<script>
    function initMap() {
        var uluru = {
        	lat: 21.005396,
            lng: 105.846491
        };
        var map = new google.maps.Map(document.getElementById('contact-map'), {
            zoom: 14,
            center: uluru,
            scrollwheel: false
        });
        var marker = new google.maps.Marker({
            position: uluru,
            map: map,
            icon: 'images/map_pin.png'

        });
    }
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBZib4Lvp0g1L8eskVBFJ0SEbnENB6cJ-g&callback=initMap">
    </script>
</body>
</html>