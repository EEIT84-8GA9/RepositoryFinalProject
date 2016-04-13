<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<li class="current"><a href="../index.jsp">首頁</a></li>
						<li><a href="ourwork.html">刊登出售</a></li>
						<li><a href="testimonials.html">刊登出租</a></li>
						<li><a href="/Happyhouse/addarticle.controller">討論區</a></li>
						<li><a href="/Happyhouse/sms.controller">站內信</a></li>
						<c:if test="${empty LoginOK}">
						<li><a href="login.jsp">會員登入</a></li>
						</c:if>
						<c:if test="${not empty LoginOK}">
						<li><a href="logout.jsp">登出</a></li>
						</c:if>
					</ul>
				</div>
				<!--close menubar-->
			</div>
			<h1 align="center"><font color=blue>${LoginOK.user_name}你好</font></h1>
			<!--close header-->
			<div id="banner_image">
				<div id="slider-wrapper">
					<div id="slider" class="nivoSlider">
						<img src="/Happyhouse/images/1.jpg" alt="" /> <img src="/Happyhouse/images/2.jpg" alt="" />
						<img src="/Happyhouse/images/3.jpg" alt="" />
					</div>
					<!--close slider-->
				</div>
				<!--close slider_wrapper-->
			</div>
			<!--close banner_image-->
			<div id="content">
				<div class="content_item">
					<h1>歡迎您來到好宅房屋網</h1>

				</div>
				<!--close content_item-->

				<div class="content_text">
					<p></p>
				</div>
				<!--close content_text-->

				<div class="content_text_left">

					<form action="<c:url value='/addarticle.controller' />" method="post">
						<table>

							<tr>
								<td>標題 :</td>
								<td><input type="text" name="title" value="${param.title}"><font color="red">${error.titleToolong}${error.titleSame}${error.titleEmpty}</font></td>
								<td></td>
							</tr>
								
							<tr>
								<td>內文:</td>
								<td><font color="red">${error.contentEmpty}</font><textarea name="content"
										style="width: 400px; height: 120px;">${param.content}</textarea></td>
								<td><span class="error"></span></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" name="type" value="送出文章"></td>
							</tr>
						</table>

					</form>


				</div>
				<!--close content_text-->

			</div>
			<!--close content-->

			<div class="sidebar_container">
				<div class="sidebar">
					<div class="sidebar_item">
						<h2>房屋資訊</h2>
						<h4>2016/04/01</h4>
						<p>因為我是最近回鍋 玩了第三天RB服就開了 現在感覺很多人因為活動才來 有人想一起定居RB服嗎
							想定居原因：這邊應該不會有外掛問題 而且裝備不能強化所以玩家應該會很團結 一起組隊打王(我很喜歡那感覺 我練的是劍豪</p>
						<a href="#">Read more</a>
					</div>
					<!--close sidebar_item-->
				</div>
				<!--close sidebar-->
				<div class="sidebar">
					<div class="sidebar_item">
						<h2>重要公告</h2>
						<h4>2016/04/01</h4>
						<p>日光大廈全新拉皮 一樓門廳全面整新 安和路信義路商圈 鑽石地段層峰豪宅聚落 24小時管理 新外觀新門廳低公設
							使用空間大 面安和路樹海 邊間採光一流 可隔四房 層峰人士換屋首選</p>
						<a href="#">Read more</a>
					</div>
					<!--close sidebar_item-->
				</div>
				<!--close sidebar-->
				<div class="sidebar">
					<div class="sidebar_item">
						<h2>特別服務</h2>
						<h4>2016/04/01</h4>
						<p>早在一月底張榮發逝世後，本刊即獨家披露張國煒不是長榮集團的唯一接班人，張國華早就帶著三個孩子回到集團內上班，主導重要決策；即使張榮發的遺囑，言明要把全部的遺產都給張國煒，但由於張榮發生前早已將財產、股票分配過一次，手上持股所剩不多。大房三兄弟相加後的持股數，遠遠超過張國煒，就連張國煒未來能否留在他最喜歡的航空事業擔任一官半職，也勢必得和張國華等大房兄弟協商同意才行。</p>
						<a href="#">Read more</a>
					</div>
					<!--close sidebar_item-->
				</div>
				<!--close sidebar-->
			</div>
			<!--close sidebar_container-->

		</div>
		<!--close site_content-->
		<div id="footer">
			<a href="http://validator.w3.org/check?uri=referer">好宅網，最專業、最豐富的新屋、預售屋展示平台
				|</a> <a href="http://validator.w3.org/check?uri=referer">好宅網有限公司
				版權所有 © 2015-2016 HappyHouse. All Rights Reserved. </a>
		</div>
		<!--close footer-->
	</div>
	<!--close main-->
</body>
</html>
