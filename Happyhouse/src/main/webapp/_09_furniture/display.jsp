<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="../jquery-ui-1.11.4.custom/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../css/lightbox.min.css" />
<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" />

<title>Display</title>
<style type="text/css">
#photo {
	position:absolute;
	z-index:1;
	left:600px;
	top:75px;
	width:300px;
	height:300px;
}
</style>
<script type="text/javascript" src="../js/jquery-2.2.1.min.js"></script>
<script type="text/javascript" src="../jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
var url = "${pageContext.request.contextPath}/pages/photo.view?photoid=";
$(document).ready(function() {
	$('a[href*="photo"]').attr("data-lightbox", "product");
	$("#photo").hide();
	$("tbody>tr>td:nth-child(2)").each(function() {
		$(this).mouseover(function() {
			var id = $(this).prev().text();
			$("#photo").html('<img src="'+url+id+'">').show("bounce", null, 1000);
		});
	});
	$("tbody>tr>td:nth-child(2)").mouseout(function() {
		$("#photo").empty().hide();
	});
	
	$("table").DataTable({
		"pageLength": 3,
		"lengthMenu": [ 1, 3, 5, 7 ]
	});
});
</script>
</head>
<body>

<h3>Select Product Table Result : XXX row(s) selected</h3>
<form action="<c:url value="/pages/product.controller" />" method="get">
<c:if test="${not empty select}">

<table>
	<thead>
	<tr>
	    
		<th>商品編號</th>
		<th>商品名稱</th>
		<th>商品價格</th>
		<th>商品新舊</th>
		<th>商品資訊</th>
		<th>商品照片</th>
	</tr>
	</thead>

	<tbody>
	<c:forEach var="row" items="${select}">
		<c:url value="/_09_furniture/updateProduct.jsp" var="path" scope="page">
			<c:param name="furniture_id" value="${row.furniture_id}" />
			<c:param name="name" value="${row.furniture_neme}" />
			<c:param name="price" value="${row.furniture_price}" />
			<c:param name="time" value="${row.furniture_time}" />
			<c:param name="message" value="${row.furniture_message}" />
		</c:url>
		
		<c:url value="/pages/photo.view" var="url" scope="page">
			<c:param name="photoid" value="${row.furniture_id}" />
		</c:url>
<!-- 	<tr> -->
<!-- 		<td> -->
<%-- 	<input type="button" value=":${row.furniture_id}" onclick="location.href= --%>
<%-- 		'<c:url value="/_09_furniture/updateProduct.jsp" />'"> --%>
<!-- 		</td> -->
		
		<td><a href="${path}">更新商品編號   :${row.furniture_id}</a></td>
	   <td> <input type="submit" name="prodaction" value="Delete">更新商品編號   :${row.furniture_id}</td>
        <td>${row.furniture_neme}</td>
		<td>${row.furniture_price}</td>
		<td>${row.furniture_time}</td>
		<td>${row.furniture_message}</td>
		<td><a href="${url}" data-title="${row.furniture_neme}"><img src="../img/click.png"></a></td>
	</tr>
	</c:forEach>
	</tbody>
</table>
</c:if>
</form>
<%-- <c:if test="${not empty update}"> --%>
<!-- <h3>Update Product Table Success</h3> -->
<!-- <table border="1"> -->
<%-- 	<tr><td>Name</td><td>${update.furniture_neme}</td></tr> --%>
<%-- 	<tr><td>Price</td><td>${update.furniture_price}</td></tr> --%>
<%-- 	<tr><td>Meaasge</td><td>${update.furniture_message}</td></tr> --%>
<!-- </table> -->
<!-- <script type="text/javascript">clearForm();</script> -->
<%-- </c:if> --%>
<h3><a href="<c:url value="/_09_furniture/product.jsp" />">Product Table</a></h3>
<div id="photo"></div>
<script type="text/javascript" src="../js/lightbox.min.js"></script>
</body>
	
</html>