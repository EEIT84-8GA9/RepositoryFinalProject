<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/main.css" />
<link rel="stylesheet" type="text/css" href="../jquery-ui-1.11.4.custom/jquery-ui.min.css" />

<title>Product</title>
<script type="text/javascript" src="../js/jquery-2.2.1.min.js"></script>
<script type="text/javascript" src="../jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
<script type="text/javascript" src="../js/json2.js"></script>
<script type="text/javascript" src="../js/product.js"></script>
<script type="text/javascript">
var path = "${pageContext.request.contextPath}";
$(document).ready(function() {
	$('input[name="id"]').blur(function() {
		$("img:eq(0)").show();
	 	var url = path+"/pages/product.view";
		var id = $('input[name="id"]').val();
//	 	sendRequest("GET", url, id, "textText");
//	 	sendRequest("POST", url, id, "textXml");
//	 	sendRequest("POST", url, id, "textJson");
		sendRequestJSON(url, id);
	});
	$(":button").focus(function() {
 		$('input[type="text"]').val("");
	 	$("span").empty("");
	});
	
	$('input[name="make"]').attr("readonly", "readonly").datepicker({
		appendText: "請輸入YYYY-MM-DD",
		showOn: "focus",
		changeMonth: true,
		changeYear: true,
		dateFormat: "yy-mm-dd",
		defaultDate: "2010-12-01",
	});
	
});
</script>
</head>
<body>

<h3>Welcome ${LoginOK.user_name}</h3>
<h3>Product Table</h3>

<form action="<c:url value="/pages/product.controller" />" method="get">
<table>
	<tr>
		<td>ID : </td>
		<td><input type="text" name="id" value="${param.furniture_id}" onblur="doBlur()" onfocus="clearForm()"></td>
		<td><span class="error">${error.id}</span><img src="../img/ajax-loader.gif" style="display:none"/></td>
	</tr>
	<tr>
		<td>Name : </td>
		<td><input type="text" name="name" value="${param.furniture_neme}"></td>
		<td></td>
	</tr>

	<tr>
		<td>Price : </td>
		<td><input type="text" name="price" value="${param.furniture_price}"></td>
		<td><span class="error">${error.price}</span></td>
	</tr>
	<tr>
		<td>Time : </td>
		<td><input type="text" name="time" value="${param.furniture_time}"></td>
		<td><span class="error">${error.make}</span></td>
	</tr>
	<tr>
		<td>Message : </td>
		<td><input type="text" name="message" value="${param.furnitur_message}"></td>
		<td><span class="error">${error.expire}</span></td>
	</tr>
	<tr>
		<td>
			<input type="button"  value="Insert"  onclick="location.href=
		'<c:url value="/_09_furniture/insertProduct.jsp" />'"> >
			<input type="submit" name="prodaction" value="Update">
		
		</td>
		<td>
			<input type="submit" name="prodaction" value="Delete">
			<input type="submit" name="prodaction" value="Select">
			<input type="button" value="Clear" onclick="clearForm()">
		</td>
	</tr>
</table>

</form>

<h3><span class="error">${error.action}</span></h3>

<c:if test="${not empty delete}">
<h3>Delete Product Table Success : ${delete} row deleted</h3>
<script type="text/javascript">clearForm();</script>
</c:if>
<c:if test="${not empty insert}">
<h3>Insert Product Table Success</h3>
<table border="1">
	<tr><td>Name</td><td>${insert.furniture_neme}</td></tr>
	<tr><td>Price</td><td>${insert.furniture_price}</td></tr>
	<tr><td>Meaasge</td><td>${insert.furnitur_message}</td></tr>
</table>
<script type="text/javascript">clearForm();</script>
</c:if>

<c:if test="${not empty update}">
<h3>Update Product Table Success</h3>
<table border="1">
	<tr><td>Name</td><td>${update.furniture_neme}</td></tr>
	<tr><td>Price</td><td>${update.furniture_price}</td></tr>
	<tr><td>Meaasge</td><td>${update.furnitur_message}</td></tr>
</table>
<script type="text/javascript">clearForm();</script>
</c:if>

</body>
</html>