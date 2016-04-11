<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
table{
	margin:10px;
	padding: 10px;
	
}
td{
	padding: 30px;
}
</style>
<title>Insert title here</title>
</head>
<body>
<table border="1" >
		<tr>
			<td >標題:${param.sms_title}</td>
			<td>
			<form action="/Happyhouse/sms.controller" method="post">
				<input type="hidden" name="sms_title" value="${param.sms_title}">
				<input type="hidden" name="user_account" value="${param.sms_mailers}">
				<input type="hidden" name="sms_describe" value="${param.sms_describe}">
				<input type="submit" name="type" value="回覆">
			</form>
			</td>
		</tr>
		<tr>
			<td>寄件者:${param.sms_mailers}</td>
		</tr>
		<tr>
			<td>寄件日期:${param.sms_date}</td>
		</tr>
		<tr>
			<td  height="500">${param.sms_describe}</td>
		</tr>
		
	
</table>


		</body>
</html>