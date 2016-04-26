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

<!-- <link rel="stylesheet" type="text/css" href="/Happyhouse/css/style.css" /> -->
<!-- <script type="text/javascript" src="/Happyhouse/js/jquery.min.js"></script> -->
<!-- <script type="text/javascript" src="/Happyhouse/js/jquery.easing.min.js"></script> -->
<!-- <script type="text/javascript" src="/Happyhouse/js/jquery.nivo.slider.pack.js"></script> -->

<link rel="stylesheet" type="text/css" href="/Happyhouse/css/style.css" />
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" />
<script type="text/javascript" src="/Happyhouse/js/jquery-2.2.1.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>


<script type="text/javascript">
	$(window).load(function() {
		$('#slider').nivoSlider();
	});
	function toggle(source) {
		  checkboxes = document.getElementsByName('delete_renthouse_id');
		  for(var i=0, n=checkboxes.length;i<n;i++) {
		    checkboxes[i].checked = source.checked;
		  }
		}
	
	$(document).ready(function() {
		$('#datatable').DataTable({
			"pageLength": 5,
			"bFilter": true,
			"bLengthChange": false,
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
						<li><a href="/Happyhouse/_02_renthouse/rentHouseSearch.jsp">出售專區</a>
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
			
			<div style="padding-left:1px">
		<form  action="<c:url value="/house/renthouseuser.controller"/>"method="post" >
<!-- 		<fieldset> -->
<!-- 		<legend>房屋查詢</legend> -->
<!-- 	<div style="padding-left:200px;width:50%;height:50%"> -->
<!-- 	<label>選擇搜尋方式</label> -->
	
<!-- 	<select name="choise" value="標題"> -->
<!-- 	<option value="address">地址</option> -->
<!-- 	<option value="name">標題</option> -->
<!-- 	<option value="price">價格</option> -->
<!-- 	</select> -->
<!-- 	<input  style="height:50%" type="hidden" name="renthouse_address"> -->
<!-- 	<input  style="height:50%" type="hidden" name="null"> -->
<!-- 	<input  style="height:50%" type="text" name="keyword"> -->
<!-- 	<input type="submit" value="搜尋" name="prodaction"/> -->
<!-- 	</div> -->
<!-- 	</fieldset> -->
<!-- <table> -->
<!-- <tr> -->
<!-- <td>請輸入地址</td> -->
<%-- <td ><input type="text" name="renthouse_address" value="${param.renthouse_address}" ></td> --%>
<!-- <td><input type="submit" value="搜尋" name="prodaction"/></td> -->
<!-- </tr> -->
<!-- </table> -->
<!-- <table> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="renthouse_id" value="${param.renthouse_id}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="user_account" value="${param.user_account}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="renthouse_name" value="${param.renthouse_name}" ></td> --%>
<!-- </tr> -->
<%-- <td><input type="hidden" name="renthouse_price" value="${param.renthouse_price}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="renthouse_patterns" value="${param.renthouse_patterns}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="renthouse_describe" value="${param.renthouse_describe}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="renthouse_size" value="${param.renthouse_size}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="renthouse_floor" value="${param.renthouse_floor}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="renthouse_deposit" value="${param.renthouse_deposit}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="renthouse_type" value="${param.renthouse_type}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="renthouse_message" value="${param.renthouse_message}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="renthouse_date" value="${param.renthouse_date}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="renthouse_car" value="${param.renthouse_car}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="renthouse_phone" value="${param.renthouse_phone}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="renthouse_email" value="${param.renthouse_email}" ></td> --%>
<!-- </tr> -->
<!-- </table> -->
<!-- <table>                                                                  -->

<c:if test="${not empty select1}">
		<table id="datatable"  width="900" >
			<thead>
			<tr>
				<th>勾選</th>
				<th>圖片</th>
				<th>標題</th>
				<th>價格</th>
				<th>刊登日期</th>
				<th>修改</th>
			</tr>
			</thead>
			<tbody>
			<input type="checkbox" onClick="toggle(this)" />&nbsp全選
				<c:forEach var="row" items="${select1}">
					<c:url value="/_03_renthouse/RentHouseSingleView.jsp" var="path" scope="page">
						<c:param name="user_account" value="${row.user_account}" />
						<c:param name="renthouse_id" value="${row.renthouse_id}" />
						<c:param name="renthouse_name" value="${row.renthouse_name}" />
						<c:param name="renthouse_price" value="${row.renthouse_price}" />
						<c:param name="renthouse_patterns" value="${row.renthouse_patterns}" />
						<c:param name="renthouse_address" value="${row.renthouse_address}" />
						<c:param name="renthouse_deposit" value="${row.renthouse_deposit}" />
						<c:param name="renthouse_describe" value="${row.renthouse_describe}" />
						<c:param name="renthouse_size" value="${row.renthouse_size}" />
						<c:param name="renthouse_floor" value="${row.renthouse_floor}" />
						<c:param name="renthouse_rentdate" value="${row.renthouse_rentdate}" />
						<c:param name="renthouse_message" value="${row.renthouse_message}" />
						<c:param name="renthouse_date" value="${row.renthouse_date}" />
						<c:param name="renthouse_car" value="${row.renthouse_car}" />
						<c:param name="renthouse_phone" value="${row.renthouse_phone}" />
						<c:param name="renthouse_email" value="${row.renthouse_email}" />			
					</c:url>
				
					<!-- 修改用 -->
					<c:url value="/_03_renthouse/UpdateRentHouse.jsp" var="path2" scope="page">
						<c:param name="user_account" value="${row.user_account}" />
						<c:param name="renthouse_id" value="${row.renthouse_id}" />
						<c:param name="renthouse_name" value="${row.renthouse_name}" />
						<c:param name="renthouse_price" value="${row.renthouse_price}" />
						<c:param name="renthouse_deposit" value="${row.renthouse_deposit}" />
						<c:param name="renthouse_patterns"
							value="${row.renthouse_patterns}" />
						<c:param name="renthouse_address" value="${row.renthouse_address}" />
						<c:param name="renthouse_describe"
							value="${row.renthouse_describe}" />
						<c:param name="renthouse_size" value="${row.renthouse_size}" />
						<c:param name="renthouse_floor" value="${row.renthouse_floor}" />
						<c:param name="renthouse_rentdate" value="${row.renthouse_rentdate}" />
						<c:param name="renthouse_message" value="${row.renthouse_message}" />
						<c:param name="renthouse_date" value="${row.renthouse_date}" />
						<c:param name="renthouse_car" value="${row.renthouse_car}" />
						<c:param name="renthouse_phone" value="${row.renthouse_phone}" />
						<c:param name="renthouse_email" value="${row.renthouse_email}" />			
					</c:url>
					<!-- 修改用 -->
					
					<tr>
					<td align="center"><input type="checkbox" value="${row.renthouse_id}" name="delete_renthouse_id"/></td>	
					<td style="width:100px;border-bottom-style:solid;border-bottom-width:1px"> <img  src="${pageContext.servletContext.contextPath}/rentimage1?renthouse_id=${row.renthouse_id}" width="75px"></td>
						<td style="border-bottom-style:solid;border-bottom-width:1px"><h3 style="font-style:normal;color:RED;width:300px"><a href="${path}"><font color="blue">${row.renthouse_name}</font></a></h3>
						</td>
						<td style="padding:20px;width:100px;border-bottom-style:solid;border-bottom-width:1px" align="center" >${row.renthouse_price}</td>
						<td style="padding:20px;width:100px;border-bottom-style:solid;border-bottom-width:1px" align="center" >${row.renthouse_date}</td>
						<td style="padding:20px;width:50px;border-bottom-style:solid;border-bottom-width:1px" align="center"><a href="${path2}">修改</a></td>
					
<%-- 						<td> <img  src="${pageContext.servletContext.contextPath}/image1?renthouse_id=${row.renthouse_id}" width="150px"></td> --%>
<%-- 						<td> <img  src="${pageContext.servletContext.contextPath}/image2?renthouse_id=${row.renthouse_id}" width="150px"></td> --%>
<%-- 						<td> <img  src="${pageContext.servletContext.contextPath}/image3?renthouse_id=${row.renthouse_id}" width="150px"></td> --%>
					</tr>
					
				</c:forEach>
			
			</tbody>
		</table>
	</c:if>
	<input type="submit" name="delete" value="刪除" >

			</div>
		</form>		
			
		<!--close site_content-->
	<div id="menu">
			<a href="http://validator.w3.org/check?uri=referer">好宅網有限公司 版權所有 © 2015-2016 HappyHouse. All Rights Reserved. </a>
		</div>
		<!--close footer-->
	</div>
	<!--close main-->
	
</body>
</html>