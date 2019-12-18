<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="keywords" content="">
<title>Mobistore Online Mobile Store Template - Product-list
	Page</title>
<!-- Bootstrap -->
<link href="<c:url value="/resources/theme1/css/bootstrap.min.css" />"
	rel="stylesheet">
<!-- Style CSS -->
<link href="<c:url value="/resources/theme1/css/style.css" />"
	rel="stylesheet">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i"
	rel="stylesheet">
<!-- FontAwesome CSS -->
<link href="<c:url value="/resources/css/font-awesome.min.css" />"
	rel="stylesheet">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<title>Insert title here</title>
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
                                <li><a href="#">Home</a></li>
                                <li><a href="#">product list</a></li>
                                <li><a href="#">product single</a></li>
                                <li><a href="#">cart</a></li>
                                <li>checkout</li>
                            </ol>
                        </div>
                   
                </div>
            </div>
        </div>
    </div>
    <!-- /.page-header-->
     <!-- checkout -->
    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                    <div class="box checkout-form">
                        <!-- checkout - form -->
                        <div class="box-head">
                            <h2 class="head-title">Your Detail</h2>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <form action="checkout.htm" method="POST">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label class="control-label sr-only" for="name"></label>
                                            <input name="name" type="text" class="form-control" placeholder="Enter Your Full Name" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label class="control-label sr-only" for="email">Email</label>
                                            <input id="email" name="email" type="text" class="form-control" placeholder="Enter Email Address" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label class="control-label sr-only" for="phone"></label>
                                            <input id="phone" name="phone" type="text" class="form-control" placeholder="Enter Mobile Number" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label class="control-label sr-only"></label>
                                            <input name="address" type="text" class="form-control" placeholder="Address" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <button class="btn btn-primary ">Procced to Payment</button>
                                        <input id="notify" type="hidden" value="${message}"></input>
                                        <script type="text/javascript">
                                        	notify = document.getElementById('notify').value;
                                        	if(notify=="Checkout Success")
                                        		alert(notify);
                                        	notify="";
                                        </script>
                                    </div>
                                </form>
                                    <!-- /.checkout-form -->
                            </div>
                        </div>
                    </div>
                </div>
                    <!-- product total -->
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="box mb30">
                        <div class="box-head">
                            <h3 class="head-title">Your Order</h3>
                        </div>
                        <div class="box-body">
                            <div class="table-responsive">
                                <!-- product total -->

                                <div class="pay-amount ">
                                    <table class="table mb20">
                                        <thead class="" style="border-bottom: 1px solid #e8ecf0;  text-transform: uppercase;">
                                            <tr>
                                                <th>
                                                    <span>Product</span></th>
                                                <th>
                                                    <span>Total</span></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="item" items="${cart.cartItems}" varStatus="status">
                                            <tr>
                                                <th>
                                                    <span>${cart.cartItems[status.index].phone.name} X ${cart.cartItems[status.index].quantity}</span></th>
                                                <td>${cart.cartItems[status.index].phone.price * cart.cartItems[status.index].quantity}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tbody>
                                            <tr>
                                                <th>
                                                    <span>Amount Payable</span></th>
                                                <td>${cart.total()}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.product total -->
                            </div>
                        </div>
                    </div>
                    <!-- place order -->
                    <div class="box">
                        <div class="box-head">
                            <h3 class="head-title">Check Payment</h3>
                        </div>
                        <div class="box-body">
                            <p>Please send a check to Store Name, Store Street, Store Town, Store State / County, Store Postcode.</p>
                            <button class="btn btn-default btn-block">Place Order</button>
                        </div>
                    </div>
                      <!-- /.place order -->
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
    <%@include file="_footer.jsp" %>
    <!-- /.footer -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <script src="<c:url value="/resources/js/jquery.min.js" />"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/js/menumaker.js" />"></script>
	<script src="<c:url value="/resources/js/jquery.sticky.js" />"></script>
	<script src="<c:url value="/resources/js/sticky-header.js" />"></script>
</body>
</html>