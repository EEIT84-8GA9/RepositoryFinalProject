<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>${LoginOK.user_name} 您好, 歡迎來到刊登商品頁面</h3>
<form action="<c:url value="/pages/product.controller" />" method="get">
	<table>
	<tr>
		<td>帳號: </td>
		<td><input type="text" name="user_account" value="${LoginOK.user_account}" onblur="doBlur()" onfocus="clearForm()"></td>
		<td><span class="error">${error.id}</span><img src="../img/ajax-loader.gif" style="display:none"/></td>
	</tr>
	<tr>
		<td>家具名稱 : </td>
		<td><input type="text" name="insname" value="${param.furniture_neme}"></td>
		<td></td>
	</tr>
     <tr>
		<td>刊登價格 : </td>
		<td><input type="text" name="insprice" value="${param.furniture_price}"></td>
		<td></td>
	</tr>
	<tr>
		<td>新舊程度 : </td>
		<td><input type="text" name="insstatus" value="${param.furniture_status}"></td>
		<td></td>
	</tr>
	<tr>
		<td>使用年度 : </td>
		<td><input type="text" name="instime" value="${param.furniture_time}"></td>
		<td></td>
	</tr>
	<tr>
		<td>商品地址 : </td>
		<td><input type="text" name="insaddress" value="${param.furniture_address}"></td>
		<td></td>
	</tr>
	<tr>
		<td>商品介紹 : </td>
		<td><input type="text" name="insmessage" value="${param.furniture_message}"></td>
		<td></td>
	</tr>
	<tr>
		<td>商品種類 : </td>
		<td><input type="text" name="instype" value="${param.furniture_type}"></td>
		<td></td>
	</tr>

	<tr>
		<td>
			<input type="submit" name="prodaction" value="新增刊登">
			<input type="button" value="取消刊登" onclick="location.href=
		'<c:url value="/_09_furniture/product.jsp" />'"></td>
	</tr>
	</table>
	</form>
</body>
</html>