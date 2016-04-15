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
<h3>${LoginOK.user_name} 您好</h3>
<form action="<c:url value="/pages/product.controller" />" method="get">
	<table>
	 <tr>
		<td>帳號:   ${LoginOK.user_account} </td>
	</tr>
		<tr>
		<td>ID : </td>
		<td><input type="text" name="xxx1" value="${LoginOK.user_name}" onblur="doBlur()" onfocus="clearForm()"></td>
		<td><span class="error">${error.id}</span><img src="../img/ajax-loader.gif" style="display:none"/></td>
	</tr>
	<tr>
		<td>Name : </td>
		<td><input type="text" name="xxx" value="${LoginOK.user_account}"></td>
		<td></td>
	</tr>
<tr>
		<td>Name : </td>
		<td><input type="text" name="name" value="${param.furniture_neme}"></td>
		<td></td>
	</tr><tr>
		<td>Name : </td>
		<td><input type="text" name="name" value="${param.furniture_neme}"></td>
		<td></td>
	</tr><tr>
		<td>Name : </td>
		<td><input type="text" name="name" value="${param.furniture_neme}"></td>
		<td></td>
	</tr><tr>
		<td>Name : </td>
		<td><input type="text" name="name" value="${param.furniture_neme}"></td>
		<td></td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="新增刊登">
			<input type="button" value="取消刊登" onclick="location.href=
		'<c:url value="/_09_furniture/product.jsp" />'"></td>
		
	
	</tr>
	</table>
	</form>
</body>
</html>