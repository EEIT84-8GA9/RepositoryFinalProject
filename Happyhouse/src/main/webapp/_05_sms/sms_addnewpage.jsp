<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<title>Insert title here</title>
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
						<li><a href="/Happyhouse/addarticle.controller">討論區</a></li>										
						<c:if test="${empty LoginOK}">
						<li><a href="/Happyhouse/_01_users/login.jsp">會員登入</a></li>
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
			<h1 align="center"><font color=blue>${LoginOK.user_name}你好</font></h1>
			</c:if>
			<!--close header-->
<!-- 			<div id="banner_image"> -->
<!-- 				<div id="slider-wrapper"> -->
<!-- 					<div id="slider" class="nivoSlider"> -->
 						    <img src="/Happyhouse/images/house.jpg" alt="" /> 
<!--                        <img src="images/2.jpg" alt="" />  -->
<!-- 					<img src="images/3.jpg" alt="" /> -->
<!-- 					</div> -->
<!-- <!-- 					close slider --> 
<!-- 				</div> -->
<!-- <!-- 				close slider_wrapper --> 
<!-- 			</div> -->
			<!--close banner_image-->
<font color="red">${error.errorMessage}</font>
			<form action="/Happyhouse/sms.controller" method="post">
									
						<table>
							<tr>
								<td>收信人 :</td>
								<td><input type="text" name="user_account" value="${param.user_account}"><font color="red">${error.user_accountEmpty}${error.errorUser_account}${error.sameUser}</font></td>
							</tr>
							<tr>
								<td>標題 :</td>
								<td><input type="text" name="sms_title" value="${param.sms_title}"><font color="red">${error.sms_titleEmpty}${error.sms_titleToolong}</font></td>
							</tr>
								
							<tr>
								<td>內文:</td>
								<td><textarea name="sms_describe"
										style="width: 400px; height: 120px;">${param.sms_describe}</textarea></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" name="type" value="發送訊息"></td>
							</tr>
						</table>

					</form>
</body>
</html>