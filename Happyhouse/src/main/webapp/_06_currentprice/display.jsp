<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/table.css" />
<title>Display</title>
</head>
<body>

<h3>Select CurrentPrice Table Result : XXX row(s) selected</h3>
<!-- 以各區分別     currentprice_city -->
<!-- 以類別區分     currentprice_bdtype  -->
<!-- 賣的樓層       currentprice_transes   -->
<!-- 總坪數         currentprice_housearea -->
<!-- 總價元         currentprice_tprice -->
<c:if test="${not empty select}">
<table>
	<thead>
	<tr>
		<th>currentprice_city</th>
		<th>currentprice_bdtype</th>
		<th>currentprice_transes</th>
		<th>currentprice_housearea</th>
		<th>currentprice_tprice</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="row" items="${select}">
		<c:url value="/pages/cpweb.jsp" var="path" scope="page">
			<c:param name="currentprice_city" value="${row.currentprice_city}" />
			<c:param name="currentprice_bdtype" value="${row.currentprice_bdtype}" />
			<c:param name="currentprice_transes" value="${row.currentprice_transes}" />
			<c:param name="currentprice_housearea" value="${row.currentprice_housearea}" />
			<c:param name="currentprice_tprice" value="${row.currentprice_tprice}" />
		</c:url>
	<tr>
		<td><a href="${path}">${row.currentprice_city}</a></td>
		<td>${row.currentprice_bdtype}</td>
		<td>${row.currentprice_transes}</td>
		<td>${row.currentprice_housearea}</td>
		<td>${row.currentprice_tprice}</td>
	</tr>
	</c:forEach>
	</tbody>
</table>
</c:if>

<h3><a href="<c:url value="/pages/cpweb.jsp" />">cpweb index</a></h3>
</body>
</html>