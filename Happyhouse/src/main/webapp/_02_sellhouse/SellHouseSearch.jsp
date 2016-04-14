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
						<li class="current"><a href="index.jsp">首頁</a></li>
						<li><a href="/Happyhouse/_02_sellhouse/SellHouseSearch.jsp">刊登出售</a></li>
						<li><a href="testimonials.html">刊登出租</a></li>
						<li><a href="addarticle.controller">討論區</a></li>
						<li><a href="/Happyhouse/sms.controller">站內信</a></li>
						<li><a href="/Happyhouse/_09_furniture/product.jsp">家具</a></li>
						<li><a href="/Happyhouse/_08_news/Gmindex.jsp">管理者頁面</a></li>
						<c:if test="${empty LoginOK}">
						<li><a href="_01_users/login.jsp">會員登入</a></li>
						</c:if>
						<c:if test="${not empty LoginOK}">
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
			
			<form enctype="multipart/form-data" action="<c:url value="/house/house.controller"/>"method="post">
<table>
<tr>
<td>請輸入地址</td>
<td><input type="text" name="sellhouse_address" value="${param.sellhouse_address}" ></td>
<td><input type="submit" value="搜尋" name="prodaction"/></td>
</tr>
</table>
<table>
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
		<table>
			<thead>
				<th>sellhouse_name</th>
				<th>sellhouse_price</th>
				<th>sellhouse_patterns</th>
				<th>sellhouse_address</th>
				<th>sellhouse_describe</th>
				<th>sellhouse_size</th>
				<th>sellhouse_floor</th>
				<th>sellhouse_age</th>
				<th>sellhouse_date</th>
				<th>sellhouse_car</th>
				<th>sellhouse_phone</th>
				<th>sellhouse_email</th>
			</thead>
			<tbody>
				<c:forEach var="row" items="${select}">
					<c:url value="/_02_sellhouse/SellHouseSingleView.jsp" var="path" scope="page">
						<c:param name="user_account" value="${row.user_account}" />
						<c:param name="sellhouse_id" value="${row.sellhouse_id}" />
						<c:param name="sellhouse_name" value="${row.sellhouse_name}" />
						<c:param name="sellhouse_price" value="${row.sellhouse_price}" />
						<c:param name="sellhouse_patterns"
							value="${row.sellhouse_patterns}" />
						<c:param name="sellhouse_address" value="${row.sellhouse_address}" />
						<c:param name="sellhouse_describe"
							value="${row.sellhouse_describe}" />
						<c:param name="sellhouse_size" value="${row.sellhouse_size}" />
						<c:param name="sellhouse_floor" value="${row.sellhouse_floor}" />
						<c:param name="sellhouse_age" value="${row.sellhouse_age}" />
						<c:param name="sellhouse_message" value="${row.sellhouse_message}" />
						<c:param name="sellhouse_date" value="${row.sellhouse_date}" />
						<c:param name="sellhouse_car" value="${row.sellhouse_car}" />
						<c:param name="sellhouse_phone" value="${row.sellhouse_phone}" />
						<c:param name="sellhouse_email" value="${row.sellhouse_email}" />
						
					</c:url>
					<tr>
						<td><a href="${path}">${row.sellhouse_name}</a></td>
						<td>${row.sellhouse_price}</td>
						<td>${row.sellhouse_patterns}</td>
						<td>${row.sellhouse_address}</td>
						<td>${row.sellhouse_describe}</td>
						<td>${row.sellhouse_size}</td>
						<td>${row.sellhouse_floor}</td>
						<td>${row.sellhouse_age}</td>
						<td>${row.sellhouse_date}</td>
						<td>${row.sellhouse_car}</td>
						<td>${row.sellhouse_phone}</td>
						<td>${row.sellhouse_email}</td>
						<td> <img  src="${pageContext.servletContext.contextPath}/image1?sellhouse_id=${row.sellhouse_id}" width="150px"></td>
						<td> <img  src="${pageContext.servletContext.contextPath}/image2?sellhouse_id=${row.sellhouse_id}" width="150px"></td>
						<td> <img  src="${pageContext.servletContext.contextPath}/image3?sellhouse_id=${row.sellhouse_id}" width="150px"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
			
			
			
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
