<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="free website template" />
<meta name="keywords" content="enter your keywords here" />

<link rel="stylesheet" type="text/css" href="/Happyhouse/css/style.css" />
<script type="text/javascript" src="/Happyhouse/js/jquery.min.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery.easing.min.js"></script>
<link rel="stylesheet" href="/Happyhouse/css/sms_menu/dialog.css"/>
<!-- <script type="text/javascript" src="/Happyhouse/js/dialog.js"></script> -->
<!-- 檢舉彈跳視窗 -->
<!-- <script type="text/javascript" src="/Happyhouse/js/dialog.js"></script> -->
<!--  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->
<!--  <script src="//code.jquery.com/jquery-1.10.2.js"></script> -->
<!--  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> -->
<!--  <link rel="stylesheet" href="/resources/demos/style.css"> -->

 
 	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/ui-darkness/jquery-ui.css" rel="stylesheet">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/Happyhouse/js/dialog.js"></script>
<script type="text/javascript">
	$(window).load(function() {
		$('#slider').nivoSlider();
	});
	$(document).ready(function(){
	    $("#response").click(function(){
	        $("#form").slideToggle("slow");
	    });
	});
	$(document).ready(function(){
	    $("#response").click(function(){
	        $("#form").slideToggle("slow");
	    });
	});
	
	
	/*站內*/
// 	  $(function() {
// 		    $( "#dialog" ).dialog({
// 		      autoOpen: false,
// 		      show: {
// 		        effect: "blind",
// 		        duration: 1000
// 		      },
// 		      hide: {
// 		        effect: "explode",
// 		        duration: 1000
// 		      }
// 		    });
		 
// 		    $( "#opener" ).click(function() {
// 		      $( "#dialog" ).dialog( "open" );
// 		    });
// 		  });
	
</script>
 
 
 <!-- 檢舉按鍵事件 -->
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
						<c:if test="${not empty LoginOK}">
						<li><a href="/Happyhouse/_08_news/Gmindex.jsp">管理者頁面</a></li>
						<li><a href="">個人管理頁面</a>
						<ul>
						<li><a href="/Happyhouse/sms.controller">修改個人密碼</a></li>
						<li><a href="/Happyhouse/sms.controller">個人站內信箱</a></li>
						<li></li>
						</ul>
						</li>
						<li><a href="_04_message/logout.jsp">登出</a></li>
						</c:if>
					</ul>
				</div>
				<!--close menubar-->
			</div>
			<c:if test="${not empty LoginOK}">
			<h1 align="center"><font color=blue>${LoginOK.user_name}你好</font></h1>
			</c:if>
			<!--close header-->
<div id="allpage">
<form action="<c:url value="/house/house.controller"/>"method="POST">
<c:if test="${not empty param}">
		<div id="content">
			<article>
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
					<img src="/ProjectX/images/phone.jpg" width="50px" padding-bottom="10px">
					<label>${param.sellhouse_phone}</label><br>
					</div>
					<br>
					<label>e-mail:${param.sellhouse_email}</label>
					<label><a href="">站內信</a></label>
				</fieldset>
				</form>
				<button class="buttonReport" value="${messageVO.message_id}" >我要檢舉</button>
				<button type="button" class="MessageButton" value="" >寄送站內信</button>
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
				
		</tbody>
	</c:if>
</form>
</div>

<!--  -->

<div class="dialog" title="檢舉原因" id="reportform">
	          <form action="/Happyhouse/reportsellhouse.controller" method="post">
	            <label>您的帳號</label><br/>
				<input type="text" id="sellhouse_reportfrom" name="sellhouse_reportfrom" value="${LoginOK.user_account}" readonly="readonly"><br/>
	            <label>文章編號</label><br/>
				<input type="text" id="sellhouse_id" name="sellhouse_id" value="${param.sellhouse_id}" readonly="readonly"><br/>	
				<label>說明原因</label><br/>
				<label>限制50字以內，目前字數:</label><div id="lblWordCountNow" style="font-size:larger;">0</div>
				<textarea rows="10" cols="40" name="reportreason" id="reportreason" ></textarea>
				<input type="submit" id="reportsubmit" value="Submit" />
			  </form>
		  </div>
<%-- <button class="buttonReport" value="${messageVO.message_id}">我要檢舉</button> --%>

<!-- 站內信 -->
<div class="dialog" title="站內信" id="MessageForMe">
	          <form action="/Happyhouse/sms.controller" method="post" class="sms">
	            <label>收信人</label><br/>
				<input type="text" id="user_account" name="user_account" value="" ><br/>
	          	
	          	<label>標題</label><br/>
	          	<label>25字以內，目前字數:</label><div id="2blWordCountNow" style="font-size:larger;">0</div>
				<input type="text" id="sms_title" name="sms_title" ><br/>
				
				<label>訊息內容</label><br/>
				
				<textarea rows="8" cols="30" name="sms_describe" id="sms_describe" ></textarea>
				
				<input type="submit" id="messagesubmit" name="type"  value="送出" />
				
			  </form>
		 </div>
 
<!-- <button id="opener">站內信</button> -->
<!-- 站內信 -->



<!--  -->
</body>
</html>