<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="" />

<title>Login</title>
</head>
<body>

<h3>Login Welcome </h3>

<form action="<c:url value="/secure/login.controller" />" method="get">
<table>
	<tr>
		<td>請輸入帳號 : </td>
		<td><input type="text" name="username" value="${param.user_account}"></td>
		<td>${error.username}</td>
	</tr>
	<tr>
		<td>請輸入密碼 : </td>
		<td><input type="text" name="password" value="${param.user_password}"></td>
		<td>${error.password}</td>
	</tr>
	<tr>
		
		<td align="left"> <input type="submit" name="log" value="登入"></td>
		
		<td align="left">
		<input type="button" value="Regist" onclick="location.href=
		'<c:url value="/_01_users/regist.jsp" />'"></td>
		
	</tr>
	
</table>
</form>

</body>
</html>