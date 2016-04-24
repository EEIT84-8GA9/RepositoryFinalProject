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
<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.11/css/jquery.dataTables.min.css" />
<script type="text/javascript" src="/Happyhouse/js/jquery-2.2.1.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#datatable').DataTable({
		"pageLength": 5,
		"bFilter": true,
		"bLengthChange": false,
//			"lengthMenu": [ 1, 3, 5, 7 ]
	});
});
	
	
	
</script>
<style type="text/css">
tr:hover td
{
background-color:#ECFFFF;
overflow:hidden;
}


</style>
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
						<li><a href="/Happyhouse/_02_sellhouse/SellHouseSearch.jsp">搜尋出售</a></li>
                        <li><a href="http://localhost:8080/Happyhouse/_02_sellhouse/InsertSellHouse.jsp">刊登出售</a></li>
                        <li><a href="#">查詢出售收藏</a></li>
						</ul>
						</li>
						<li><a href="testimonials.html">刊登出租</a>
						<ul>
						<li><a href="/Happyhouse/_03_renthouse/RentHouseSearch.jsp">搜尋出租</a></li>
                        <li><a href="/Happyhouse/_03_renthouse/InsertRentHouse.jsp">刊登出租</a></li>
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
		<form  action="<c:url value="/house/renthouse.controller"/>"method="post" >
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
<%-- <td><input type="hidden" name="user_name" value="${param.user_name}" ></td> --%>
<!-- </tr> -->
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
<%-- <td><input type="hidden" name="renthouse_price" value="${param.renthouse_price}" ></td> --%>
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
</form>
<c:if test="${not empty rent_select}">
		<table id="datatable"  width="900" >
			<thead>
			<tr>
				<th>圖片</th>
				<th>標題</th>
				<th>租金</th>			
				<th>坪數</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${rent_select}">
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
						<c:param name="renthouse_deposit" value="${row.renthouse_deposit}" />
						<c:param name="renthouse_size" value="${row.renthouse_size}" />
						<c:param name="renthouse_floor" value="${row.renthouse_floor}" />
						<c:param name="renthouse_message" value="${row.renthouse_message}" />
						<c:param name="renthouse_rentdate" value="${row.renthouse_rentdate}" />
						<c:param name="renthouse_car" value="${row.renthouse_car}" />
						<c:param name="renthouse_phone" value="${row.renthouse_phone}" />
						<c:param name="renthouse_email" value="${row.renthouse_email}" />
						<c:param name="renthouse_type" value="${row.renthouse_type}" />
					</c:url>
						<c:if test="${row.renthouse_type!='C'}">
					<tr>	
 					<td style="width:200px;border-bottom-style:solid;border-bottom-width:1px"> <img  src="${pageContext.servletContext.contextPath}/rentimage1?renthouse_id=${row.renthouse_id}" width="150px"></td> 
						<td style="border-bottom-style:solid;border-bottom-width:1px">
						<a href="${path}" style="display:block">
						<h3 style="font-style:normal;color:RED;width:300px"><font color="blue">${row.renthouse_name}</font></h3>
						<h5 style="font-style:normal">${row.renthouse_address}</h5>
						<h5 style="font-style:normal">${row.renthouse_patterns}</h5>
						<h5 style="font-style:normal">${row.renthouse_floor}</h5>
						</a>
						</td>
						<td style="padding:50px;width:200px;border-bottom-style:solid;border-bottom-width:1px" align="center" ><font color="#FF8000">${row.renthouse_price}元</font></td>
						<td style="padding:75px;width:200px;border-bottom-style:solid;border-bottom-width:1px" align="center" >${row.renthouse_size}坪</td>
					</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
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
