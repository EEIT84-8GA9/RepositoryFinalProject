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
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;"/>
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

<link rel="stylesheet" href="/Happyhouse/css/for_newcss/style.css">
<link rel="stylesheet" href="/Happyhouse/css/for_newcss/styletest.css">

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
						<li><a href="/Happyhouse/_08_news/Gmindex.jsp">管理者頁面</a></li>
						<li><a href="/Happyhouse/_02_sellhouse/SellHouseSearch.jsp">檢舉管理</a>
						<ul>
						<li><a href="#">出售區檢舉</a></li>
                        <li><a href="#">出租區檢舉</a></li>
                        <li><a href="#">留言板檢舉</a></li>
                        <li><a href="#">惡意信件檢舉</a></li>                        
                        <li><a href="#">封鎖會員</a></li>                   
						</ul>
						</li>
						<li><a href="/Happyhouse/_08_news/test.jsp">首頁更新</a></li>									
						<c:if test="${empty LoginOK}">
						<li><a href="/Happyhouse/_01_users/login.jsp">會員登入</a></li>
						</c:if>
						<c:if test="${not empty LoginOK}">
						<li><a href="/Happyhouse/_01_users/logout.jsp">登出</a></li>
						</c:if>
					</ul>
				</div>
				<!--close menubar-->
			</div>
			<c:if test="${not empty LoginOK}">
			<h1 align="center"><font color=blue>${LoginOK.user_name}你好</font></h1>
			</c:if>
			<!--close header-->
			<form  enctype="multipart/form-data" action="<c:url value="/test.controller" />" method="post">
				<table>
					<tr>
						<td><input type="hidden" name="id" value="${param.new_id}">${error.id}
							${error.updateid}</td>
					</tr>

					<tr>
						<td>標題</td>
						<td><input type="text" name="title" value="${param.new_title}">${error.title}</td>
					</tr>

					<tr>
						<td>文章內容</td>
						<td><textarea name="content" rows="20" cols="100px"></textarea>
						<td>${error.updateerror}</td>
					</tr>
					
					<tr>
				    <td><input type="file" name="sellhouse_photo1"></td>
<!-- 				    <td><input type="file" name="sellhouse_photo2"></td> -->
<!-- 				    <td><input type="file" name="sellhouse_photo3"></td> -->
					</tr>
					
				</table>

				<table>
					<tbody>
						<tr>
							<td><input type="submit"
								name="newsupdate" value="看目前的首頁資訊"></td>
<!-- 							<td style="border: 1px solid black; width: 10px"><input -->
<!-- 								type="submit" name="newsupdate" value="Insert"></td> -->
							<td><input type="submit"
								name="newsupdate" value="更新首頁資訊"></td>
<!-- 							<td style="border: 1px solid black;"><input type="submit" -->
<!-- 								name="newsupdate" value="Delete"></td> -->
<!-- 							<td style="border: 1px solid black;"><input type="button" -->
<!-- 								value="Clear" onclick="clearForm()"></td> -->
						</tr>





						<c:if test="${not empty update}">
					 <h1>更新完成,更新資料如下</h1>
					 <article class="htmleaf-container">
		             <div id="container">
	                 <ul class="faq">
						
					 
	                 <li class="q"><img src="/Happyhouse/img/arrow.png">${update.new_title}</li>
	                 <li class="a">${update.new_describe} 更新時間為:${update.new_date}</li>
	                
	        
	                  </ul>			
					  </div>
					  </article>
						
<!-- 							<h3>修改資料成功惹</h3> -->
<!-- 							<table border="2"> -->
<!-- 								<tr> -->
<!-- 									<td>文章編號為</td> -->
<%-- 									<td>${update.new_id}</td> --%>
<!-- 								</tr> -->

<!-- 								<tr> -->
<!-- 									<td>標題是:</td> -->
<!-- 									<td></td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td>內容為:</td> -->
<!-- 									<td></td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td>新增時間為</td> -->
<!-- 									<td></td> -->
<!-- 								</tr> -->
<!-- 							</table> -->
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
	<div id="menu">
			<a href="http://validator.w3.org/check?uri=referer">好宅網有限公司 版權所有 © 2015-2016 HappyHouse. All Rights Reserved. </a>
		
			<!--close footer-->
		</div>
		<!--close main-->
	</div>
		
	<script src="http://libs.useso.com/js/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>
	<script>window.jQuery || document.write('<script src="/Happyhouse/js/jquery-2.1.1.min.js"><\/script>')</script>
	<script src="/Happyhouse/js/script.js"></script>
</body>
</html>
