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
<c:if test="${not empty select}">
<table>
<thead>
<th>user_account</th>
<th>sellhouse_name</th>
<th>sellhouse_price</th>
<th>sellhouse_patterns</th>
<th>sellhouse_address</th>
<th>sellhouse_describe</th>
<th>sellhouse_size</th>
<th>sellhouse_floor</th>
<th>sellhouse_age</th>
<th>sellhouse_message</th>
<th>sellhouse_date</th>
<th>sellhouse_car</th>
<th>sellhouse_phone</th>
<th>sellhouse_email</th>
</thead>
<tbody>
<c:forEach var="row" items="${select}">
	<c:url value="/house/SellHouse.jsp" var="path" scope="page">
	<c:param name="user_account" value="${row.user_account}"/>
	<c:param name="sellhouse_name" value="${row.sellhouse_name}"/>
	<c:param name="sellhouse_price" value="${row.sellhouse_price}"/>
	<c:param name="sellhouse_patterns" value="${row.sellhouse_patterns}"/>
	<c:param name="sellhouse_address" value="${row.sellhouse_address}"/>
	<c:param name="sellhouse_describe" value="${row.sellhouse_describe}"/>
	<c:param name="sellhouse_size" value="${row.sellhouse_size}"/>
	<c:param name="sellhouse_floor" value="${row.sellhouse_floor}"/>
	<c:param name="sellhouse_age" value="${row.sellhouse_age}"/>
	<c:param name="sellhouse_message" value="${row.sellhouse_message}"/>
	<c:param name="sellhouse_date" value="${row.sellhouse_date}"/>
	<c:param name="sellhouse_car" value="${row.sellhouse_car}"/>
	<c:param name="sellhouse_phone" value="${row.sellhouse_phone}"/>
	<c:param name="sellhouse_email" value="${row.sellhouse_email}"/>
	</c:url>
	<tr>
	<td>${row.user_account}</td>
	<td>${row.sellhouse_name}</td>
	<td>${row.sellhouse_price}</td>
	<td>${row.sellhouse_patterns}</td>
	<td>${row.sellhouse_address}</td>
	<td>${row.sellhouse_describe}</td>
	<td>${row.sellhouse_size}</td>
	<td>${row.sellhouse_floor}</td>
	<td>${row.sellhouse_age}</td>
	<td>${row.sellhouse_message}</td>
	<td>${row.sellhouse_date}</td>
	<td>${row.sellhouse_car}</td>
	<td>${row.sellhouse_phone}</td>
	<td>${row.sellhouse_email}</td>
	</tr>
</c:forEach>
</tbody>
</table>
</c:if>
</body>
</html>