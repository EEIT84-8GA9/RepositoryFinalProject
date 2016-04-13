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
				<h2>你刊登房屋的好選擇</h2>
			</div>
			<!--close site_heading-->
			<div id="header">
				<div id="menubar">
					<ul id="menu">
						<li class="current"><a href="/Happyhouse/index.jsp">首頁</a></li>
						<li><a href="ourwork.html">刊登出售</a></li>
						<li><a href="/Happyhouse/_07_carts/gousejsp.jsp">刊登出租</a></li>
						<li><a href="/Happyhouse/_08_news/test.jsp">討論區</a></li>
						<li><a href="contact.html">會員登入</a></li>
					</ul>
				</div>
				<!--close menubar-->
			</div>
			<!--close header-->
		
		<!--close slider_wrapper-->
<form action="<c:url value="/gousejsp.controller" />" method="post">



<table>
			<tbody>
			<tr style="border: 1px solid black;">
				<td>請輸入帳號</td>
				<td><input type="text" name="user_account" value="">${error.sell}${error.non}</td>
			</tr>
				<tr>
		           <td style="border: 1px solid black;"><input type="submit"
						name="sell" value="這裡往出售"></td>
				</tr>
				<tr>
					<td style="border: 1px solid black; width: 10px"><input
						type="submit" name="rent" value="這裡往出租"></td>
						</tr>
</tbody>
</table>


<a href="/Happyhouse/index.jsp">首頁</a>

</form>
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