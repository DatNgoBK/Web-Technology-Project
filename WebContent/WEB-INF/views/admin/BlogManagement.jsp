<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:p="http://primefaces.org/ui">
<head>
<title>Blog Management</title>

<script type="text/javascript"
	src="<c:url value="/resources/theme1/JS_admin/jquery-3.2.1.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/theme1/JS_admin/jquery-ui.min.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/theme1/JS_admin/blog.js" />"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/theme1/CSS_admin/style.css" />"></link>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/theme1/CSS_admin/bootstrap.min.css" />" />
</head>
<body>
	
	<%@include file="_header.jsp" %>
	<div class="containerfuid">
		<div class="row">
			<div class="col-md-10 col-md-offset-1" style="top:100px; bottom: 100px;">
				<input type="button" name="btnAddBlog" value="Add blog" id="btnAddBlog" class="btn-add"/>
				<input type="button" name="" value="&nbsp Delete blog" onclick="return confirm('Are You Sure?');" id="btnDeleteBlog" class="btn-delete"/>
				<p:messages id="message"></p:messages>
				<div id="pngTable">
					<table cellspacing="0" cellpadding="0"
						class="table table-striped table-hover table-bordered"
						style="width: 99%" id="tblBlog">
						<tr class="info">
							<th width="15px" height="20px"></th>
							<th width="25px" height="20px">#</th>
							<th width="80px" height="20px">Title</th>
							<th width="150px" height="20px">Intro</th>
							<th width="80px" height="20px">Author</th>
							<th width="80px" height="20px">Posted at</th>
						</tr>
						<c:forEach var="blog" items="${blogList}" varStatus="i">
							<tr class="blog-row">
								<td><input type="checkbox" class="chkDelete" name="chkDelete" value="${blog.id}"/></td>
								<td>${i.index + 1 + offset}</td>
								<td><a href="" class="linkInfo"
									onclick="return showBlogInfo('${blog.id}');">${blog.title}</a></td>
								<td>${blog.intro}</td>
								<td>${blog.author}</td>
								<td>${blog.postedAt}</td>
							</tr>
						</c:forEach>
					</table>
					<c:if test="${curPage > 0}">
						<input type="button" name="" value="&lt;&lt;" onclick="location.href='phone-management.htm?page=${curPage - 1}'"
							style="margin: 0px 10px" class="btn btn-primary" />
					</c:if>
					<c:if test="${curPage < nextPage}">
						<input type="button" name="" value="&gt;&gt;" onclick="location.href='phone-management.htm?page=${curPage + 1}'" 
							class="btn btn-primary" />
					</c:if>			
				</div>
				<div id="to-popup">
					<span id="btn-close"></span>
					<div id="popup-content">
						<form id="popup-form" action="">
							<input type="hidden" name="txtID" />
							<table cellspacing="0" cellpadding="0">
								<tr>
									<th width="150px"><span>Title</span></th>
									<td width="250px"><input type="text" name="txtTitle" /></td>
									<th width="150px"><span>Author</span></th>
									<td width="250px"><input type="text" name="txtAuthor" /></td>
								</tr>
								<tr>
									<th><span>Intro</span></th>
									<td><input type="text" name="txtIntro" /></td>
									<th><span>Posted at</span></th>
									<td><input type="datetime-local" name="txtPosted" step="1"/></td>
								</tr>
								<tr>
									<th><span>Image</span></th>
									<td><input type="text" name="txtImage" /></td>
									<th><span>Content</span></th>
									<td><input type="text" name="txtContent" /></td>
								</tr>
							</table>
							
							 <input type="file" name="file-img4" />
							<input type="button" value="OK" class="btn btn-primary btnSubmit"
								id="btnBlogSubmit" /> 
							<input type="button" value="Cancel" class="btn btnSubmit" id="btnCancel"/>
					</div>
				</div>
			</div>
		</div>
	<input type="hidden" name="curPage" value="${curPage}"/>
	<input type="hidden" name="offset" value="${offset }"/>
	<%@include file="_footer.jsp" %>
</body>
</html>

