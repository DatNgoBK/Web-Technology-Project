<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<link href="<c:url value="/resources/theme1/css/font-awesome.min.css" />"
	rel="stylesheet">
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
</head>
<body>
	<!-- footer -->
	<%@include file="_header.jsp" %>
	<!-- /.footer -->
	
    <!-- cart-section -->
    <div class="space-medium">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                    <div class="box">
                        <div class="box-head">
                            <h3 class="head-title">My Cart (${cart.countItem()})</h3>
                        </div>
                        <!-- cart-table-section -->
                        <div class="box-body">
                            <div class="table-responsive">
                                <div class="cart">
                                    <table class="table table-bordered ">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <span>Item</span></th>
                                                <th>
                                                    <span>Price</span></th>
                                                <th>
                                                    <span>Quantity</span></th>
                                                <th>
                                                    <span>Total</span></th>
                                                <th>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="item" items="${cart.cartItems}" varStatus="status">
                                            <tr>
                                                <td><a href="#"><img src="<c:url value="/resources/theme1/images/products/${cart.cartItems[status.index].phone.image}.jpg" />"
											alt=""></a>
                                                    <span><a href="#">${cart.cartItems[status.index].phone.name}</a></span>
                                                </td>
                                                <td> <f:formatNumber value="${cart.cartItems[status.index].phone.price}" type="number"></f:formatNumber>đ
                                               </td>
                                                <td>
                                                    <div class="product-quantity">
                                                        <div class="quantity">
                                                            <input id="${cart.cartItems[status.index].phone.phoneID}"type="number" class="input-text qty quantity-cart text" step="1" min="1" max="6" name="quantity" value="${cart.cartItems[status.index].quantity}" title="Qty" size="4" pattern="[0-9]*">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td><f:formatNumber value="${cart.cartItems[status.index].phone.price * cart.cartItems[status.index].quantity}" type="number"></f:formatNumber>đ
                                                </td>
                                                <th scope="row"><a href="cart.htm?command=delete&phoneID=${cart.cartItems[status.index].phone.phoneID}" class="btn-close"><i class="fa fa-times-circle-o"></i></a></th>
                                            </tr>
                                         </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.cart-table-section -->
                            </div>
                        </div>
                    </div>
                    <a href="home.htm" class="btn-link"><i class="fa fa-angle-left"></i> back to shopping</a>
                </div>
                <!-- cart-total -->
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <div class="box mb30">
                        <div class="box-head">
                            <h3 class="head-title">Price Details</h3>
                        </div>
                        <div class="box-body">
                            <div class=" table-responsive">
                                <div class="pay-amount ">
                                    <table class="table mb20">
                                        <tbody>
                                            <tr>
                                                <th>
                                                    <span id="countItem" >Price (${cart.countItem()} items)</span></th>
                                                <td id="total"><f:formatNumber value="${cart.total()}" type="number"></f:formatNumber>đ</td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    <span>Delivery Charges</span></th>
                                                <td><strong class="text-green">Free</strong></td>
                                            </tr>
                                        </tbody>
                                        <tbody>
                                            <tr>
                                                <th>
                                                    <span class="mb0" style="font-weight: 700;">Amount Payable</span></th>
                                                <td style="font-weight: 700; color: #1c1e1e; "><f:formatNumber value="${cart.total()}" type="number"></f:formatNumber>đ</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <button class="btn btn-primary btn-block"><a href="checkout.htm">Proceed To Checkout</a></button>
                            </div>
                        </div>
                    </div>
                   <%--  <!-- coupon-section -->
                    <div class="box mb30">
                        <div class="box-head">
                            <h3 class="head-title">Coupons &amp; Offers</h3>
                        </div>
                        <div class="box-body">
                            <form>
                                <div class="coupon-form">
                                    <input type="text" name="coupon_code" class="form-control" id="coupon_code" value="" placeholder="Coupon code">
                                    <input type="submit" class="btn btn-primary btn-block" name="apply_coupon" value="Apply coupon">
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- /.coupon-section --> --%>
                </div>
            </div>
            <!-- /.cart-total -->
        </div>
    </div>
    <!-- /.cart-section -->
   
   <!-- footer -->
	<%@include file="_footer.jsp" %>
	<!-- /.footer -->
   
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="<c:url value="/resources/theme1/js/jquery.min.js" />"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="<c:url value="/resources/theme1/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/theme1/js/menumaker.js" />"></script>
	<script src="<c:url value="/resources/theme1/js/jquery.sticky.js" />"></script>
	<script src="<c:url value="/resources/theme1/js/sticky-header.js" />"></script>
	
	<script >
	
	</script>
</body>
</html>