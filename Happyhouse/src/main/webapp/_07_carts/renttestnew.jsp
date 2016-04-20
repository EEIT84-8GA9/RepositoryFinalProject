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
<!-- <script type="text/javascript"> -->
<!--  	$(window).load(function() { -->
<!--  		$('#slider').nivoSlider(); -->
<!--  	}); -->
<!-- </script> -->

	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>

	<script type="text/javascript" src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

	<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

	<script type="text/javascript" src="/Happyhouse/js/tabulator.js"></script>
	
</head>

<body>
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
		<script type="text/javascript">
	var tabledata = [
	             	<c:forEach var="row" items="${rent}" varStatus="loop">
 	{id:"${(loop.index)+1}",user_account:"${row.user_account}",renthouse_name:"${row.renthouse_name}",renthouse_price:"${row.renthouse_price}",
 	renthouse_patterns:"${row.renthouse_patterns}",renthouse_address:"${row.renthouse_address}",renthouse_describe:"${row.renthouse_describe}",
 	renthouse_size:"${row.renthouse_size}",renthouse_floor:"${row.renthouse_floor}",
 	
 	
 	},</c:forEach>
	];
	
	</script>

<h3>---------------------------------------------------------------------------------------------------您的出租收藏----------------------------------------------------------------------------------------------------</h3>

<section>
<div id="currentprice_table"></div>
<script type="text/javascript">
	$("#currentprice_table").tabulator({
		height:"550px" ,
		backgroundColor:"#ccc",
		borderColor:"#333",
		headerBackgroundColor: "#333",
		headerTextColor: "#fff",
		rowBackgroundColor:"#666",
		rowAltBackgroundColor:"#444",
		rowTextColor:"#fff",
		fitColumns:true,
		columns:[
		{title:"Id", field:"id", width:40},
		{title:"會員名稱", field:"user_account", width:320},
		{title:"房屋名稱", field:"renthouse_name", width:220},
		{title:"房屋價格", field:"renthouse_price", width:130},
		{title:"房屋格局", field:"renthouse_patterns", width:130},
		{title:"房屋地址", field:"renthouse_address"},
		{title:"其他內容", field:"renthouse_describe"},
		{title:"房屋坪數", field:"renthouse_size"},
		{title:"房屋樓層", field:"renthouse_floor"},

		
		],
	}); 
// 	<td>${row.currentprice_enddate}</td>
// 	<td>${row.currentprice_tradedate}</td>
// 	<td>${row.currentprice_housearea}</td>
// 	<td>${row.currentprice_oneprice}</td>
// 	<th>建物地址</th>
// 	<th>建物類型</th>
// 	<th>筆棟數</th>
// 	<th>樓層</th>
// 	<th>房</th>
// 	<th>廳</th>
// 	<th>衛</th>
// 	<th>建物完成年月</th>
// 	<th>交易完成年月</th>
// 	<th>總坪數</th>
// 	<th>一坪價格</th>
	
	//alert(tabledata);
//  alert(JSON.stringify(tabledata));
	$("#currentprice_table").tabulator("setData",tabledata);
	$(window).resize(function(){
		$("#currentprice_table").tabulator("redraw");
	});
	</script>
	
</section>


<!-- <table> -->
<!-- 	<thead> -->
<!-- 	<tr> -->
<!-- 		<th>收藏編號</th> -->
<!-- 		<th>收藏會員</th> -->
<!-- 		<th>房屋標題</th> -->
<!-- 		<th>房屋價格</th> -->
<!-- 		<th>房屋格局</th> -->
<!-- 		<th>房屋地址</th> -->
<!-- 		<th>其他內容</th> -->
<!-- 		<th>房屋坪數</th> -->
<!-- 		<th>房屋樓層</th> -->
		
		
<!-- 	</tr> -->
<!-- 	</thead> -->
<!-- 	<tbody> -->
<%-- 	<c:forEach var="row" items="${rent}"> --%>
<%-- 		<c:url value="/test.jsp" var="path" scope="page"> --%>
<%-- 			<c:param name="id" value="${row.new_id}" /> --%>
<%-- 			<c:param name="title" value="${row.new_title}" /> --%>
<%-- 			<c:param name="describe" value="${row.new_describe}" /> --%>
<%-- 			<c:param name="date" value="${row.new_date}" /> --%>
<%-- 		</c:url> --%>
<!-- 	<tr> -->
<%-- 		<td>${row.cart_id}</td> --%>
<%-- 		<td>${row.user_account}</td> --%>
<%-- 		<td>${row.renthouse_name}</td> --%>
<%-- 		<td>${row.renthouse_price}</td> --%>
<%-- 	    <td>${row.renthouse_patterns}</td> --%>
<%-- 	    <td>${row.renthouse_address}</td> --%>
<%-- 	    <td>${row.renthouse_describe}</td> --%>
<%-- 	    <td>${row.renthouse_size}</td> --%>
<%-- 	    <td>${row.renthouse_floor}</td> --%>
<%-- 	    <td>${row.renthouse_photo1}</td> --%>
<%-- 	    <td>${row.renthouse_photo2}</td> --%>
<%-- 	    <td>${row.renthouse_photo3}</td> --%>
<!-- 	</tr> -->
	
						
<%-- 				</c:forEach> --%>
<!-- 			</tbody> -->
<!-- 		</table> -->
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
