<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<c:url value="/house/house.controller"/>"method="get">
<table>
<td>sellhouse_id</td>
<td><input type="text" name="sellhouse_id" value="${param.sellhouse_id}" ></td>
</tr>
<tr>
<td>user_account</td>
<td><input type="text" name="user_account" value="${param.user_account}" ></td>
</tr>
<tr>
<td>sellhouse_name</td>
<td><input type="text" name="sellhouse_name" value="${param.sellhouse_name}" ></td>
</tr>
<td>sellhouse_price</td>
<td><input type="text" name="sellhouse_price" value="${param.sellhouse_price}" ></td>
</tr>
<tr>
<td>sellhouse_patterns</td>
<td><input type="text" name="sellhouse_patterns" value="${param.sellhouse_patterns}" ></td>
</tr>
<tr>
<td>sellhouse_address</td>
<td><input type="text" name="sellhouse_address" value="${param.sellhouse_address}" ></td>
</tr>
<tr>
<td>sellhouse_describe</td>
<td><input type="text" name="sellhouse_describe" value="${param.sellhouse_describe}" ></td>
</tr>
<tr>
<td>sellhouse_size</td>
<td><input type="text" name="sellhouse_size" value="${param.sellhouse_size}" ></td>
</tr>
<tr>
<td>sellhouse_floor</td>
<td><input type="text" name="sellhouse_floor" value="${param.sellhouse_floor}" ></td>
</tr>
<tr>
<td>sellhouse_age</td>
<td><input type="text" name="sellhouse_age" value="${param.sellhouse_age}" ></td>
</tr>
<tr>
<td>sellhouse_type</td>
<td><input type="text" name="sellhouse_type" value="${param.sellhouse_type}" ></td>
</tr>
<tr>
<td>sellhouse_message</td>
<td><input type="text" name="sellhouse_message" value="${param.sellhouse_message}" ></td>
</tr>
<tr>
<td>sellhouse_date</td>
<td><input type="text" name="sellhouse_date" value="${param.sellhouse_date}" ></td>
</tr>
<tr>
<td>sellhouse_car</td>
<td><input type="text" name="sellhouse_car" value="${param.sellhouse_car}" ></td>
</tr>
<tr>
<td>sellhouse_phone</td>
<td><input type="text" name="sellhouse_phone" value="${param.sellhouse_phone}" ></td>
</tr>
<tr>
<td>sellhouse_email</td>
<td><input type="text" name="sellhouse_email" value="${param.sellhouse_email}" ></td>
</tr>
</table>
<table>
<tr>
<td><input type="submit" value="搜尋" name="prodaction"/>
<td><input type="submit" value="新增" name="prodaction"/>
<td><input type="submit" value="修改" name="prodaction"/>
<td><input type="submit" value="刪除" name="prodaction"/>
</tr>
</table>
                                                                          
</form>
</body>
</html>