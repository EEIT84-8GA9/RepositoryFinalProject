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
<style type="text/css">

.ML-tb1 {
    width: 100%;
    border-width: 3px;
}
.BH-table {
    background-color: #FFFFFF;
    margin-bottom: 10px;
    
}
table {
    border-collapse:collapse;
    padding: 10px;
}
.ML-tb1 td {
    font-size: 13px;
    border-width: 1px 0;
}
.BH-table td {
    border-bottom: 1px solid #e5e5e5;
    padding: 8px;
}
.ML-tb1 tr:first-child {
    /* background-color: #f6f6f6; */
}
table {
    display: table;
    border-collapse: separate;
    border-spacing: 2px;
    border-color: grey;0
}

#footer {

}

</style>
<link rel="stylesheet" type="text/css" href="/Happyhouse/css/style.css" />
<script type="text/javascript" src="/Happyhouse/js/jquery.min.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery.easing.min.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript">
	$(window).load(function() {
		$('#slider').nivoSlider();
	});
	
	function toggle(source) {
		  checkboxes = document.getElementsByName('sms_id');
		  for(var i=0, n=checkboxes.length;i<n;i++) {
		    checkboxes[i].checked = source.checked;
		  }
		}
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
			<font color="red">${error.deleteSms_idEmpty}</font>
<form action="/Happyhouse/sms.controller" method="post">

	<table class="BH-table ML-tb1">
		<tbody>
			<tr>
			
				<td width="20"><input type="checkbox" onClick="toggle(this)" /> All</td>
				<td class="ML-tb1B">寄件者</td>
				<td>標題</td>
				<td align="center" nowrap="nowrap">時間</td>
		
	<c:forEach var="smsVO" items="${list}">
			<c:url value="/_05_sms/sms_contentpage.jsp" var="path" scope="session">
					<c:param name="user_account" value="${smsVO.user_account}"/>
					<c:param name="sms_mailers" value="${smsVO.sms_mailers}" />
					<c:param name="sms_title" value="${smsVO.sms_title}" />
					<c:param name="sms_describe" value="${smsVO.sms_describe}" />
					<c:param name="sms_date" value="${smsVO.sms_date}" />
					<c:param name="sms_id" value="${smsVO.sms_id}" />
			</c:url>
		
			<tr>
				<td width="20" ><input name="sms_id" value="${smsVO.sms_id}"
					type="checkbox"></td>
				<td class="ML-tb1B"  width="10%">${smsVO.sms_mailers}</td>
				<td width="80%"><a href='${path}'>${smsVO.sms_title}</a></td>
				<td nowrap="nowrap"  width="10%">${smsVO.sms_date}</td>
			</tr>
			</c:forEach>
			
			<td><input type="submit" name="type" value="刪除信件"></td>
			<td><a href="/Happyhouse/_05_sms/sms_addnewpage.jsp"><input type="button" name="delete" value="寫信"></a></td>
		</tbody>
	</table>
	</form>
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
