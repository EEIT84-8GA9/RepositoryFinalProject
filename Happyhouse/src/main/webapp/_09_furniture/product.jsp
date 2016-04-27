<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="description" content="free website template" />
<meta name="keywords" content="enter your keywords here" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/main.css" />
<link rel="stylesheet" type="text/css" href="../jquery-ui-1.11.4.custom/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/Happyhouse/css/style.css" />
<title>家具首頁</title>
<script type="text/javascript" src="../js/jquery-2.2.1.min.js"></script>
<script type="text/javascript" src="../jquery-ui-1.11.4.custom/jquery-ui.min.js"></script>
<script type="text/javascript" src="../js/json2.js"></script>
<script type="text/javascript" src="../js/product.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery.min.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery.easing.min.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript">
var path = "${pageContext.request.contextPath}";
$(document).ready(function() {
	$('input[name="id"]').blur(function() {
		$("img:eq(0)").show();
	 	var url = path+"/pages/product.view";
		var id = $('input[name="id"]').val();
//	 	sendRequest("GET", url, id, "textText");
//	 	sendRequest("POST", url, id, "textXml");
//	 	sendRequest("POST", url, id, "textJson");
		sendRequestJSON(url, id);
	});
	$(":button").focus(function() {
 		$('input[type="text"]').val("");
	 	$("span").empty("");
	});
	
	$('input[name="make"]').attr("readonly", "readonly").datepicker({
		appendText: "請輸入YYYY-MM-DD",
		showOn: "focus",
		changeMonth: true,
		changeYear: true,
		dateFormat: "yy-mm-dd",
		defaultDate: "2010-12-01",
	});
	
});
<script type="text/javascript">
$(window).load(function() {
	$('#slider').nivoSlider();
});

</script>
</head>
<body>
<div id="main">
		<div id="site_content">
<%-- 				<c:if test="${not empty LoginOK}"> --%>
<!-- 				<h2 align="right"></h2> -->
<%-- 				</c:if> --%>
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
						<li><a href="/Happyhouse/pages/product.controller?furniture_id=&prodaction=查詢所有刊登家具">查詢所有刊登家具</a></li>	
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

<h3>Furniture Table</h3>

<form action="<c:url value="/pages/product.controller" />" method="get">
<table>
	<tr>
		<td>搜尋商品編號 : </td>
		<td><input type="text" name="furniture_id" value="" onblur="doBlur()" onfocus="clearForm()"></td>
		<td><span class="error">${error.id}</span><img src="../img/ajax-loader.gif" style="display:none"/></td>
	</tr>
<!-- 	<tr> -->
<!-- 		<td>您登入的帳號 : </td> -->
<%-- 		<td><input type="text" name="user_account" value="${LoginOK.user_account}"></td> --%>
	
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>進階商品名稱搜尋 : </td> -->
<%-- 		<td><input type="text" name="insname" value="${param.furniture_name}"></td> --%>
<%-- 		<td><span class="error">${error.price}</span></td> --%>
<!-- 	</tr> -->
	<tr>


	<tr>
<!-- 		<td> -->
<%-- 			<input type="button"  value="Insert"  onclick="location.href= --%>
<%-- 		'<c:url value="/_09_furniture/insertProduct.jsp" />'"> > --%>
<!-- 			<input type="submit" name="prodaction" value="Update"> -->
<!-- 	<td> -->
<%-- 	<input type="button" value="刊登二手家具" onclick="location.href= --%>
<%-- 		'<c:url value="/_09_furniture/insertProduct.jsp" />'"> --%>
<!-- 		</td> -->
			
		
<!-- 		<td> -->
<!-- 			<input type="submit" name="prodaction" value="Delete"> -->
			
		<td>
			<input type="submit" name="prodaction" value="查詢刊登家具">
<!-- 			<input type="submit" name="prodaction" value="查詢您的刊登家具"> -->
<!-- 			<input type="button" value="Clear" onclick="clearForm()"> -->
		</td>
	</tr>
</table>

</form>


<h3><span class="error">${error.action}</span></h3>
<c:if test="${not empty delete}">
<h3>您所選取的商品已刪除完成 : ${delete} 筆資料已刪除</h3>

<script type="text/javascript">clearForm();</script>
</c:if>

<c:if test="${not empty insert}">
<h3>提示: 新增商品成功</h3>
<table border="1">
<h3>新增商品明細</h3>
		<tr><td>家具名稱</td><td>${insert.furniture_name}</td></tr>
		<tr><td>刊登價格</td><td>${insert.furniture_price}</td></tr>
		<tr><td>新舊程度</td><td>${insert.furniture_status}</td></tr> 
		<tr><td>使用年度 </td><td>${insert.furniture_time}</td></tr>
		<tr><td>商品地址</td><td>${insert.furniture_address}</td></tr>
		<tr><td>商品介紹</td><td>${insert.furniture_message}</td></tr>
	    <tr><td>商品種類</td><td>${insert.furniture_type}</td></tr>
</table>
<script type="text/javascript">clearForm();</script>
</c:if>

<c:if test="${not empty update}">
<h3>更新商品成功 </h3>
<table border="1">
		<tr><td>家具名稱</td><td>${update.furniture_name}</td></tr>
		<tr><td>刊登價格</td><td>${update.furniture_price}</td></tr>
		<tr><td>新舊程度</td><td>${update.furniture_status}</td></tr> 
		<tr><td>使用年度 </td><td>${update.furniture_time}</td></tr>
		<tr><td>商品地址</td><td>${update.furniture_address}</td></tr>
		<tr><td>商品介紹</td><td>${update.furniture_message}</td></tr>
	    <tr><td>商品種類</td><td>${update.furniture_type}</td></tr>
</table>
<script type="text/javascript">clearForm();</script>
</c:if>
 <img src="/Happyhouse/images/pro.jpg" alt="" /> 
		
	<div id="menu">
			<a href="http://validator.w3.org/check?uri=referer">好宅網有限公司 版權所有 © 2015-2016 HappyHouse. All Rights Reserved. </a>
		</div>
</body>
</html>
