<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
    <title> Mobistore Online Mobile Store Template - Blog Default Page </title>
    
    <!-- Bootstrap -->
	<link href="<c:url value="/resources/theme1/css/bootstrap.min.css" />" rel="stylesheet" />
	<!-- Style CSS -->
	<link href="<c:url value="/resources/theme1/css/style.css" />" rel="stylesheet" />
	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i" rel="stylesheet" />
	<!-- FontAwesome CSS -->
	<link href="<c:url value="/resources/theme1/css/font-awesome.min.css" />" rel="stylesheet" />
	<script src="<c:url value="/resources/theme1/js/jquery.min.js" />" ></script>
	<script src="<c:url value="/resources/theme1/js/jquery-ui.js" />"></script>
	<script src="<c:url value="/resources/theme1/js/home.js" />"></script>
 
</head>

<body>
   <%@include file="_header.jsp" %>
   
    <!-- blog -->
    <div class="space-medium">
        <div class="container">
            <div class="row">
                <div class="isotope">
                    
                    <c:forEach items="${listBlog}" var="blog" varStatus="index">
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 post-masonry">
                        <div class="post-block">
                            <!-- post block -->
                            <h3 class="post-title"><a href="blog.htm?id=${blog.id}" class="title">${blog.title}</a></h3>
                            <div class="meta">
                                <span class="meta-date">${blog.postedAt}</span>
                                <span>|&nbsp; &nbsp;</span>
                                <span class="meta-admin">By <a href="#" class="meta-title">Admin</a></span>
                            </div>
                            <div class="post-img">
                                <a href="#" class="imghover">
                            <img src="<c:url value="/resources/theme1/images/blogs/${blog.image}" />"
											alt=""></a>
                            </div>
                            <div class="post-content">
                                <p>${blog.intro}</p>
                                <a href="blog.htm?id=${blog.id}" class="btn btn-primary btn-sm">read more</a>
                            </div>
                        </div>
                        
                    </div>
                    </c:forEach>
                    
                </div>
            </div>
        </div>
    </div>
    <!-- blog -->
    
     <%@include file="_footer.jsp" %>
         
    <script src="<c:url value="/resources/js/jquery.min.js" />"></script>
	<script src="<c:url value="/resources/theme1/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/theme1/js/menumaker.js" />"></script>
	<script src="<c:url value="/resources/theme1/js/jquery.sticky.js" />"></script>
	<script src="<c:url value="/resources/theme1/js/tsticky-header.js" />"></script>
	<script src="<c:url value="/resources/theme1/js/isotope.pkgd.min.js" />">
    
    // external js: isotope.pkgd.js

    $(function() {
        $('.isotope').isotope({
            itemSelector: '.post-masonry',
            masonry: {}
        });

    });
	
     
    </script>
    <script type="text/javascript">
    $(document).ready(function() {
		page = 0;
   		
    	$(window).scroll(function () {
    	    if ($(document).height() <= $(window).scrollTop() + $(window).height()) {
     	      page++;
			   $.ajax({
						type: "GET",
						encoding:"UTF-8",
						url : "load-more-blogs.htm?page="+page,
						dataType: "json",
						success: function (result) {
						for (var index in result) {
							 $(".isotope").append('<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 post-masonry">' +
				                '<div class="post-block">' +
				                '<h3 class="post-title"><a href="blog.htm?id=' + result[index].id + '" class="title">' + result[index].title + '</a></h3>' +
				                '<div class="meta">' +
				                    '<span class="meta-date">' + result[index].postedAt + '</span>' +
				                    '<span>|&nbsp; &nbsp;</span>' +
				                    '<span class="meta-admin">By <a href="#" class="meta-title">Admin</a></span>' +
				                '</div>' +
				               ' <div class="post-img">' +
				                    '<a href="#" class="imghover">' +
				                '<img src="<c:url value="/resources/theme1/images/blogs/' + result[index].image + '" />"' +
												'alt=""></a>' +
				                '</div>' +
				                '<div class="post-content">' +
				                    '<p>' + result[index].intro + '</p>' +
				                    '<a href="blog.htm?id=' + result[index].id + '" class="btn btn-primary btn-sm">read more</a>' +
				                '</div>'+
				            '</div>'+
				            
				        '</div>'
						)
						}
							return;
						},
						failure: function (response) {
							alert(response.responseText);
						},
						error: function (response) {
							alert(response.responseText);
						}
					});
    	       
    	    }
    	 });
    	
    });  		
	    
    </script>
</body>

</html>