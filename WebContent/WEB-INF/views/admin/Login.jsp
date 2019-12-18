<?xml version='1.0' encoding='UTF-8' ?>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <title>Adminstration</title>
        <script type="text/javascript" src="<c:url value="/resources/theme1/JS_admin/javascript.js" />"></script>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/theme1/CSS_admin/style.css" />" />
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/theme1/CSS_admin/bootstrap.min.css" />" />
        <script type="text/javascript" src="<c:url value="/resources/theme1/JS_admin/jquery-3.2.1.min.js" />"></script> 
        <script type="text/javascript" src="<c:url value="/resources/theme1/JS_admin/jquery-ui.min.js" />"></script> 
        <style>
			body {
				background-image: url("<c:url value="/resources/theme1/images/cluster-mapping.jpg" />");
			}
			#btn-submit {
				margin-left: 140px;
				width: 100px;
			}
		</style>
    </head>
    <body>
            <section>
                <span style="color: red; font-weight: bold;
                      font-size: 15px; position: relative; top: 310px; left: 380px;" id="loginMessage">${message}</span>
                <form:form id="login" action="authenticate.htm" method="post" prependId="false" modelAttribute="account">
                    <h3 style="text-align: center; font-family: monospace; color: white">LOGIN</h3>
                    <form:input path="username" id="txtUser" class="form-control" style="width: 400px" placeholder="Username"/><br />
                    <form:password path="password" id="txtPass" class="form-control" placeholder="Password"/><br />
                    <input id="btn-submit" type="submit"Login" onclick="return checkLogin();" class="btn btn-login"/>
                </form:form>     
            </section>

    </body>
</html>

