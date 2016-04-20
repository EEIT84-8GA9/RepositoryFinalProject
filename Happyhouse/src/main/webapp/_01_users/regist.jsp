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
<script type="text/javascript" src="/Happyhouse/js/jquery.min.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery.easing.min.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery.nivo.slider.pack.js"></script>

<script type="text/javascript">
	$(window).load(function() {
		$('#slider').nivoSlider();
	});
</script>
<title>Regist title here</title>
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
				<li><a href="/Happyhouse/_01_users/login.jsp">會員專區</a>	
				<ul>
				<li><a href="/Happyhouse/_01_users/login.jsp">會員登入</a></li>	
				</ul>	
			    <li><a href="/Happyhouse/_09_furniture/product.jsp">二手家具</a>	
						<ul>
						<li><a href="/Happyhouse/_09_furniture/product.jsp">搜尋家具</a></li>	
						<li><a href="/Happyhouse/_09_furniture/insertProduct.jsp">刊登二手家具</a></li>	
						</ul>
						</li>
						<li><a href="/Happyhouse/addarticle.controller">討論區</a></li>										
					</ul>
				</div>
				<!--close menubar-->
			</div>
			

<form action="/Happyhouse/secure/regist.controller" method="get">
<table>
	<tr>
		<td>帳號 : </td>
		<td><input type="text" name="user_account" value="${param.user_account}" onblur="doBlur()" onfocus="clearForm()"></td>
		<td><span class="error">${error.user_account}</span><img src="../img/ajax-loader.gif" style="display:none"/></td>
	</tr>
	<tr>
		<td>密碼 : </td>
		<td><input type="text" name="user_password" value="${param.user_password}"></td>
		<td><span class="error">${error.user_password}</span><img src="../img/ajax-loader.gif" style="display:none"/></td>
		<td></td>
	</tr>

	<tr>
		<td>名子 : </td>
		<td><input type="text" name="user_name" value="${param.user_name}"></td>
		<td><span class="error">${error.user_name} </span></td>
	</tr>
	<tr>
		<td>地址 : </td>
		<td><input type="text" name="user_address" value="${param.user_address}"></td>
		<td><span class="error">${error.user_address}</span></td>
	</tr>
	<tr>
		<td>聯絡電話 : </td>
		<td><input type="text" name="user_phone" value="${param.user_phone}"></td>
		<td><span class="error">${error.user_phone}</span></td>
	</tr>
		<tr>
		<td>電子信箱 : </td>
		<td><input type="text" name="user_email" value="${param.user_email}"></td>
		<td><span class="error">${error.user_email}</span></td>
	</tr>
		<tr>
		<td>性別 : </td>
		<td><input type="text" name="user_gender" value="${param.user_gender}"></td>
		<td><span class="error">${error.user_gender}</span></td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="註冊">
			<input type="button" value="取消" onclick="location.href=
		'<c:url value="/_01_users/login.jsp" />'"></td>
		
	
	</tr>
</table>

</form>


<h3><span class="error">${error.action}</span></h3>
<img src="/Happyhouse/images/pro3.jpg" alt="" /> 
<div id="footer">
			<a href="http://validator.w3.org/check?uri=referer">好宅網，最專業、最豐富的新屋、預售屋展示平台 |</a>
			<a href="http://validator.w3.org/check?uri=referer">好宅網有限公司 版權所有 © 2015-2016 HappyHouse. All Rights Reserved. </a>
		</div>
</body>
</html>