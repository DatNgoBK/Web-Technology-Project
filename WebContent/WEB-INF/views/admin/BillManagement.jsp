<?xml version='1.0' encoding='UTF-8' ?>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:p="http://primefaces.org/ui">
<head>
<title>User Management</title>

<script type="text/javascript"
	src="<c:url value="/resources/theme1/JS_admin/jquery-3.2.1.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/theme1/JS_admin/jquery-ui.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/theme1/JS_admin/javascript.js" />"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/theme1/CSS_admin/style.css" />"></link>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/theme1/CSS_admin/bootstrap.min.css" />" />
</head>
<body>
	<%@include file="_header.jsp" %>
	<div class="containerfuid">
		<div class="row" style="min-height: 500px;">
			<div class="col-md-10 col-md-offset-1" style="top:100px; bottom: 100px;">
				<input type="button" name="" value="Delete Bill" onclick="return confirm('Are You Sure?');" id="btnDeleteBill"  class="btn-delete"/>
				<p:messages id="message"></p:messages>
				<div id="pngTable">
					<table cellspacing="0" cellpadding="0"
						class="table table-striped table-hover table-bordered"
						style="width: 99%" id="tblBill">
						<tr class="info">
							<th width="15px" height="20px"></th>
							<th width="25px" height="20px">#</th>
							<th width="80px" height="20px">ID</th>
							<th width="80px" height="20px">Full Name</th>
							<th width="80px" height="20px">Email</th>
							<th width="150px" height="20px">Phone Number</th>
							<th width="80px" height="20px">Address</th>
							<th width="150px" height="20px">Total</th>
						</tr>
						<c:forEach var="bill" items="${billList}" varStatus="i">
							<tr class="bill-row">
								<td><input type="checkbox" class="chkDelete" name="chkDelete" value="${bill.id}"/></td>
								<td>${i.index + 1 + offset}</td>
								<td><a href="" class="linkInfo"
									onclick="return showBillDetail('${bill.id}');">${bill.id}</a></td>
								<td>${bill.fullName}</td>
								<td>${bill.email}</td>
								<td>${bill.phone}</td>
								<td>${bill.address}</td>
								<td>${bill.total}</td>
							</tr>
						</c:forEach>
					</table>
					<c:if test="${curPage > 0}">
						<input type="button" name="" value="&lt;&lt;" onclick="location.href='bill-management.htm?page=${curPage - 1}'"
							style="margin: 0px 10px" class="btn btn-primary" />
					</c:if>
					<!-- <f:ajax listener="${userBean.changePrevPage()}" render="pngTable"/> -->
					<c:if test="${curPage < nextPage}">
						<input type="button" name="" value="&gt;&gt;" onclick="location.href='bill-management.htm?page=${curPage + 1}'" 
							class="btn btn-primary" />
					</c:if>
					<!-- <f:ajax listener="${userBean.changeNextPage()}" render="pngTable"/> -->
				</div>
				<div id="to-popup">
					<span id="btn-close"></span>
					<div id="popup-content">
						<form action="">
							<input type="hidden" name="txtID" />
							<table cellspacing="0" cellpadding="0" id="bill-table">
								<tr id="first-row-bill">
								</tr>
								<tr class="info">
									<th width="50px" height="20px">PhoneID</th>
									<th width="50px" height="20px">Quantity</th>
									<th width="50px" height="20px">Price</th>
								</tr>
							</table>
						</form>
					</div>
					<!--end #popup-content-->
				</div>
				<div id="background-popup"></div>
			</div>
		</div>
	</div>
		

	<%@include file="_footer.jsp" %>
</body>
</html>

