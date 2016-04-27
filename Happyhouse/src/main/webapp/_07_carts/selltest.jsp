<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>好宅網-首頁</title>
<meta name="description" content="free website template" />
<meta name="keywords" content="enter your keywords here" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/Happyhouse/css/style.css" />
<script type="text/javascript" src="/Happyhouse/js/jquery.min.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery.easing.min.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery.nivo.slider.pack.js"></script>
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
						<li class="current"><a href="index.jsp">首頁</a></li>
						<li><a href="ourwork.html">刊登出售</a></li>
						<li><a href="testimonials.html">刊登出租</a></li>
						<li><a href="/Happyhouse/_08_news/test.jsp">討論區</a></li>
						<li><a href="contact.html">會員登入</a></li>
					</ul>
				</div>
				<!--close menubar-->
			</div>
			<!--close header-->
		
		<!--close slider_wrapper-->
<table>
	<thead>
	<tr>
		<th>收藏編號</th>
		<th>收藏會員</th>
		<th>房屋標題</th>
		<th>房屋價格</th>
		<th>房屋格局</th>
		<th>房屋地址</th>
		<th>其他內容</th>
		<th>房屋坪數</th>
		<th>房屋樓層</th>
		<th>房屋年齡</th>
		
		
	</tr>
	</thead>
	<tbody>
	<c:forEach var="row" items="${sell}">
<%-- 		<c:url value="/test.jsp" var="path" scope="page"> --%>
<%-- 			<c:param name="id" value="${row.new_id}" /> --%>
<%-- 			<c:param name="title" value="${row.new_title}" /> --%>
<%-- 			<c:param name="describe" value="${row.new_describe}" /> --%>
<%-- 			<c:param name="date" value="${row.new_date}" /> --%>
<%-- 		</c:url> --%>
	<tr>
		<td>${row.cart_id}</td>
		<td>${row.user_account}</td>
		<td>${row.sellhouse_name}</td>
		<td>${row.sellhouse_price}</td>
	    <td>${row.sellhouse_patterns}</td>
	    <td>${row.sellhouse_address}</td>
	    <td>${row.sellhouse_describe}</td>
	    <td>${row.sellhouse_size}</td>
	    <td>${row.sellhouse_floor}</td>
	    <td>${row.sellhouse_age}</td>
	    <td>${row.sellhouse_photo1}</td>
	    <td>${row.sellhouse_photo2}</td>
	    <td>${row.sellhouse_photo3}</td>
	</tr>
	
						
				</c:forEach>
			</tbody>
		</table>
	<!--close site_content-->
	<div id="footer">
		<a href="http://validator.w3.org/check?uri=referer">好宅網，最專業、最豐富的新屋、預售屋展示平台
			|</a> <a href="http://validator.w3.org/check?uri=referer">好宅網有限公司
			版權所有 © 2015-2016 HappyHouse. All Rights Reserved. </a>

	<!--close footer-->
    </div>
	<!--close main-->
	</div>
</body>
</html>
