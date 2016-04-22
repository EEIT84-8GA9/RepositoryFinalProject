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
<!-- <script type="text/javascript" src="/Happyhouse/js/jquery.min.js"></script> -->
<!-- <script type="text/javascript" src="/Happyhouse/js/jquery-2.2.1.min.js"></script> -->
<!-- <script type="text/javascript" src="/Happyhouse/js/jquery.easing.min.js"></script> -->
<!-- <script type="text/javascript" src="/Happyhouse/js/jquery.nivo.slider.pack.js"></script> -->


<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->
<!-- <script src="//code.jquery.com/jquery-1.10.2.js"></script> -->
<!-- <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> -->
 
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">  -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>  -->
<!-- <link rel="stylesheet" href="/Happyhouse/css/for_GMmessage/bootstrap-table-expandable.css"> -->
<!-- <script src="/Happyhouse/js/for_GMmessage/bootstrap-table-expandable.js"></script> -->

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
		  checkboxes = document.getElementsByName('delete_sellhouse_id');
		  for(var i=0, n=checkboxes.length;i<n;i++) {
		    checkboxes[i].checked = source.checked;
		  }
		}
	
	$(function() {
	    $( "#dialog" ).dialog({
	      autoOpen: false,
	      show: {
	        effect: "blind",
	        duration: 1000
	      },
	      hide: {
	        effect: "explode",
	        duration: 1000
	      }
	    });
	 
	    $( "#opener" ).click(function() {
	      $( "#dialog" ).dialog( "open" );
	    });
	  });
	
	
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
<!-- 			<div style="padding-left:150px"> -->
		<form  action="<c:url value="/sellhouse.GM.controller"/>"method="post" >
		<div class="container">
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
<tr>
<td><input type="hidden" name="sellhouse_reportfrom" value="${param.sellhouse_reportfrom}" ></td>
</tr>
<tr>
<td><input type="hidden" name="sellhouse_reportreason" value="${param.sellhouse_reportreason}" ></td>
</tr>
</table>
<table>                                                                 

<c:if test="${not empty GMselect}">
<!-- 	<table border=1 cellpadding=20 > -->
		<table class="table table-hover table-expandable" >
			<thead>
			<tr>
				<th>標題</th>
				<th>使用者帳號</th>
				<th>目前狀態</th>
				</tr>
			</thead>
				<c:forEach var="row" items="${GMselect}">
				<c:if test="${row.sellhouse_type=='B'}">
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
						<c:param name="sellhouse_reportfrom" value="${row.sellhouse_reportfrom}" />
						<c:param name="sellhouse_reportreason" value="${row.sellhouse_reportreason}" />			
					</c:url>
					<tbody>				
					<tr>
					<td><a href="${path}">${row.sellhouse_name}</a></td>
					<td>${row.user_account}</td>	
					<td>		
					<input  type="radio" name="type" value="A">正常
					<input  type="radio" name="type" value="C">封鎖										
					<button type="submit" value="${row.sellhouse_id}" name="id"/>修改</td>					
<%-- 					</c:if> --%>
					</tr>
					<tr>
						<td colspan="5">
							<h4>檢舉人</h4>
							<ul>
								<li>${row.sellhouse_reportfrom}</li>
							</ul>
							<h4>檢舉原因</h4>
							<ul>
								<li>${row.sellhouse_reportreason}</li>
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
<%--  		<p>檢舉人:${row.sellhouse_reportfrom}</p> --%>
<!-- 		</div>	 -->
		
</body>
</html>