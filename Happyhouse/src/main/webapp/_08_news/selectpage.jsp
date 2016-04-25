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
<link rel="stylesheet" href="/Happyhouse/css/for_newcss/style.css">

<!-- <!-- <script type="text/javascript"> --> 
<!-- // 	$(window).load(function() { -->
<!-- // 		$('#slider').nivoSlider(); -->
<!-- // 	}); -->
<!-- <!-- </script> --> 

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
			<h1 align="center" >點擊標題即可更新首頁資訊~~</h1>
			</c:if>
			<!--close header-->
<%-- 	<form action="<c:url value="/test.controller" />" method="post"> --%>

<article class="htmleaf-container">
		<div id="container">
	      <ul class="faq">
	      <c:forEach var="row" items="${select}">
	      
	     <c:url value="/_08_news/test.jsp" var="path" scope="page">
	     <c:param name="new_id" value="${row.new_id}" />
	     <c:param name="new_title" value="${row.new_title}" />
	     <c:param name="new_describe" value="${row.new_describe}" />
<%-- 		 <c:param name="make" value="${row.make}" /> --%>
<%-- 		 <c:param name="expire" value="${row.expire}" /> --%>
		 </c:url>
	      
	      
	        <li class="q"><img src="/Happyhouse/img/arrow.png"><a href="${path}">${row.new_title}</a></li>
	        <li class="a">${row.new_describe}
	        <br>
	        <c:if test="${row.new_photo1!=null}" >
	        <img style="border: 10px solid #FFF;" alt="image" src="${pageContext.servletContext.contextPath}/newimage1?new_id=${row.new_id}" width="150px">
	        </c:if>	
	        </li>
	        
	        </c:forEach>
							
<%-- 						<c:forEach var="row" items="${select}"> --%>
<%-- 		<c:url value="/pages/product.jsp" var="path" scope="page"> --%>
<%-- 			<c:param name="id" value="${row.id}" /> --%>
<%-- 			<c:param name="name" value="${row.name}" /> --%>
<%-- 			<c:param name="price" value="${row.price}" /> --%>
<%-- 			<c:param name="make" value="${row.make}" /> --%>
<%-- 			<c:param name="expire" value="${row.expire}" /> --%>
<%-- 		</c:url> --%>
<!-- 	<tr> -->
<%-- 		<td><a href="${path}">${row.id}</a></td> --%>
<%-- 		<td>${row.name}</td> --%>
<%-- 		<td>${row.price}</td> --%>
<%-- 		<td>${row.make}</td> --%>
<%-- 		<td>${row.expire}</td> --%>
<!-- 	</tr> -->
<%-- 	</c:forEach>	 --%>
							
							
						      </ul>			
								</div>
<%-- 	<a href="${path}">${row.new_id}</a> --%>
								
						</article>
							



		
		<!--close site_content-->
		<div id="menu">
			<a href="http://validator.w3.org/check?uri=referer">好宅網有限公司 版權所有 © 2015-2016 HappyHouse. All Rights Reserved. </a>
		</div>
			<!--close footer-->
		<!--close main-->
	</div>
	
	<script src="http://libs.useso.com/js/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>
	<script>window.jQuery || document.write('<script src="/Happyhouse/js/jquery-2.1.1.min.js"><\/script>')</script>
	<script src="/Happyhouse/js/script.js"></script>
</body>
</html>
