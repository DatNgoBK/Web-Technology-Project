<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title> Mobistore Online Mobile Store Template - Blog Single Page </title>
    <!-- Bootstrap -->
    <link href="<c:url value="/resources/theme1/css/bootstrap.min.css" />" rel="stylesheet">
    <!-- Style CSS -->
    <link href="<c:url value="/resources/theme1/css/style.css" />" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i" rel="stylesheet">
    <!-- FontAwesome CSS -->
    <link href="<c:url value="/resources/theme1/css/font-awesome.min.css" />" rel="stylesheet">
    
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
     <%@include file="_header.jsp" %>
    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                    <div class="row">
                        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                            <div class="post-block ">
                                <!-- post block -->
                                <div class="post-content">
                                    <h2 class="post-title">${blog.title}</h2>
                                    <div class="meta">
                                        <span class="meta-date">${blog.postedAt}</span>
                                        <span>| &nbsp; &nbsp;</span>
                                        <span class="meta-admin">By <a href="#" class="meta-title">${blog.author}</a></span>
                                        <span>|&nbsp; &nbsp;</span>
                                        <span class="meta-comments">comments 04</span>
                                    </div>
                                    <div class="post-img">
                                        <img src="./images/post_big_img_1.jpg" alt="" class="img-responsive">
                                    </div>
                                    ${blog.content}
                                    
                                    <!-- related post block -->
                                </div>
                            </div>
                           
                </div>
                
                 <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 mb30 row">
        			<div class="fb-comments" style="margin: 0 auto" data-width="700" data-numposts="5"></div>
       			 </div>
            </div>
        </div>
        
    </div>
    
    </div>
    <div class="fb-customerchat"
			 page_id="240971893141219">
		</div>
   
    </div>
    	
    	
    
     <%@include file="_footer.jsp" %>
     
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<c:url value="/resources/theme1/js/jquery.min.js" />"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value="/resources/theme1/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/theme1/js/menumaker.js"/>" ></script>
    <script  src="<c:url value="/resources/theme1/js/jquery.sticky.js"/>"></script>
    <script  src="<c:url value="/resources/theme1/js/sticky-header.js"/>"></script>
    
		<div id="fb-root"></div>
		<script>(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.12&appId=613051249035298&autoLogAppEvents=1';
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
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