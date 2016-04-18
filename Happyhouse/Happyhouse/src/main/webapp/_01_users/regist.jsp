<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Regist title here</title>
</head>
<body>
<form action="/Happyhouse/secure/regist.controller" method="get">
<table>
	<tr>
		<td>帳號 : </td>
		<td><input type="text" name="user_account" value="${param.user_account}" onblur="doBlur()" onfocus="clearForm()"></td>
		<td><span class="error">${error.user_account}</span><img src="../img/ajax-loader.gif" style="display:none"/></td>
	</tr>
	<tr>
		<td>密碼 : </td>
		<td><input type="text" name="user_password" value="${param.user_password}"></td>
		<td><span class="error">${error.user_password}</span><img src="../img/ajax-loader.gif" style="display:none"/></td>
		<td></td>
	</tr>

	<tr>
		<td>名子 : </td>
		<td><input type="text" name="user_name" value="${param.user_name}"></td>
		<td><span class="error">${error.user_name} </span></td>
	</tr>
	<tr>
		<td>地址 : </td>
		<td><input type="text" name="user_address" value="${param.user_address}"></td>
		<td><span class="error">${error.user_address}</span></td>
	</tr>
	<tr>
		<td>聯絡電話 : </td>
		<td><input type="text" name="user_phone" value="${param.user_phone}"></td>
		<td><span class="error">${error.user_phone}</span></td>
	</tr>
		<tr>
		<td>電子信箱 : </td>
		<td><input type="text" name="user_email" value="${param.user_email}"></td>
		<td><span class="error">${error.user_email}</span></td>
	</tr>
		<tr>
		<td>性別 : </td>
		<td><input type="text" name="user_gender" value="${param.user_gender}"></td>
		<td><span class="error">${error.user_gender}</span></td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="註冊">
			<input type="button" value="取消" onclick="location.href=
		'<c:url value="/_01_users/login.jsp" />'"></td>
		
	
	</tr>
</table>

</form>


<h3><span class="error">${error.action}</span></h3>
</body>
</html>