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
<script type="text/javascript"
	src="/Happyhouse/js/jquery.nivo.slider.pack.js"></script>
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
						<li><a href="/Happyhouse/_08_news/Gmindex.jsp">管理員首頁</a></li>
						<li><a href="/Happyhouse/_08_news/test.jsp">首頁更新</a></li>
						<li><a href="/Happyhouse/_07_carts/gousejsp.jsp">查看個人收藏(暫時)</a></li>
					</ul>
				</div>
				<!--close menubar-->
			</div>
			<!--close header-->

			<!--close slider_wrapper-->
			<form action="<c:url value="/test.controller" />" method="post">
				<table>
					<tr style="border: 1px solid black;">
						<td>文章編號(update用)</td>
						<td><input type="text" name="id" value="${param.id}">${error.id}
							${error.updateid}</td>
					</tr>

					<tr style="border: 1px solid black;">
						<td>標題</td>
						<td><input type="text" name="title" value="">${error.title}</td>
					</tr>

					<tr style="border: 1px solid black;">
						<td style="border: 1px solid black;">文章內容</td>
						<td><textarea name="content" rows="20" cols="100px"></textarea>
						<td>${error.updateerror}</td>
					</tr>
				</table>

				<table>
					<tbody>
						<tr>
							<td style="border: 1px solid black;"><input type="submit"
								name="newsupdate" value="看目前的首頁資訊"></td>
<!-- 							<td style="border: 1px solid black; width: 10px"><input -->
<!-- 								type="submit" name="newsupdate" value="Insert"></td> -->
							<td style="border: 1px solid black;"><input type="submit"
								name="newsupdate" value="更新首頁資訊"></td>
<!-- 							<td style="border: 1px solid black;"><input type="submit" -->
<!-- 								name="newsupdate" value="Delete"></td> -->
<!-- 							<td style="border: 1px solid black;"><input type="button" -->
<!-- 								value="Clear" onclick="clearForm()"></td> -->
						</tr>





						<c:if test="${not empty update}">
							<h3>修改資料成功惹</h3>
							<table border="2">
								<tr>
									<td>文章編號為</td>
									<td>${update.new_id}</td>
								</tr>

								<tr>
									<td>標題是:</td>
									<td>${update.new_title}</td>
								</tr>
								<tr>
									<td>內容為:</td>
									<td>${update.new_describe}</td>
								</tr>
								<tr>
									<td>新增時間為</td>
									<td>${update.new_date}</td>
								</tr>
							</table>
						</c:if>

						<c:if test="${not empty insert}">
							<h3>新增首頁資訊成功~~~~</h3>
							<table border="2">
								<tr>
									<td>文章編號為</td>
									<td>${insert.new_id}</td>
								</tr>

								<tr>
									<td>標題是:</td>
									<td>${insert.new_title}</td>
								</tr>
								<tr>
									<td>內容為:</td>
									<td>${insert.new_describe}</td>
								</tr>
								<tr>
									<td>新增時間為</td>
									<td>${insert.new_date}</td>
								</tr>
							</table>
						</c:if>
						<c:if test="${not empty delete}">
							<h3>刪除成功惹~~~~</h3>
						</c:if>
				</table>


			</form>
		</div>
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
