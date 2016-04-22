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


<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->
<!--   <script src="//code.jquery.com/jquery-1.10.2.js"></script> -->
<!--   <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> -->

<link rel="stylesheet" type="text/css" href="/Happyhouse/css/style.css" />	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">              
<script type="text/javascript" src="/Happyhouse/js/jquery-2.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/Happyhouse/css/for_GMmessage/bootstrap-table-expandable.css">
<script src="/Happyhouse/js/for_GMmessage/bootstrap-table-expandable.js"></script>
 

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
	
    

	
	
</script>
</head>
<body>
		<div id="main">
		<div id="site_content">
			<div id="site_heading">
				<h1>好宅房屋網</h1>
			</div>
			<!--close site_heading-->
			<div id="header">
				<div id="menubar">
					<ul id="menu">
						<li class="current"><a href="/Happyhouse/index.jsp">首頁</a></li>
						<li><a href="/Happyhouse/_08_news/Gmindex.jsp">管理者頁面</a></li>
						<li><a href="/Happyhouse/_02_sellhouse/SellHouseSearch.jsp">檢舉管理</a>
						<ul>
						<li><a href="/Happyhouse/_02_sellhouse/SellHouseGM.jsp">出售區檢舉</a></li>
                        <li><a href="/Happyhouse/_03_renthouse/RentHouseGM.jsp">出租區檢舉</a></li>
                        <li><a href="/Happyhouse/GMmessage.controller">留言板檢舉</a></li>
                        <li><a href="#">信件檢舉</a></li>                        
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
			<!--close header-->
			
	<form  action="<c:url value="/renthouse.GM.controller"/>"method="post" >
	<div class="container">
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
<%-- <td><input type="hidden" name="renthouse_rentdate" value="${param.renthouse_rentdate}" ></td> --%>
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
<!-- <tr> -->
<%-- <td><input type="hidden" name="renthouse_reportfrom" value="${param.renthouse_reportfrom}" ></td> --%>
<!-- </tr> -->
<!-- <tr> -->
<%-- <td><input type="hidden" name="renthouse_reportreason" value="${param.renthouse_reportreason}" ></td> --%>
<!-- </tr> -->
<!-- </table> -->
<table>                                                                 

<c:if test="${not empty RentGMselect}">
		<table class="table table-hover table-expandable" >
		<thead>
			<tr>
				<th>標題</th>
				<th>使用者帳號</th>
				<th>目前狀態</th>
				</tr>
			</thead>
				<c:forEach var="row" items="${RentGMselect}">
				<c:if test="${row.renthouse_type=='B'}">
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
						<c:param name="renthouse_reportfrom" value="${row.renthouse_reportfrom}" />
						<c:param name="renthouse_reportreason" value="${row.renthouse_reportreason}" />			
					</c:url>	
					<tbody>					
					<tr>
					<td><a href="${path}">${row.renthouse_name}</a></td>
					<td>${row.user_account}</td>	
					<td>		
					<input  type="radio" name="type" value="A">正常
					<input  type="radio" name="type" value="C">封鎖										
					<button type="submit" value="${row.renthouse_id}" name="id"/>修改</td>					
<%-- 					</c:if> --%>
					</tr>									
						<tr>
						<td colspan="5">
							<h4>檢舉人</h4>
							<ul>
								<li>${row.renthouse_reportfrom}</li>
							</ul>
							<h4>檢舉原因</h4>
							<ul>
								<li>${row.renthouse_reportreason}</li>
							</ul>
						</td>
						</tr>
						</c:if>
					</tbody>	
				</c:forEach>				
		</table>
	</c:if>
	</div>
		</form>		
		<!--close site_content-->
	<div id="menu">
			<a href="http://validator.w3.org/check?uri=referer">好宅網有限公司 版權所有 © 2015-2016 HappyHouse. All Rights Reserved. </a>
		</div>
		<!--close footer-->
<!-- 		<div id="dialog" title="檢舉原因"> -->
<%--  		<p>檢舉人:${row.renthouse_reportfrom}</p> --%>
<!-- 		</div>	 -->
		

</body>
</html>