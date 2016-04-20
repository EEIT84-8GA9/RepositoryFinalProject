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
			<div style="padding-left:150px">
		<form  action="<c:url value="/house/house.controller"/>"method="post" >
		<fieldset>
		<legend>房屋查詢</legend>
	<div style="padding-left:200px;width:50%;height:50%">
	<label>選擇搜尋方式</label>
	
	<select name="choise" value="標題">
	<option value="address">地址</option>
	<option value="name">標題</option>
	<option value="price">價格</option>
	</select>
	<input  style="height:50%" type="hidden" name="sellhouse_address">
	<input  style="height:50%" type="hidden" name="null">
	<input  style="height:50%" type="text" name="keyword">
	<input type="submit" value="搜尋" name="prodaction"/>
	</div>
	</fieldset>
<!-- <table> -->
<!-- <tr> -->
<!-- <td>請輸入地址</td> -->
<%-- <td ><input type="text" name="sellhouse_address" value="${param.sellhouse_address}" ></td> --%>
<!-- <td><input type="submit" value="搜尋" name="prodaction"/></td> -->
<!-- </tr> -->
<!-- </table> -->
<table>
<tr>
<td><input type="hidden" name="user_name" value="${param.user_name}" ></td>
</tr>
<tr>
<td><input type="hidden" name="sellhouse_id" value="${param.sellhouse_id}" ></td>
</tr>
<tr>
<td><input type="hidden" name="user_account" value="${param.user_account}" ></td>
</tr>
<tr>
<td><input type="hidden" name="sellhouse_name" value="${param.sellhouse_name}" ></td>
</tr>
<td><input type="hidden" name="sellhouse_price" value="${param.sellhouse_price}" ></td>
</tr>
<tr>
<td><input type="hidden" name="sellhouse_patterns" value="${param.sellhouse_patterns}" ></td>
</tr>
<tr>
<td><input type="hidden" name="sellhouse_describe" value="${param.sellhouse_describe}" ></td>
</tr>
<tr>
<td><input type="hidden" name="sellhouse_size" value="${param.sellhouse_size}" ></td>
</tr>
<tr>
<td><input type="hidden" name="sellhouse_floor" value="${param.sellhouse_floor}" ></td>
</tr>
<tr>
<td><input type="hidden" name="sellhouse_age" value="${param.sellhouse_age}" ></td>
</tr>
<tr>
<td><input type="hidden" name="sellhouse_type" value="${param.sellhouse_type}" ></td>
</tr>
<tr>
<td><input type="hidden" name="sellhouse_message" value="${param.sellhouse_message}" ></td>
</tr>
<tr>
<td><input type="hidden" name="sellhouse_date" value="${param.sellhouse_date}" ></td>
</tr>
<tr>
<td><input type="hidden" name="sellhouse_car" value="${param.sellhouse_car}" ></td>
</tr>
<tr>
<td><input type="hidden" name="sellhouse_phone" value="${param.sellhouse_phone}" ></td>
</tr>
<tr>
<td><input type="hidden" name="sellhouse_email" value="${param.sellhouse_email}" ></td>
</tr>
</table>
<table>                                                                 
</form>
<c:if test="${not empty select}">
		<table border=1 cellpadding=20 >
<!-- 			<thead> -->
<!-- 				<th>標題</th> -->
<!-- 				<th>價格</th> -->
<!-- 				<th>格局</th> -->
<!-- 				<th>地址</th> -->
<!-- 				<th>描述</th> -->
<!-- 				<th>坪數</th> -->
<!-- 				<th>樓層</th> -->
<!-- 				<th>屋齡</th> -->
<!-- 				<th>刊登日期</th> -->
<!-- 				<th>車位</th> -->

<!-- 			</thead> -->
			<tbody>
				<c:forEach var="row" items="${select}">
					<c:url value="/_02_sellhouse/SellHouseSingleView.jsp" var="path" scope="session">
						<c:param name="user_name" value="${row.user_name}" />
						<c:param name="user_account" value="${row.user_account}" />
						<c:param name="sellhouse_id" value="${row.sellhouse_id}" />
						<c:param name="sellhouse_name" value="${row.sellhouse_name}" />
						<c:param name="sellhouse_price" value="${row.sellhouse_price}" />
						<c:param name="sellhouse_patterns"
							value="${row.sellhouse_patterns}" />
						<c:param name="sellhouse_address" value="${row.sellhouse_address}" />
						<c:param name="sellhouse_describe" value="${row.sellhouse_describe}" />
						<c:param name="sellhouse_size" value="${row.sellhouse_size}" />
						<c:param name="sellhouse_floor" value="${row.sellhouse_floor}" />
						<c:param name="sellhouse_age" value="${row.sellhouse_age}" />
						<c:param name="sellhouse_message" value="${row.sellhouse_message}" />
						<c:param name="sellhouse_date" value="${row.sellhouse_date}" />
						<c:param name="sellhouse_car" value="${row.sellhouse_car}" />
						<c:param name="sellhouse_phone" value="${row.sellhouse_phone}" />
						<c:param name="sellhouse_email" value="${row.sellhouse_email}" />
						<c:param name="sellhouse_type" value="${row.sellhouse_type}" />
					</c:url>
						<c:if test="${row.sellhouse_type!='C'}">
					<tr>	
					<td colspan=2> <img src="${pageContext.servletContext.contextPath}/image1?sellhouse_id=${row.sellhouse_id}" width="75px"></td>
						<td><h3 style="color:RED";font-style: italic"><a href="${path}">${row.sellhouse_name}</a></h3>
						<h3>${row.sellhouse_address}</h5>
						<h3>${row.sellhouse_patterns}</h3>
						</td>
						<td>${row.sellhouse_price}</td>
						<td>${row.sellhouse_size}</td>
						<td>${row.sellhouse_date}</td>
<%-- 						<td> <img  src="${pageContext.servletContext.contextPath}/image1?sellhouse_id=${row.sellhouse_id}" width="150px"></td> --%>
<%-- 						<td> <img  src="${pageContext.servletContext.contextPath}/image2?sellhouse_id=${row.sellhouse_id}" width="150px"></td> --%>
<%-- 						<td> <img  src="${pageContext.servletContext.contextPath}/image3?sellhouse_id=${row.sellhouse_id}" width="150px"></td> --%>
					</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
			</div>
			
			
		<!--close site_content-->
		<div id="footer">
			<a href="http://validator.w3.org/check?uri=referer">好宅網，最專業、最豐富的新屋、預售屋展示平台 |</a>
			<a href="http://validator.w3.org/check?uri=referer">好宅網有限公司 版權所有 © 2015-2016 HappyHouse. All Rights Reserved. </a>
		</div>
		<!--close footer-->
	</div>
	<!--close main-->
</body>
</html>
