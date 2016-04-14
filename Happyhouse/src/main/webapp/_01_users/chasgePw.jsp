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
<h3>Welcome ${LoginOK.user_name}</h3>
<form action="<c:url value="/secure/login.controller" />" method="get">
<table>	
    <tr>
		<td>您的登入帳號: </td>
		<td><input type="text" name="username" value="${LoginOK.user_account}"></td>
		<td>${error.username}</td>
	</tr>
	<tr>
		<td>您的原密碼 : </td>
		<td><input type="text" name="password" value="${LoginOK.user_password}"></td>
		<td>${error.password}</td>
	</tr>
	<tr>
		<td>欲變更的新密碼 : </td>
       <td><input type="text" name="password1"></td>
		<td>${error.username}</td>
	</tr>
	<tr>
		<td>請再次確認新密碼 : </td>
		<td><input type="text" name="password2" ></td>
		<td>${error.password}</td>
	</tr>
	<tr>
		
		<td align="left"> <input type="submit" name="log" value="確認更改"></td>
		<td align="left">
		<input type="button" value="取消更改" onclick="location.href=
		'<c:url value="/secure/login.jsp" />'"></td>
	</tr>
	
</table>
</form>
</body>
</html>