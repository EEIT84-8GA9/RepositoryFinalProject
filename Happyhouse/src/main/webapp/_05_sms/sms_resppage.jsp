<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<font color="red">${error.errorMessage}</font>
			<form action="/Happyhouse/sms.controller" method="post">
									
						<table>
							<tr>
								<td>收信人 :</td>
								<td><input type="text" name="user_account" value="${resp.user_account}" readonly="readonly"><font color="red">${error.user_accountEmpty}</font></td>
							</tr>
							<tr>
								<td>標題 :</td>
								<td><input type="text" name="sms_title" value="RE ${resp.sms_title}"><font color="red">${error.sms_titleEmpty}${error.sms_titleToolong}</font></td>
							</tr>
								
							<tr>
								<td>內文:</td>
								<td><textarea name="sms_describe"
										style="width: 400px; height: 120px;">${param.sms_describe}</textarea></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" name="type" value="回覆訊息"></td>
							</tr>
						</table>

					</form>
</body>
</html>