<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:p="http://primefaces.org/ui">
<head>
<title>Student Management</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript"
	src="<c:url value="/resources/theme1/JS_admin/jquery-3.2.1.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/theme1/JS_admin/jquery-ui.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/theme1/JS_admin/javascript.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/theme1/JS_admin/js_user.js" />"></script>	
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/theme1/CSS_admin/style.css" />"></link>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/theme1/CSS_admin/bootstrap.min.css" />" />
</head>
<style>
		/* Start by setting display:none to make this hidden.
	   Then we position it in relation to the viewport window
	   with position:fixed. Width, height, top and left speak
	   for themselves. Background we set to 80% white with
	   our animation centered, and no-repeating */
	.modal {
	    display:    none;
	    position:   fixed;
	    z-index:    1000;
	    top:        0;
	    left:       0;
	    height:     100%;
	    width:      100%;
	    background: rgba( 255, 255, 255, .8 ) 
	                url('http://i.stack.imgur.com/FhHRx.gif') 
	                50% 50% 
	                no-repeat;
	}
	
	/* When the body has the loading class, we turn
	   the scrollbar off with overflow:hidden */
	body.loading .modal {
	    overflow: hidden;   
	}
	
	/* Anytime the body has the loading class, our
	   modal element will be visible */
	body.loading .modal {
	    display: block;
	}
</style>
<body>
	
	<%@include file="_header.jsp" %>
		
	<div class="containerfuid">
		<div class="row"  style="min-height: 500px;">
			<div class="col-md-10 col-md-offset-1" style="top:100px; bottom: 100px;">
				
	<form id="info">
		<input type="button" name="btnAddUser" value="Add User" id="btnAddUser"  class="btn-add"/>
		<input type="button" name="" value="Delete User" onclick="return confirm('Are You Sure?');" id="btnDeleteUser"  class="btn-delete"/>
		<p:messages id="message"></p:messages>
		<div id="pngTable">
			<table cellspacing="0" cellpadding="0"
				class="table table-striped table-hover table-bordered"
				style="width: 99%" id="tblUser">
				<tr class="info">
					<th width="15px" height="20px"></th>
					<th width="25px" height="20px">#</th>
					<th width="80px" height="20px">Name</th>
					<th width="150px" height="20px">UserName</th>
					<th width="80px" height="20px">Role</th>
				</tr>
				<c:forEach var="user" items="${userList}" varStatus="i">
					<tr class="user-row">
						<td><input type="checkbox" class="chkDelete" name="chkDelete" value="${user.id}"/></td>
						<td>${i.index + 1 + offset}</td>
						<td><a href="" class="linkInfo"
							onclick="return showUser('${user.id}');">${user.name}</a></td>
						<td>${user.username}</td>
						<td>${user.role}</td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${curPage > 0}">
				<input type="button" name="" value="&lt;&lt;" onclick="location.href='phone-management.htm?page=${curPage - 1}'"
					style="margin: 0px 10px" class="btn btn-primary" />
			</c:if>
			<!-- <f:ajax listener="${userBean.changePrevPage()}" render="pngTable"/> -->
			<c:if test="${curPage < nextPage}">
				<input type="button" name="" value="&gt;&gt;" onclick="location.href='phone-management.htm?page=${curPage + 1}'" 
					class="btn btn-primary" />
			</c:if>
			<!-- <f:ajax listener="${userBean.changeNextPage()}" render="pngTable"/> -->
		</div>
		<div id="to-popup">
			<span id="btn-close"></span>
			<div id="popup-content">
				<form action="">
					<input type="hidden" name="txtID" />
					<table cellspacing="0" cellpadding="0">
						<tr>
							<th width="150px"><span>Name</span></th>
							<td width="250px"><input type="text" name="txtName" /></td>
						</tr>
						<tr>
							<th><span>Username</span></th>
							<td><input type="text" name="txtUsername" /></td>
						</tr>
						<tr>
							<th><span>Password</span></th>
							<td><input type="text" name="txtPassword" /></td>
						</tr>
						<tr>
							<th><span>Role</span></th>
							<td><input type="text" name="txtRole" /></td>
							<%-- <th><span>Brand</span></th>
							<td><select style="width: 100%; height: 30px"
								name="selBrand">
									<c:forEach items="${roles}" var="role">
										<option value="${role.brandID}">${brand.name}</option>
									</c:forEach>
							</select></td> --%>
						</tr>
						
					</table>
					<input type="button" value="OK" class="btn btn-primary btnSubmit"
						id="btnUserSubmit" />
					<input type="button" id="Cancel" value="Cancel"
						class="btn btnSubmit" />
				</form>
			</div>
			<!--end #popup-content-->
		</div>
		<div id="background-popup"></div>
	</form>
			</div>
		</div>
	</div>
	<div id="background-popup"></div>
	<div class="modal"></div>
	<%@include file="_footer.jsp" %>
</body>
</html>

