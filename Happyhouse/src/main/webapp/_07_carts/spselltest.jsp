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
            <h2>出售收藏</h2>
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
					<li>房屋年齡</li>
				</ul>
			</div> <!-- .features -->
			
			<div class="cd-products-wrapper">
				<ul class="cd-products-columns">

					<c:forEach var="row" items="${sell}">
					
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
					
					
					
					<li class="product">
						<div class="top-info">
							<div class="check"></div>　
							<form action="<c:url value="/sellhousecart.controller" />" method="post">
<!-- 							<img src="/Happyhouse/img/product.png" alt="product image"> -->
						<img src="${pageContext.servletContext.contextPath}/image1?sellhouse_id=${row.sellhouse_id}" alt="product image">
							</form>

						<h3>圖片</h3>
						</div> <!-- .top-info -->

						<ul class="cd-features-list">
							<li><a href="${path}">${row.sellhouse_name}</a></li>
							<li>${row.sellhouse_price}</li>
							<li>${row.sellhouse_patterns}</li>
							<li>${row.sellhouse_address}</li>
							<li>${row.sellhouse_describe}</li>
							<li>${row.sellhouse_size}</li>
							<li>${row.sellhouse_floor}</li>
							<li>${row.sellhouse_age}</li>
							<form action="<c:url value="/sellhousecart.controller" />" method="post">
							<li><button name="deletecartsell" value="${row.cart_id}">刪除這個收藏</button></li>
							<input type="hidden" name="deletesell" value="deletesell">
 							</form>
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