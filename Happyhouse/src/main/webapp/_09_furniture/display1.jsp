<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta name="description" content="free website template" />
<meta name="keywords" content="enter your keywords here" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/Happyhouse/css/style.css" />
<link rel="stylesheet" type="text/css" href="../jquery-ui-1.11.4.custom/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../css/lightbox.min.css" />
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" />

<title>Display</title>
<style type="text/css">
#photo {
	position:absolute;
	z-index:1;
	left:600px;
	top:75px;
	width:300px;
	height:300px;
}
</style>
<script type="text/javascript" src="../js/jquery-2.2.1.min.js"></script>
<script type="text/javascript" src="../jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
var url = "${pageContext.request.contextPath}/pages/photo.view?photoid=";
$(document).ready(function() {
	$('a[href*="photo"]').attr("data-lightbox", "product");
	$("#photo").hide();
	$("tbody>tr>td:nth-child(2)").each(function() {
		$(this).mouseover(function() {
			var id = $(this).prev().text();
			$("#photo").html('<img src="'+url+id+'">').show("bounce", null, 1000);
		});
	});
	$("tbody>tr>td:nth-child(2)").mouseout(function() {
		$("#photo").empty().hide();
	});
	
	$("table").DataTable({
		"pageLength": 3,
		"lengthMenu": [ 1, 3, 5, 7 ]
	});
});
</script>
<script type="text/javascript">
	$(window).load(function() {
		$('#slider').nivoSlider();
	});
</script>
</head>
<body>
<div id="main">
		<div id="site_content">
			<div id="site_heading">
				<h1>好宅房屋網</h1>
				<h2>歡迎  ${LoginOK.user_name}</h2>
			</div>
			<!--close site_heading-->
				<div id="header">
				<div id="menubar">
					<ul id="menu">
					
						<li class="current"><a href="/Happyhouse/index.jsp">首頁</a></li>
						<li><a href="">出售專區</a>
						<ul>
						<li><a href="/Happyhouse/_02_sellhouse/SellHouseSearch.jsp">搜尋出售</a></li>
                        <li><a href="/Happyhouse/_02_sellhouse/InsertSellHouse.jsp">刊登出售</a></li>
						</ul>
						</li>
						<li><a href="">出租專區</a>
						<ul>
						<li><a href="/Happyhouse/_03_renthouse/RentHouseSearch.jsp">搜尋出租</a></li>
                        <li><a href="/Happyhouse/_03_renthouse/InsertRentHouse.jsp">刊登出租</a></li>
						</ul>
						</li>
						<li><a href="">時價查詢</a>
						<ul>
						<li><a href="/Happyhouse/_06_currentprice/cpindex.jsp">售屋時價查詢</a></li>
                        <li><a href="/Happyhouse/_06_currentprice/cpindex.jsp">出租時價查句</a></li>
                        </ul>
						</li>
						<li><a href="">二手家具</a>
						<ul>
					    <li><a href="/Happyhouse/_09_furniture/product.jsp">搜尋家具</a></li>	
						<li><a href="/Happyhouse/_09_furniture/insertProduct.jsp">刊登二手家具</a></li>	
						<li><a href="/Happyhouse/pages/product.controller?furniture_id=&prodaction=查詢刊登家具">查詢所有刊登家具</a></li>	
						</ul>	
						<c:if test="${not empty LoginOK}">	
						<ul>
					    <li><a href="/Happyhouse/_09_furniture/product.jsp">搜尋家具</a></li>	
						<li><a href="/Happyhouse/_09_furniture/insertProduct.jsp">刊登二手家具</a></li>	
						<li><a href="/Happyhouse/pages/product.controller?furniture_id=&prodaction=查詢刊登家具">查詢所有刊登家具</a></li>	
						<li><a href="/Happyhouse/pages/product.controller?user_account=${LoginOK.user_account}&prodaction=查詢您的刊登家具">查詢您刊登的家具</a></li>
						
						</ul>
					    </c:if>
						</li>
						<li><a href="/Happyhouse/addarticle.controller">討論區</a></li>										
						<c:if test="${empty LoginOK}">
						<li><a href="/Happyhouse/_01_users/login.jsp">會員登入</a></li>
						</c:if>
						<c:if test="${not empty LoginOK}">
						<li><a href="">${LoginOK.user_name}個人專區</a>
						<ul>
<!-- 					<li><a href="/Happyhouse/sms.controller">修改個人密碼</a></li> -->
						<li><a href="/Happyhouse/_01_users/chasgePw.jsp">修改個人密碼</a></li>
						<li><a href="/Happyhouse/sms.controller">個人站內信箱</a></li>
						<li><a href="/Happyhouse/sellhousecart.controller">個人出售收藏</a></li>
						<li><a href="/Happyhouse/renthousecart.controller">個人出售收藏</a></li>
						<li><a href="/Happyhouse/_02_sellhouse/SellHouseUser.jsp">賣屋管理</a></li>
						<li><a href="/Happyhouse/_03_renthouse/RentHouseUser.jsp">租屋管理</a></li>
						<c:if test="${LoginOK.user_type=='B'||LoginOK.user_type=='C'}">
						<li><a href="/Happyhouse/_08_news/Gmindex.jsp">管理者頁面</a></li>
						</c:if>
						<li></li>
						</ul>
						</li>
						<li><a href="/Happyhouse/_01_users/logout.jsp">登出</a></li>
						</c:if>
					</ul>
					
                    </div>
				<!--close menubar-->
			</div>

<h3 align="center">更新刊登二手家具資訊</h3>
<form action="<c:url value="/pages/product.controller" />" method="get">
<c:if test="${not empty select1}">

<table>
	<thead>
	<tr>
	    <th>商品編號</th>
		<th>商品名稱</th>
		<th>商品價格</th>
		<th>商品新舊</th>
		<th>商品資訊</th>
		<th>商品照片</th>
	</tr>
	</thead>

	<tbody>
	<c:forEach var="row" items="${select1}">
		<c:url value="/_09_furniture/updateProduct.jsp" var="path" scope="page">
			<c:param name="furniture_id" value="${row.furniture_id}" />
			<c:param name="name" value="${row.furniture_name}" />
			<c:param name="price" value="${row.furniture_price}" />
			<c:param name="time" value="${row.furniture_time}" />
			<c:param name="message" value="${row.furniture_message}" />
		</c:url>
		
		<c:url value="/pages/photo.view" var="url" scope="page">
			<c:param name="photoid" value="${row.furniture_id}" />
		</c:url>

	 <tr>
		<td><a href="${path}">更新商品資訊   :${row.furniture_id}</a></td>
	    <td>${row.furniture_name}</td>
		<td>${row.furniture_price}</td>
		<td>${row.furniture_time}</td>
		<td>${row.furniture_message}</td>
		<td><a href="${url}" data-title="${row.furniture_name}"><img src="../img/01.png"></a></td>
	</tr>
	</c:forEach>
	 
	</tbody>
	
</table>


<h3 align="center">刪除刊登的二手家具</h3>
<table>
	<thead>
	<tr>
	    <th>商品編號</th>
		<th>商品名稱</th>
		<th>商品價格</th>
		<th>商品新舊</th>
		<th>商品資訊</th>
		<th>商品照片</th>
	</tr>
	</thead>

	<tbody>
	<c:forEach var="row" items="${select1}">
		<c:url value="/_09_furniture/deleteProduct.jsp" var="path" scope="page">
			<c:param name="furniture_id" value="${row.furniture_id}" />
			<c:param name="name" value="${row.furniture_name}" />
			<c:param name="price" value="${row.furniture_price}" />
			<c:param name="time" value="${row.furniture_time}" />
			<c:param name="message" value="${row.furniture_message}" />
		</c:url>
		
		<c:url value="/pages/photo.view" var="url" scope="page">
			<c:param name="photoid" value="${row.furniture_id}" />
		</c:url>

		
		<td><a href="${path}">刪除商品資訊    :${row.furniture_id}</a></td>
	    <td>${row.furniture_name}</td>
		<td>${row.furniture_price}</td>
		<td>${row.furniture_time}</td>
		<td>${row.furniture_message}</td>
		<td><a href="${url}" data-title="${row.furniture_name}"><img src="../img/01.png"></a></td>
	</tr>
	</c:forEach>
	 
	</tbody>
	
</table>
</c:if>

</form>


<h3 align="center"><a href="<c:url value="/_09_furniture/product.jsp" />">回二手家具首頁</a></h3>
 <img src="/Happyhouse/images/pro2.jpg" alt="" /> 
<div id="photo"></div>
<script type="text/javascript" src="../js/lightbox.min.js"></script>
	<div id="menu">
			<a href="http://validator.w3.org/check?uri=referer">好宅網有限公司 版權所有 © 2015-2016 HappyHouse. All Rights Reserved. </a>
		</div>
</body>
	
</html>
