<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "
://www.w3.org/TR/html4/loose.dtd">
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
<script src="//maps.googleapis.com/maps/api/js?key=AIzaSyAFRq0_sxIvH_oCfO9n9pRVLqsfjSDET24&callback=initMap" async defer></script>
 
 	<link href="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/ui-darkness/jquery-ui.css" rel="stylesheet">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/Happyhouse/js/dialog.js"></script>
<script type="text/javascript">

var map;
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: -34.397, lng: 150.644},
    zoom: 16
  });
  var geocoder = new google.maps.Geocoder();
  geocodeAddress(geocoder, map);
}

function geocodeAddress(geocoder, resultsMap) {
	var address = "${param.renthouse_address}";
//   var address = document.getElementById('address').value;
  geocoder.geocode({'address': address}, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {
      resultsMap.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
        map: resultsMap,
        position: results[0].geometry.location
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}




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
	
	

	
	$(function(){
		// 用來顯示大圖片用
		var $showImage = $('#show-image');
	 
		// 當滑鼠移到 .abgne-block-20120106 中的某一個超連結時
		$('.abgne-block-20120106 a').mouseover(function(){
			// 把 #show-image 的 src 改成被移到的超連結的位置
			$showImage.attr('src', $(this).attr('href'));
		}).click(function(){
			// 如果超連結被點擊時, 取消連結動作
			return false;
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
    #map { 
    height:450px; 

    width:450px 
     } 

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
		.showbox {
	width: 455px;
	height: 450px;
	border: 2px solid #d0d0d0;
	vertical-align: middle;
	float:left;
	
}
.abgne-block-20120106 {
	margin-top: 10px;
	width: 680px;
	overflow: hidden;
	float:left;
}
.abgne-block-20120106 a {
	margin-right: 10px;
}
.abgne-block-20120106 a img {
	width: 140px;
	height: 92px;
	border: 2px solid #d0d0d0;
	vertical-align: middle;
}

button {
   border-top: 1px solid #f7f7f7;
   background: #ededed;
   background: -webkit-gradient(linear, left top, left bottom, from(#fafdff), to(#ededed));
   background: -webkit-linear-gradient(top, #fafdff, #ededed);
   background: -moz-linear-gradient(top, #fafdff, #ededed);
   background: -ms-linear-gradient(top, #fafdff, #ededed);
   background: -o-linear-gradient(top, #fafdff, #ededed);
   padding: 4.5px 9px;
   -webkit-border-radius: 9px;
   -moz-border-radius: 9px;
   border-radius: 9px;
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: #000000;
   font-size: 8px;
   text-decoration: none;
   vertical-align: middle;
   }
button:hover {
   border-top-color: #e1edf2;
   background: #e1edf2;
   color: #ccc;
   }
button:active {
   border-top-color: #f7f7f7;
   background: #f7f7f7;
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
			<c:if test="${not empty LoginOK}">
			<h1 align="center"><font color=blue>${LoginOK.user_name}你好</font></h1>
			</c:if>
			<!--close header-->
<div id="allpage">
<!-- param -->
<%-- <c:url value="/reportsellhouse.controller"/> --%>
<form action=""method="POST">
<c:if test="${not empty param}">
		<div id="content">
			<article>
				<h2>${param.renthouse_name}</h2>
				<div class="showbox" >
				<img id="show-image" src="${pageContext.servletContext.contextPath}/rentimage1?renthouse_id=${param.renthouse_id}" style="height:450px;width:450px"/></div>
				<p></p>
					<div class="abgne-block-20120106">
		<a href="${pageContext.servletContext.contextPath}/rentimage1?renthouse_id=${param.renthouse_id}"><img src="${pageContext.servletContext.contextPath}/rentimage1?renthouse_id=${param.renthouse_id}" title="" /></a>
		<a href="${pageContext.servletContext.contextPath}/rentimage2?renthouse_id=${param.renthouse_id}"><img src="${pageContext.servletContext.contextPath}/rentimage2?renthouse_id=${param.renthouse_id}" title="" /></a>
		<a href="${pageContext.servletContext.contextPath}/rentimage3?renthouse_id=${param.renthouse_id}"><img src="${pageContext.servletContext.contextPath}/rentimage3?renthouse_id=${param.renthouse_id}" title="" /></a>
	</div>
				
<!-- 				<figure style="padding-RIGHT:150px"> -->
<%-- 				<img id="img1"  src="${pageContext.servletContext.contextPath}/rentimage1?renthouse_id=${param.renthouse_id}" style="height:450px;width:450px"> --%>
<!-- 				</figure> -->
	<div style="padding-left:500px">
					<input type="hidden" value="${param.renthouse_id}" name="renthouse_id"/>
					<input type="hidden" value="${param.user_account}" name="user_account"/>
					<p><font color="#7B7B7B">價格:</font><font style="color:#FF8000;font-size:18px;font-weight:bolder" >${param.renthouse_price}元/月</font></p>
					<p><font color="#7B7B7B">格局:</font>${param.renthouse_patterns}</p>
					<p><font color="#7B7B7B">坪數:</font>${param.renthouse_size}坪</p>
					<p><font color="#7B7B7B">樓層:</font>${param.renthouse_floor}</p>
					<p><font color="#7B7B7B">租金:</font>${param.renthouse_price}</p>
					<p><font color="#7B7B7B">押金:</font>${param.renthouse_deposit}</p>
					<p><font color="#7B7B7B">最短租期:</font>${param.renthouse_rentdate}</p>
					<p><font color="#7B7B7B">格局:</font>${param.renthouse_patterns}</p>
					<p><font color="#7B7B7B">車位:</font>${param.renthouse_car}</p>
					<p><font color="#7B7B7B">地址:</font>${param.renthouse_address}</p>
					
					</div>
			</article>
		
		</div>
			
				<fieldset style="width:700px">
					<legend>聯絡資訊</legend>
					<div>
						<table>
						<tr>
						<td><img src="${pageContext.servletContext.contextPath}/userimg?user_account=${param.user_account}" width="70px" padding-bottom="10px"></td>
						<td>
						<h3>姓名:${param.user_name}</h3>
						<h3>電話:${param.renthouse_phone}</h3>
				<c:if test="${LoginOK.user_account!=param.user_account}">
				<button type="button" class="MessageButton" value="" >寄送站內信</button>
				</c:if>
				<c:if test="${LoginOK.user_account!=param.user_account}">
					<button type="button" class="buttonCart" value="" >加入收藏</button>
				</c:if>
						</td>
						</tr>
						</table>		
					</div>
				</fieldset>
				</form>
<%-- 				<c:if test="${LoginOK.user_account!=param.user_account}"> --%>
<!-- 				<button class="buttonReport" value="" >我要檢舉</button> -->
<%-- 				</c:if> --%>
<%-- 				<c:if test="${LoginOK.user_account!=param.user_account}"> --%>
<!-- 				<button type="button" class="MessageButton" value="" >寄送站內信</button> -->
<%-- 				</c:if> --%>
<%-- 				<c:if test="${LoginOK.user_account!=param.user_account}"> --%>
<!-- 				<button type="button" class="buttonCart" value="" >加入收藏</button> -->
<%-- 				</c:if> --%>
				<fieldset>
				<legend>其他資訊</legend>
				<p>${param.renthouse_describe}</p>
				</fieldset>
			<p><img id="img1"  src="${pageContext.servletContext.contextPath}/rentimage1?renthouse_id=${param.renthouse_id}" width="150px"></p>
				<br>
			<p><img id="img1"  src="${pageContext.servletContext.contextPath}/rentimage2?renthouse_id=${param.renthouse_id}" width="150px"></p>
				<br>
				<p><img id="img1"  src="${pageContext.servletContext.contextPath}/rentimage3?renthouse_id=${param.renthouse_id}" width="150px"></p>															
				<div id="map"></div>
				<c:if test="${LoginOK.user_account!=param.user_account}">
				<button class="buttonReport" value="" >我要檢舉</button>
				</c:if>
		</tbody>
	</c:if>		
</form>
</div>

<div class="dialog" title="檢舉原因" id="reportform">
	          <form action="/Happyhouse/reportrenthouse.controller" method="post">
	            <label>您的帳號</label><br/>
				<input type="text" id="renthouse_reportfrom" name="renthouse_reportfrom" value="${LoginOK.user_account}" readonly="readonly" style="color:black"><br/>
	            <label>文章編號</label><br/>
				<input type="text" id="renthouse_id" name="renthouse_id" value="${param.renthouse_id}" readonly="readonly" style="color:black"><br/>	
				<label>說明原因</label><br/>
				<label>限制50字以內，目前字數:</label><div id="lblWordCountNow" style="font-size:larger;">0</div>
				<textarea rows="10" cols="40" name="reportreason" id="reportreason" style="color:black"></textarea>
				<input type="submit" id="reportsubmit" value="Submit" />
			  </form>
		  </div>


<!-- 站內信 -->
<div class="dialog" title="站內信" id="MessageForMe">
	          <form action="/Happyhouse/renthouse.sms.controller" method="post" class="sms">
	            <label>收信人</label><br/>
	            <input type="text" id="user_account" name="user_account1" value="${param.user_name}" style="color:black" readonly="readonly"><br/>
				<input type="hidden" id="user_account" name="user_account1" value="${param.user_account}">
				<input type="hidden" id="user_account" name="renthouse_id2" value="${param.renthouse_id}">
	          	<input type="hidden" id="user_account" name="user_account2" value="${param.user_account}" readonly="readonly">
	          	<label>標題</label><br/>
	          	<label>25字以內，目前字數:</label><div id="2blWordCountNow" style="font-size:larger;">0</div>
				<input type="text" id="sms_title" name="sms_title" style="color:black"><br/>
				
				<label>訊息內容</label><br/>
				
				<textarea rows="8" cols="30" name="sms_describe" id="sms_describe" style="color:black"></textarea>
				
				<input type="submit" id="messagesubmit" name="type"  value="送出" />
				
			  </form>
		 </div>
 <!-- 加入收藏 -->
 
<div class="dialog" title="加入收藏" id="cartform">
	          <form action="/Happyhouse/rentcartsinsert.controller" method="post">
<%-- 	            <p>帳號:${param.user_account}</p> --%>
				<input type="hidden" id="user_account" name="user_account3" value="${LoginOK.user_account}">
				<input type="hidden" id="user_account" name="renthouse_id3" value="${param.renthouse_id}">
	          	<label>確認加入收藏嗎?</label><br/>
				<input type="submit" id="messagesubmit" name="type"  value="確認" />
			  </form>
		 </div>
<!--  -->

	<div id="menu">
			<a href="http://validator.w3.org/check?uri=referer">好宅網有限公司 版權所有 © 2015-2016 HappyHouse. All Rights Reserved. </a>
		</div>
</body>
</html>