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
<!-- <script type="text/javascript"> -->
<!--  	$(window).load(function() { -->
<!--  		$('#slider').nivoSlider(); -->
<!--  	}); -->
<!-- </script> -->

	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>

	<script type="text/javascript" src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

	<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

	<script type="text/javascript" src="/Happyhouse/js/tabulator.js"></script>
	
</head>

<body>
	<div id="main">
		<div id="site_content">
			<div id="site_heading">
				<h1>好宅房屋網</h1>
				<h2>你刊登房屋的好選擇</h2>
			</div>
			<!--close site_heading-->
			<div id="header">
				<div id="menubar">
					<ul id="menu">
						<li class="current"><a href="/Happyhouse/index.jsp">首頁</a></li>
						<li><a href="ourwork.html">刊登出售</a></li>
						<li><a href="/Happyhouse/_07_carts/gousejsp.jsp">刊登出租</a></li>
						<li><a href="/Happyhouse/_08_news/test.jsp">討論區</a></li>
						<li><a href="/Happyhouse/_04_message/Gmmessage.jsp">討論區04</a></li>
						<li><a href="contact.html">會員登入</a></li>
					</ul>
				</div>
				<!--close menubar-->
			</div>
			<!--close header-->
		
		<!--close slider_wrapper-->
		
		<script type="text/javascript">
	var tabledata = [
	             	<c:forEach var="row" items="${list}" varStatus="loop">
	             	<c:if test="${row.message_type=='B'}">
 	{id:"${(loop.index)+1}",
 		user_account:"${row.user_account}",
 		message_title:"${row.message_title}",
 		message_describe:"${row.message_describe}",
 		message_type:
 			"<select id='sel2'>
 			<option value='0'>請選擇</option>
 		  	<option value='1'>國家</option>
 			<option value='2'>地區</option>
 			</select>",
//  		message_actiontype:"<select id='sel2'></select>",
 		message_reportfrom:"${row.message_reportfrom}",
//  		message_reportreason:"${row.message_reportreason}",
 		message_reportreason:"<button value='${messageVO.message_id}'>我要檢舉</button>"
 		
 	
 	},
 	</c:if>
 	</c:forEach>
	];
	
	</script>

<h3>---------------------------------------------------------------------------------------------------您的出租收藏----------------------------------------------------------------------------------------------------</h3>

<section>
<div id="currentprice_table"></div>
<script type="text/javascript">
	$("#currentprice_table").tabulator({
		height:"550px" ,
		backgroundColor:"#ccc",
		borderColor:"#333",
		headerBackgroundColor: "#333",
		headerTextColor: "#fff",
		rowBackgroundColor:"#666",
		rowAltBackgroundColor:"#444",
		rowTextColor:"#fff",
		fitColumns:true,
		columns:[
		{title:"Id", field:"id", width:40},
		{title:"會員名稱", field:"user_account", width:320},
		{title:"討論區主題", field:"message_title", width:220},
		{title:"發文內容", field:"message_describe", width:130},
		{title:"目前狀態", field:"message_type", width:130},
		{title:"檢舉他的人", field:"message_reportfrom"},
		{title:"被檢舉原因", field:"message_reportreason"},
		

		
		],
	}); 

   alert(JSON.stringify(tabledata));
	$("#currentprice_table").tabulator("setData",tabledata);
	$(window).resize(function(){
		$("#currentprice_table").tabulator("redraw");
	});
	</script>
	
</section>



	<!--close site_content-->
	<div id="footer">
		<a href="http://validator.w3.org/check?uri=referer">好宅網，最專業、最豐富的新屋、預售屋展示平台
			|</a> <a href="http://validator.w3.org/check?uri=referer">好宅網有限公司
			版權所有 © 2015-2016 HappyHouse. All Rights Reserved. </a>

	<!--close footer-->
    </div>
	<!--close main-->
	</div>
	
<br/>
</body>
</html>
