<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>好宅網-首頁</title>
<meta name="description" content="free website template" />
<meta name="keywords" content="enter your keywords here" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/Happyhouse/css/style.css" />
<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" />
<style type="text/css">
tr:hover td {
	background: #DDDDDD;
	color: #339;
}
#title{
	padding:10px;
	font-size: 15px;
}
</style>
<script type="text/javascript" src="/Happyhouse/js/jquery-2.2.1.min.js"></script>
<script type="text/javascript" src="/cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery.easing.min.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript">
// 	$(window).load(function() {
// 		$('#slider').nivoSlider();
// 	});
	$(document).ready(function() {
		$('#datatable').DataTable({
			"pageLength": 10,
// 			"lengthMenu": [ 1, 3, 5, 7 ]
		});
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
						<li><a href="/Happyhouse/_09_furniture/product.jsp">刊登二手家具</a></li>	
						</ul>
						</li>
						<li><a href="/Happyhouse/addarticle.controller">討論區</a></li>										
						<c:if test="${empty LoginOK}">
						<li><a href="/Happyhouse/_01_users/login.jsp">會員登入</a></li>
						</c:if>
						
						<c:if test="${LoginOK.user_type=='B'||LoginOK.user_type=='C'}">
						<li><a href="/Happyhouse/_08_news/Gmindex.jsp">管理者頁面</a></li>
						</c:if>
						<c:if test="${not empty LoginOK}">
						<li><a href="">${LoginOK.user_name}個人專區</a>
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
			
			<!--close header-->
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
					<p><b><font color=red></font></b>
	<table border='1' cellpadding='5' cellspacing='0' width='900'>
		<tr bgcolor='' align='center' valign='middle' height='20'>
			<td>
				<h3>討論區</h3>
			</td>
		</tr>
	</table>
	<table id="datatable" border='1'  width='900'>
	<thead>
		<tr>
			<th width='400' height='50' align='center'>標題</th>
			<th width='50' align='center'>編號</th>
			<th width='100' align='center'>發言人</th>
			<th width='100' align='center'>發表日期</th>
		</tr>
		</thead>

		<tbody>
			<c:forEach var="messageVO" items="${list}">
				<c:url value="pagecontent.jsp" var="path" scope="session">
					<c:param name="message_id" value="${messageVO.message_id}" />
					<c:param name="user_account" value="${messageVO.user_account}" />
					<c:param name="message_title" value="${messageVO.message_title}" />
					<c:param name="message_date" value="${messageVO.message_date}" />
					<c:param name="message_describe" value="${messageVO.message_describe}" />
					<c:param name="message_type" value="${messageVO.message_type}" />
				</c:url>
				<c:if test="${messageVO.message_actiontype=='add' && messageVO.message_type!='C'}">
				<tr>
					<td width='500' height='20' id="title"  ><a href='${path}'>${messageVO.message_title}</a></td>
					<td align='center'>${messageVO.message_id}</td>
					<td align='center'>${messageVO.user_account}</td>
					<td align='center'>${messageVO.message_date}</td>
				</tr>
				</c:if>
			</c:forEach>
		</tbody>


	</table>
	
	
		<a href="addarticle.jsp"><button>發表文章</button></a></p>
					
				</div>
				<!--close content_text-->

			</div>
			<!--close content-->

			

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
