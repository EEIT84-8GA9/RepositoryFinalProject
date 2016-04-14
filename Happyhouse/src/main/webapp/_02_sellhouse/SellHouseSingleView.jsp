<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	fieldset {
			width:500px;
			margin:15px;
			border:1px solid #acd6ff;
			border-radius:10px;
		}
	#content {
			overflow:auto !important;
			overflow /**/:hidden;
			width:100%;
			padding-bottom:20px;
			}
			#allpage {
			width:768px;
			margin:auto;
			}
		.title {
		background-color:#0066CC;
		line-height:2.5em;
		color:#F0F0F0;
		padding-left:20px;
		}
			figure {
			width:300px;
			float:left;
			border:1px solid gray;
			padding:5px;
			margin:10px;
		}
		#img1{
		width:300px;
		}
</style>
<body>
<div id="allpage">
<form action="<c:url value="/house/house.controller"/>"method="post">
<c:if test="${not empty select}">
		<div id="content">
			<article class=>
				<h2>${param.sellhouse_name}</h2>
				<figure>
				<img id="img1"  src="${pageContext.servletContext.contextPath}/image1?sellhouse_id=${param.sellhouse_id}" width="150px">
				</figure>
					<p>價格:${param.sellhouse_price}</p>
					<p>格局:${param.sellhouse_patterns}</p>
					<p>坪數:${param.sellhouse_size}</p>
					<p>樓層:${param.sellhouse_floor}</p>
					<p>屋齡:${param.sellhouse_age}</p>
					<p>格局:${param.sellhouse_patterns}</p>
					<p>車位:${param.sellhouse_car}</p>
					<p>地址:${param.sellhouse_address}</p>
			</article>
		</div>
				<fieldset>
					<legend>聯絡資訊</legend>
					<div id="content">
					<img src="/Happyhouse/images/phone.jpg" width="50px" padding-bottom="10px">
					<label>${param.sellhouse_phone}</label><br>
					</div>
					<br>
					<label>e-mail:${param.sellhouse_email}</label>
					<label><a href="">站內信</a></label>
				</fieldset>
				</form>
				<fieldset>
				<legend>其他資訊</legend>
				<p>${param.sellhouse_describe}</p>
				</fieldset>
				
				<form>	
			<p><img id="img1"  src="${pageContext.servletContext.contextPath}/image1?sellhouse_id=${param.sellhouse_id}" width="150px"></p>
				<br>
			<p><img id="img1"  src="${pageContext.servletContext.contextPath}/image2?sellhouse_id=${param.sellhouse_id}" width="150px"></p>
				<br>
				<p><img id="img1"  src="${pageContext.servletContext.contextPath}/image3?sellhouse_id=${param.sellhouse_id}" width="150px"></p>
			
				</form>
		</tbody>
	</c:if>


</form>
</div>
</body>
</html>