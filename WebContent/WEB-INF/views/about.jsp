<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<head>
    <meta charset="utf-8">
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
   
     <!-- about -->
    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="box">
                          <!-- about description -->
                        <div class="box-head">
                            <h2 class="head-title">Welcome To Mobistore</h2>
                        </div>
                        <div class="box-body">
                            
                            <p class="lead">Với bề dày kinh nghiệm và uy tín đã tạo được trong những năm vừa qua, chúng tôi cam kết không lừa đảo khách hàng, luôn đem lại cho khách hàng sự hài lòng và thỏa mãn với tất cả các sản phẩm của mình. Bên cạnh đó là đội ngũ nhân viên nhiệt tình chu đáo và đầy kinh nghiệm của chúng tôi luôn đưa được ra cho khách hàng những thông tin có giá trị và giúp khách hàng lựa chọn được những sản phẩm phù hợp nhất.</p> 
                        	<p class="lead">Để nâng cao thương hiệu của mình, mục tiêu của chúng tôi trong thời gian tới là cung cấp đến tận tay khách hàng những sản phẩm chính hãng với chất lượng đảm bảo và uy tín cũng như giá cả hợp lý nhất.</p>
                        	<p class="lead">Chúng tôi mong muốn sự đóng góp của khách hàng sẽ giúp chúng tôi ngày một phát triển để từ đó củng cố thêm lòng tin của khách hàng với chúng tôi. Chúng tôi rất biết ơn sự tin tưởng của khách hàng trong suốt thời gian qua và chúng tôi luôn tâm niệm rằng cần phải cố gắng hơn nữa để xứng đáng với phương châm đề ra. </p>
                        </div>
                          <!-- /.about description -->
                    </div>
                </div>
            </div>
        </div>
          
       
         <%@include file="_footer.jsp" %>
         
     <script src="<c:url value="/resources/js/jquery.min.js" />"></script>
	<script src="<c:url value="/resources/theme1/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/theme1/js/menumaker.js" />"></script>
	<script src="<c:url value="/resources/theme1/js/jquery.sticky.js" />"></script>
	<script src="<c:url value="/resources/theme1/js/tsticky-header.js" />"></script>
	<script src="<c:url value="/resources/theme1/js/isotope.pkgd.min.js" />">
	
</body>

</html>