<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>賣屋管理頁面</title>
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
		  checkboxes = document.getElementsByName('delete_sellhouse_id');
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
				<h2>歡迎  ${LoginOK.user_name}</h2>
			</div>
			<!--close site_heading-->
			<div id="header">			
				<div id="menubar">
					<ul id="menu">
					
						<li class="current"><a href="/Happyhouse/index.jsp">首頁</a></li>
						<li><a href="/Happyhouse/_02_sellhouse/SellHouseSearch.jsp">出售專區</a>
						<ul>
						<li><a href="/Happyhouse/_02_sellhouse/SellHouseSearch.jsp">搜尋出售</a></li>
                        <li><a href="/Happyhouse/_02_sellhouse/InsertSellHouse.jsp">刊登出售</a></li>
						</ul>
						</li>
						<li><a href="/Happyhouse/_03_renthouse/RentHouseSearch.jsp">出租專區</a>
						<ul>
						<li><a href="/Happyhouse/_03_renthouse/RentHouseSearch.jsp">搜尋出租</a></li>
                        <li><a href="/Happyhouse/_03_renthouse/InsertRentHouse.jsp">刊登出租</a></li>
						</ul>
						</li>
						<li><a href="">時價查詢</a>
						<ul>
						<li><a href="/Happyhouse/_06_currentprice/cpindex.jsp">售屋時價查詢</a></li>
                        <li><a href="/Happyhouse/_06_currentprice/cpindex.jsp">出租時價查句</a></li>
                        </ul>
						</li>
						<li><a href="/Happyhouse/_09_furniture/product.jsp">二手家具</a>
						<ul>
					    <li><a href="/Happyhouse/_09_furniture/product.jsp">搜尋家具</a></li>	
						<li><a href="/Happyhouse/_09_furniture/insertProduct.jsp">刊登二手家具</a></li>	
						<li><a href="/Happyhouse/pages/product.controller?furniture_id=&prodaction=查詢刊登家具">查詢所有刊登家具</a></li>	
						</ul>	
						<c:if test="${not empty LoginOK}">	
						<ul>
					    <li><a href="/Happyhouse/_09_furniture/product.jsp">搜尋家具</a></li>	
						<li><a href="/Happyhouse/_09_furniture/insertProduct.jsp">刊登二手家具</a></li>	
						<li><a href="/Happyhouse/pages/product.controller?furniture_id=&prodaction=查詢刊登家具">查詢所有刊登家具</a></li>	
						<li><a href="/Happyhouse/pages/product.controller?user_account=${LoginOK.user_account}&prodaction=查詢您的刊登家具">查詢您刊登的家具</a></li>
						
						</ul>
					    </c:if>
						</li>
						<li><a href="/Happyhouse/addarticle.controller">討論區</a></li>										
						<c:if test="${empty LoginOK}">
						<li><a href="/Happyhouse/_01_users/login.jsp">會員登入</a></li>
						</c:if>
						<c:if test="${not empty LoginOK}">
						<li><a href="">${LoginOK.user_name}專區</a>
						<ul>
<!-- 					<li><a href="/Happyhouse/sms.controller">修改個人密碼</a></li> -->
						<li><a href="/Happyhouse/_01_users/chasgePw.jsp">修改個人密碼</a></li>
						<li><a href="/Happyhouse/sms.controller">個人站內信箱</a></li>
						<li><a href="/Happyhouse/sellhousecart.controller">個人出售收藏</a></li>
						<li><a href="/Happyhouse/renthousecart.controller">個人出售收藏</a></li>
						<li><a href="/Happyhouse/_02_sellhouse/SellHouseUser.jsp">賣屋管理</a></li>
						<li><a href="/Happyhouse/_03_renthouse/RentHouseUser.jsp">租屋管理</a></li>
						<c:if test="${LoginOK.user_type=='B'||LoginOK.user_type=='C'}">
						<li><a href="/Happyhouse/_08_news/Gmindex.jsp">管理者頁面</a></li>
						</c:if>
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
			<div style="padding-left:1px">
		<form  action="<c:url value="/house/sellhouseuser.controller"/>"method="post" >
<!-- 		<fieldset> -->
<!-- 		<legend>房屋查詢</legend> -->
<!-- 	<div style="padding-left:200px;width:50%;height:50%"> -->
<!-- 	<label>選擇搜尋方式</label> -->
	
<!-- 	<select name="choise" value="標題"> -->
<!-- 	<option value="address">地址</option> -->
<!-- 	<option value="name">標題</option> -->
<!-- 	<option value="price">價格</option> -->
<!-- 	</select> -->
<!-- 	<input  style="height:50%" type="hidden" name="sellhouse_address"> -->
<!-- 	<input  style="height:50%" type="hidden" name="null"> -->
<!-- 	<input  style="height:50%" type="text" name="keyword"> -->
<!-- 	<input type="submit" value="搜尋" name="prodaction"/> -->
<!-- 	</div> -->
<!-- 	</fieldset> -->
<!-- <table> -->
<!-- <tr> -->
<!-- <td>請輸入地址</td> -->
<%-- <td ><input type="text" name="sellhouse_address" value="${param.sellhouse_address}" ></td> --%>
<!-- <td><input type="submit" value="搜尋" name="prodaction"/></td> -->
<!-- </tr> -->
<!-- </table> -->
<!-- <table> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="sellhouse_id" value="${param.sellhouse_id}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="user_account" value="${param.user_account}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="sellhouse_name" value="${param.sellhouse_name}" ></td> --%>
<!-- </tr> -->
<%-- <td><input type="hidden" name="sellhouse_price" value="${param.sellhouse_price}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="sellhouse_patterns" value="${param.sellhouse_patterns}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="sellhouse_describe" value="${param.sellhouse_describe}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="sellhouse_size" value="${param.sellhouse_size}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="sellhouse_floor" value="${param.sellhouse_floor}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="sellhouse_age" value="${param.sellhouse_age}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="sellhouse_type" value="${param.sellhouse_type}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="sellhouse_message" value="${param.sellhouse_message}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="sellhouse_date" value="${param.sellhouse_date}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="sellhouse_car" value="${param.sellhouse_car}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="sellhouse_phone" value="${param.sellhouse_phone}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="sellhouse_email" value="${param.sellhouse_email}" ></td> --%>
<!-- </tr> -->
<!-- </table> -->
<!-- <table>                                                                  -->

<c:if test="${not empty select}">
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
				
					<!-- 修改用 -->
					<c:url value="/_02_sellhouse/UpdateSellHouse.jsp" var="path2" scope="page">
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
					<!-- 修改用 -->
					<tr>
					<td align="center"><input type="checkbox" value="${row.sellhouse_id}" name="delete_sellhouse_id"/></td>	
					<td style="width:100px;border-bottom-style:solid;border-bottom-width:1px"> <img  src="${pageContext.servletContext.contextPath}/image1?sellhouse_id=${row.sellhouse_id}" width="75px"></td>
						<td style="border-bottom-style:solid;border-bottom-width:1px"><h3 style="font-style:normal;color:RED;width:300px"><a href="${path}"><font color="blue">${row.sellhouse_name}</font></a></h3>
						</td>
						<td style="padding:20px;width:100px;border-bottom-style:solid;border-bottom-width:1px" align="center" >${row.sellhouse_price}</td>
						<td style="padding:20px;width:100px;border-bottom-style:solid;border-bottom-width:1px" align="center" >${row.sellhouse_date}</td>
						<td style="padding:20px;width:50px;border-bottom-style:solid;border-bottom-width:1px" align="center"><a href="${path2}">修改</a></td>
					
<%-- 						<td> <img  src="${pageContext.servletContext.contextPath}/image1?sellhouse_id=${row.sellhouse_id}" width="150px"></td> --%>
<%-- 						<td> <img  src="${pageContext.servletContext.contextPath}/image2?sellhouse_id=${row.sellhouse_id}" width="150px"></td> --%>
<%-- 						<td> <img  src="${pageContext.servletContext.contextPath}/image3?sellhouse_id=${row.sellhouse_id}" width="150px"></td> --%>
					</tr>
					
				</c:forEach>
			
			</tbody>
		</table>
	</c:if>
	<c:if test="${not empty select}">
	<input type="submit" name="delete" value="刪除" >
	</c:if>
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
