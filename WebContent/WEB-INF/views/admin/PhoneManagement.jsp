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
		<div class="row"  style="min-height: 500px;">
			<div class="col-md-10 col-md-offset-1" style="top:100px; bottom: 100px;">
				<input type="button" name="btnAddUser" value="Add Phone" id="btnAddPhone"  class="btn-add"/>
				<input type="button" name="" value="Delete Phone" onclick="return confirm('Are You Sure?');" id="btnDeletePhone"  class="btn-delete"/>
				<p:messages id="message"></p:messages>
				<div id="pngTable">
					<table cellspacing="0" cellpadding="0"
						class="table table-striped table-hover table-bordered"
						style="width: 99%" id="tblPhone">
						<tr class="info">
							<th width="15px" height="20px"></th>
							<th width="25px" height="20px">#</th>
							<th width="80px" height="20px">Name</th>
							<th width="150px" height="20px">Screen</th>
							<th width="80px" height="20px">Front Camera</th>
							<th width="80px" height="20px">Following Camera</th>
							<th width="100px" height="20px">CPU</th>
							<th width="50px" height="20px">RAM</th>
							<th width="50px" height="20px">Memory</th>
							<th width="100px" height="20px">Price</th>
							<th width="50px" height="20px">Amount</th>
						</tr>
						<c:forEach var="phone" items="${phoneList}" varStatus="i">
							<tr class="phone-row">
								<td><input type="checkbox" class="chkDelete" name="chkDelete" value="${phone.phoneID}"/></td>
								<td>${i.index + 1 + offset}</td>
								<td><a href="" class="linkInfo"
									onclick="return showPhoneInfo('${phone.phoneID}');">${phone.name}</a></td>
								<td>${phone.screen}</td>
								<td>${phone.frontCamera}</td>
								<td>${phone.followingCamera}</td>
								<td>${phone.cpu}</td>
								<td>${phone.ram}</td>
								<td>${phone.memory}</td>
								<td>${phone.price}</td>
								<td>${phone.amount}</td>
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
							<input type="hidden" name="txtID" required/>
							<table cellspacing="0" cellpadding="0">
								<tr>
									<th width="150px"><span>Name</span></th>
									<td width="250px"><input type="text" name="txtName" /></td>
									<th width="150px"><span>Screen</span></th>
									<td width="250px"><input type="text" name="txtScreen" /></td>
								</tr>
								<tr>
									<th><span>OS</span></th>
									<td><input type="text" name="txtOS"  required/></td>
									<th><span>Front Camera</span></th>
									<td><input type="text" name="txtFrontCamera"  required/></td>
								</tr>
								<tr>
									<th><span>Following Camera</span></th>
									<td><input type="text" name="txtFollowingCamera"  required/></td>
									<th><span>CPU</span></th>
									<td><input type="text" name="txtCPU"  required/></td>
								</tr>
								<tr>
									<th><span>RAM</span></th>
									<td><input type="text" " name="txtRAM"  required/></td>
									<th><span>Amount</span></th>
									<td><input type="text" name="txtAmount" required /></td>
								</tr>
								<tr>
									<th><span>Memory Card</span></th>
									<td><input type="text" name="txtMemoryCard"  required/></td>
									<th><span>SIM</span></th>
									<td><input type="text" name="txtSIM"  required/></td>
								</tr>
								<tr>
									<th><span>Battery</span></th>
									<td><input type="text" name="txtBattery" required /></td>
									<th><span>Brand</span></th>
									<td><select style="width: 100%; height: 30px"
										name="selBrand">
											<c:forEach items="${brands}" var="brand">
												<option value="${brand.brandID}">${brand.name}</option>
											</c:forEach>
									</select></td>
								</tr>
								<tr>
									<th><span>Memory</span></th>
									<td><input type="text" name="txtMemory" required /></td>
									<th><span>Price</span></th>
									<td><input type="text" name="txtPrice" required /></td>
								</tr>
		
							</table>
							<div class="div-image" name = "div-image1">
								<img alt="" name="img1" /> 
							</div>
							<input type="file" name="file-img1" />
							<div class="div-image" name = "div-image2">
								<img alt="" name="img2" /> 
							</div>
							<input type="file" name="file-img2" />
							<div class="div-image"  name = "div-image3">
								<img alt="" name="img3" /> 
							</div>
							<input type="file" name="file-img3" />
							<div class="div-image" name = "div-image4">
								<img alt="" name="img4" />
							</div>
							 <input type="file" name="file-img4" />
							<input type="button" value="OK" class="btn btn-primary btnSubmit"
								id="btnSubmit" /> <input type="button" value="Cancel"
								class="btn btnSubmit" />
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

