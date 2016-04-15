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
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>

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
						<li class="current"><a href="index.jsp">首頁</a></li>
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
						<li><a href="/Happyhouse/_09_furniture/product.jsp">刊登二手家具</a></li>	
						</ul>
						</li>
						<li><a href="addarticle.controller">討論區</a></li>										
						<c:if test="${empty LoginOK}">
						<li><a href="_01_users/login.jsp">會員登入</a></li>
						</c:if>
						<c:if test="${not empty LoginOK}">
						<li><a href="/Happyhouse/_08_news/Gmindex.jsp">管理者頁面</a></li>
						<li><a href="">個人管理頁面</a>
						<ul>
						<li><a href="/Happyhouse/sms.controller">修改個人密碼</a></li>
						<li><a href="/Happyhouse/sms.controller">個人站內信箱</a></li>
						<li></li>
						</ul>
						</li>
						<li><a href="_04_message/logout.jsp">登出</a></li>
						</c:if>
					</ul>
				</div>
				<!--close menubar-->
			</div>
			<c:if test="${not empty LoginOK}">
			<h1 align="center">${LoginOK.user_name}你好</h1>
			</c:if>
			<!--close header-->
<!-- 			<div id="banner_image"> -->
<!-- 				<div id="slider-wrapper"> -->
<!-- 					<div id="slider" class="nivoSlider"> -->
 						    <img src="images/house.jpg" alt="" /> 
<!--                        <img src="images/2.jpg" alt="" />  -->
<!-- 					<img src="images/3.jpg" alt="" /> -->
<!-- 					</div> -->
<!-- <!-- 					close slider --> 
<!-- 				</div> -->
<!-- <!-- 				close slider_wrapper --> 
<!-- 			</div> -->
			<!--close banner_image-->
			<div id="content">
				<div class="content_item">
                    <h1>${select.one.new_title}</h1>
						<p>${select.one.new_describe}</p>
				</div>
				<!--close content_item-->
				<div class="content_image">
					<a href="#"><img style="border: 10px solid #FFF;" alt="image"
						src="images/11.jpg" /></a>
				</div>
				<!--close content_image-->
				<div class="content_text">
			        <h1>${select.two.new_title}</h1>
					<p>${select.two.new_describe}</p>
				</div>
				<!--close content_text-->
				<br style="clear: both" />
				<div class="content_image_right">
					<a href="#"><img style="border: 10px solid #FFF;" alt="image"
						src="images/22.jpg" /></a>
				</div>
				
				<!--close content_image-->
				
				<div class="content_text_left">
					<h1>${select.three.new_title}</h1>
					<p>${select.three.new_describe}</p>
				</div>
				<!--close content_text-->

			</div>
			<!--close content-->

			<div class="sidebar_container">
				<div class="sidebar">
					<div class="sidebar_item">
	                    <h2>${select.four.new_title}</h2>
						<h4>${select.four.new_date}</h4>
						<p>${select.four.new_describe}</p>
					</div>
					<!--close sidebar_item-->
				</div>
				<!--close sidebar-->
				<div class="sidebar">
					<div class="sidebar_item">
						<h2>${select.five.new_title}</h2>
						<h4>${select.five.new_date}</h4>
						<p>${select.five.new_describe}</p>
					</div>
					<!--close sidebar_item-->
				</div>
				<!--close sidebar-->
				<div class="sidebar">
						<h2>${select.six.new_title}</h2>
						<h4>${select.six.new_date}</h4>
						<p>${select.six.new_describe}</p>
					</div>
					<!--close sidebar_item-->
				</div>
				<!--close sidebar-->
			</div>
			<!--close sidebar_container-->

		</div>
		<!--close site_content-->
		<div id="menu">
			<a href="http://validator.w3.org/check?uri=referer">好宅網有限公司 版權所有 © 2015-2016 HappyHouse. All Rights Reserved. </a>
		</div>
		<!--close footer-->
	</div>
	<!--close main-->
</body>
</html>
