<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>刊登家具</title>
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
				<h2>你刊登房屋的超棒選擇</h2>
			</div>
			<!--close site_heading-->
			<div id="header">
				<div id="menubar">
					<ul id="menu">
						<li class="current"><a href="/Happyhouse/index.jsp">首頁</a></li>
						<li><a href="/Happyhouse/_02_sellhouse/SellHouseSearch.jsp">出售專區</a>
						<ul>
						<li><a href="#">搜尋出售</a></li>
                        <li><a href="#">刊登出售</a></li>
                        <li><a href="#">查詢出售收藏</a></li>
						</ul>
						</li>
						<li><a href="testimonials.html">刊登出租</a>
						<ul>
						<li><a href="#">搜尋出租</a></li>
                        <li><a href="#">刊登出租</a></li>
                        <li><a href="#">查詢出租收藏</a></li>
						</ul>
						</li>
						<li><a href="/Happyhouse/_09_furniture/product.jsp">二手家具</a>	
						<ul>
						<li><a href="/Happyhouse/_09_furniture/product.jsp">搜尋家具</a></li>	
						<li><a href="/Happyhouse/_09_furniture/insertProduct.jsp">刊登二手家具</a></li>	
						</ul>
						</li>
						<li><a href="/Happyhouse/addarticle.controller">討論區</a></li>										
						
						
						<li><a href="/Happyhouse/_08_news/Gmindex.jsp">管理者頁面</a></li>
						<li><a href="">個人管理頁面</a>
						<ul>
						<li><a href="/Happyhouse/sms.controller">修改個人密碼</a></li>
						<li><a href="/Happyhouse/sms.controller">個人站內信箱</a></li>
						<li></li>
						</ul>
						</li>
						<li><a href="../_01_users/logout.jsp">登出</a></li>
						
					</ul>
				</div>
				<!--close menubar-->
			</div>
			
			<h1 align="center"><font color=blue>王小明您好</font></h1>
			
			<!--close header-->
			<div style="padding-left:150px">
	<form action="<c:url value="/pages/product.controller" />" method="get">
		
<table>
     <tr>
		<td>帳號: </td>
		<td><input type="text" name="user_account" value="${LoginOK.user_account}" onblur="doBlur()" onfocus="clearForm()"></td>
		<td><span class="error">${error.id}</span><img src="../img/ajax-loader.gif" style="display:none"/></td>
	</tr>
	<tr>
		<td>家具名稱 : </td>
		<td><input type="text" name="insname" value="${param.furniture_neme}"></td>
		<td></td>
	</tr>
     <tr>
		<td>刊登價格 : </td>
		<td><input type="text" name="insprice" value="${param.furniture_price}"></td>
		<td></td>
	</tr>
	<tr>
		<td>新舊程度 : </td>
		<td><input type="text" name="insstatus" value="${param.furniture_status}"></td>
		<td></td>
	</tr>
	<tr>
		<td>使用年度 : </td>
		<td><input type="text" name="instime" value="${param.furniture_time}"></td>
		<td></td>
	</tr>
	<tr>
		<td>商品地址 : </td>
		<td><input type="text" name="insaddress" value="${param.furniture_address}"></td>
		<td></td>
	</tr>
	<tr>
		<td>商品介紹 : </td>
		<td><input type="text" name="insmessage" value="${param.furniture_message}"></td>
		<td></td>
	</tr>
	<tr>
		<td>商品種類 : </td>
		<td><input type="text" name="instype" value="${param.furniture_type}"></td>
		<td></td>
	</tr>

	<tr>
		<td>
			<input type="submit" name="prodaction" value="新增刊登">
			<input type="button" value="取消刊登" onclick="location.href=
		'<c:url value="/_09_furniture/product.jsp" />'"></td>
	</tr>
	</table>
	</form>
	
			</div>
			
			
		<!--close site_content-->
		<div id="footer">
			<a href="http://validator.w3.org/check?uri=referer">好宅網，最專業、最豐富的新屋、預售屋展示平台 |</a>
			<a href="http://validator.w3.org/check?uri=referer">好宅網有限公司 版權所有 © 2015-2016 HappyHouse. All Rights Reserved. </a>
		</div>
		<!--close footer-->
	</div>
	<!--close main-->
</body>
</html>
