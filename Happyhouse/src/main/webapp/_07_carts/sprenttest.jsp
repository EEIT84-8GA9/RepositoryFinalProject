<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>測試中</title>
	<link rel="stylesheet" href="/Happyhouse/csscart/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" type="text/css" href="/Happyhouse/csscart/htmleaf-demo.css">
	<link rel="stylesheet" href="/Happyhouse/csscart/style.css"> <!-- Resource style -->
	<script src="/Happyhouse/js/for_cart/modernizr.js"></script> <!-- Modernizr -->
	<!--[if IE]>
		<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
</head>
<body>
	<section class="cd-intro">
		<header class="htmleaf-header">
		</header>
	</section> <!-- .cd-intro -->

	<section class="cd-products-comparison-table">
		<header>
			<h2>好宅網</h2>
            <h2>出租收藏</h2>
            <br>
            <br>
            <a href="/Happyhouse/index.jsp"><img style="border: 10px solid #FFF;" alt="image"src="/Happyhouse/images/houseindex.jpg" /></a>
			<div class="actions">
				<a href="#0" class="reset">回到預設值</a>
				<a href="#0" class="filter">只對打勾做選擇</a>
			</div>
		</header>

		<div class="cd-products-table">
			<div class="features">
				<div class="top-info">照片</div>
				<ul class="cd-features-list">
					<li>房屋名稱</li>
					<li>房屋價格</li>
					<li>房屋格局</li>
					<li>房屋地址</li>
					<li>其他內容</li>
					<li>房屋坪數</li>
					<li>房屋樓層</li>
				</ul>
			</div> <!-- .features -->
			
			<div class="cd-products-wrapper">
				<ul class="cd-products-columns">
					
					<c:forEach var="row" items="${rent}">
					
					<c:url value="/_03_renthouse/RentHouseSingleView.jsp" var="path" scope="session">
						<c:param name="user_name" value="${row.user_name}" />
						<c:param name="user_account" value="${row.user_account}" />
						<c:param name="renthouse_id" value="${row.renthouse_id}" />
						<c:param name="renthouse_name" value="${row.renthouse_name}" />
						<c:param name="renthouse_price" value="${row.renthouse_price}" />
						<c:param name="renthouse_patterns"
							value="${row.renthouse_patterns}" />
						<c:param name="renthouse_address" value="${row.renthouse_address}" />
						<c:param name="renthouse_describe" value="${row.renthouse_describe}" />
						<c:param name="renthouse_size" value="${row.renthouse_size}" />
						<c:param name="renthouse_floor" value="${row.renthouse_floor}" />
					
						<c:param name="renthouse_message" value="${row.renthouse_message}" />
						<c:param name="renthouse_date" value="${row.renthouse_date}" />
						<c:param name="renthouse_car" value="${row.renthouse_car}" />
						<c:param name="renthouse_phone" value="${row.renthouse_phone}" />
						<c:param name="renthouse_email" value="${row.renthouse_email}" />
						<c:param name="renthouse_type" value="${row.renthouse_type}" />
					</c:url>
					

					
					<li class="product">
						<div class="top-info">
							<div class="check"></div>　
							<form action="<c:url value="/gousejsp.controller" />" method="post">
<!-- 						<img src="/Happyhouse/img/product.png" alt="product image"> -->
                           	<img src="${pageContext.servletContext.contextPath}/rentimage1?renthouse_id=${row.renthouse_id}" alt="product image">                           
							</form>
							<h3>一號</h3>
						</div> <!-- .top-info -->

						<ul class="cd-features-list">
							<li><a href="${path}">${row.renthouse_name}</a></li>
							<li>${row.renthouse_price}</li>
							<li>${row.renthouse_patterns}</li>
							<li>${row.renthouse_address}</li>
							<li>${row.renthouse_describe}</li>
							<li>${row.renthouse_size}</li>
							<li>${row.renthouse_floor}</li>
						</ul>
					</li> <!-- .product -->
				
						</c:forEach>
<!-- 				<li class="product"> -->
<!-- 						<div class="top-info"> -->
<!-- 							<div class="check"></div>　 -->
<!-- 							<img src="/Happyhouse/img/product.png" alt="product image"> -->
<!-- 							<h3>一號</h3> -->
<!-- 						</div> .top-info -->

<!-- 						<ul class="cd-features-list"> -->
<!-- 							<li>超棒豪宅</li> -->
<!-- 							<li>5000萬</li> -->
<!-- 							<li>一聽二房</li> -->
<!-- 							<li>新北市三重區正義北路63號</li> -->
<!-- 							<li>管理費五萬</li> -->
<!-- 							<li>500.52平</li> -->
<!-- 							<li>4F/1F</li> -->
<!-- 							<li>20000</li> -->
<!-- 						</ul> -->
<!-- 					</li> .product -->
					
<!-- 								<li class="product"> -->
<!-- 						<div class="top-info"> -->
<!-- 							<div class="check"></div>　 -->
<!-- 							<img src="/Happyhouse/img/product.png" alt="product image"> -->
<!-- 							<h3>一號</h3> -->
<!-- 						</div> .top-info -->

<!-- 						<ul class="cd-features-list"> -->
<!-- 							<li>超棒豪宅</li> -->
<!-- 							<li>5000萬</li> -->
<!-- 							<li>一聽二房</li> -->
<!-- 							<li>新北市三重區正義北路63號</li> -->
<!-- 							<li>管理費五萬</li> -->
<!-- 							<li>500.52平</li> -->
<!-- 							<li>4F/1F</li> -->
<!-- 							<li>20000</li> -->
<!-- 						</ul> -->
<!-- 					</li> .product -->
					
					
<!-- 					<li class="product"> -->
<!-- 						<div class="top-info"> -->
<!-- 							<div class="check"></div>　 -->
<!-- 							<img src="/Happyhouse/img/product.png" alt="product image"> -->
<!-- 							<h3>一號</h3> -->
<!-- 						</div> .top-info -->

<!-- 						<ul class="cd-features-list"> -->
<!-- 							<li>超棒豪宅</li> -->
<!-- 							<li>5000萬</li> -->
<!-- 							<li>一聽二房</li> -->
<!-- 							<li>新北市三重區正義北路63號</li> -->
<!-- 							<li>管理費五萬</li> -->
<!-- 							<li>500.52平</li> -->
<!-- 							<li>4F/1F</li> -->
<!-- 							<li>20000</li> -->
<!-- 						</ul> -->
<!-- 					</li> .product -->
					
				
				
				
				
				</ul> <!-- .cd-products-columns -->
			</div> <!-- .cd-products-wrapper -->

			
			<ul class="cd-table-navigation">
				<li><a href="#0" class="prev inactive">Prev</a></li>
				<li><a href="#0" class="next">Next</a></li>
			</ul>
		</div> <!-- .cd-products-table -->
	</section> <!-- .cd-products-comparison-table -->
	
	<script src="http://libs.useso.com/js/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-2.1.1.min.js"><\/script>')</script>
	<script src="/Happyhouse/js/for_cart/main.js"></script> <!-- Resource jQuery -->
</body>
</html>