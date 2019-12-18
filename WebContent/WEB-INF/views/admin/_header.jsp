<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/theme1/CSS_admin/bootstrap.min.css" />" />
	<script type="text/javascript" src="<c:url value="/resources/theme1/JS_admin/jquery-3.2.1.min.js" />"></script>
	<style type="text/css">
		* {
			margin: 0px;
			padding: 0px;
		}
		#banner {
			background: #34495e; /* For browsers that do not support gradients */
			height: 80px;
		}
		#slogan {
			padding: 20px 20px;
			margin: 0px;
			color: white;
			font-family: monospace;
		}
		#menu ul li {
			display: inline-block;
			padding: 20px;
			color: white;
		}
		#menu ul li a{
			color: white;
			text-decoration: none;
		}
		#menu ul li:hover {
			background-color: #34495eba;
		}
		#menu ul {
			list-style-type: none;
			margin-bottom: 0px;
		}
		#menu {
			background-color: #627a92;
		    position: fixed;
		    width: 100%;
		    z-index:2;
		}
		#menu-left, #menu-right {
			display: inline-block;
		}
		#menu-right {
			float: right;
		}
		.icon {
			padding: 0 10px;
		}
	</style>
</head>
<body>
	<div id="banner">
		<h2 id="slogan">MobiStore.com - Adminstrator</h2>
	</div>
	<div id="menu">
		<ul id="menu-left">
			<a href="phone-management.htm"><li>Điện thoại</li></a>
			<a href="bill-management.htm"><li>Hóa đơn</li></a>
			<a href="user-management.htm"><li>User</li></a>
			<a href="blog-management.htm"><li>Blog</li></a>
		</ul>
		<ul id="menu-right">
			<li><span class="icon glyphicon glyphicon-user"></span><a href="login.htm">Đăng xuất</a></li>
		</ul>
	</div>
	
	<script type="text/javascript">
	var iScrollPos = 0;

	/* $(window).scroll(function () {
	    var iCurScrollPos = $(this).scrollTop();
	    if (iCurScrollPos > iScrollPos) {
	        $('#banner').css("display", "none");
	    } else {
	    	
	    }
	    iScrollPos = iCurScrollPos;
	}); */
	$(window).scroll(function() // when user scrolls
			{
			    if($(window).scrollTop() > 0) {
			    	 $('#banner').css("height", "0px");
		    		 $('#menu').css("top","0px");
			    }

			    else {
			    	 $('#banner').css("height", "80px");
	    			$('#menu').css("top","");
			    }
			});
	</script>
	
</body>
</html>