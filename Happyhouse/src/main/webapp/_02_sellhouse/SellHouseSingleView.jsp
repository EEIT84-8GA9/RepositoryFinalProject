<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="free website template" />
<meta name="keywords" content="enter your keywords here" />

<link rel="stylesheet" type="text/css" href=
"/Happyhouse/css/style.css" />
<script type="text/javascript" src="/Happyhouse/js/jquery.min.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery.easing.min.js"></script>
<link rel="stylesheet" href="/Happyhouse/css/sms_menu/dialog.css"/>
<script type="text/javascript"	src="https://www.gstatic.com/charts/loader.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAFRq0_sxIvH_oCfO9n9pRVLqsfjSDET24&callback=initMap"
        async defer></script>


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
	$(document).ready(function(){
		 google.charts.load("current", {packages:["corechart"]});

		   google.charts.setOnLoadCallback(drawChart1);
		    google.charts.setOnLoadCallback(drawChart2);
		    
		  
// 		  var price_city1 ="文山區";
// 		  var price_bdtype1 = "店面";
		  var price_floors1 = "TEST層" ;
		  var price_city0 = "${param.sellhouse_address}";
		  var price_bdtype0 = "${param.sellhouse_patterns}";
		  var price_city1 = price_city0.substring(3,6);
		  var price_bdtype1 = price_bdtype0.substring(0,2);
		  
		  
		  
		  
		  function drawChart1() {
// 			      alert("hello");
// 			      alert("${param.sellhouse_address}");
// 			      alert("price_city1="+price_city1);
// 			      alert("price_bdtype1="+price_bdtype1);
				  $.ajax({
		           
			   	  
		 
			    	   url:"${pageContext.servletContext.contextPath}/_10_chart.controller/chart.controller",      //发送请求地址
			    	   type:"get",//请求方式
			    	   cache: false, 
					   dataType: "JSON",
			    	   data:{
			    		   
			    		   price_city : price_city1,
			    		   price_bdtype : price_bdtype1,
			    		   price_floors : price_floors1
//			     		   price_city:$("#areaend").val(),
//			     		   price_bdtype:$("#typetype").val()
			    	   }, 
			    	   //请求成功后的回调函数有两个参数
			    	   
			     	   success: function(chartdata){ 	     		 
//		 	     		 var chartobj =JSON.parse(chartdata);      //此處 很怪!!!!!!!!!!! jq 指定callback datatype了 json 所以回來已經是json 所以不必再轉 所以 var data 直接裡面塞 chardata而不是 chartobj
//		 	     		alert(chartobj); 
			     		 //成功執行servlet 並且得到servlet回傳資料 chartdata  res.getWriter().write 回傳的
			     		 //又轉成json JSON.parse(chartdata); 是因為 得到的不知為何是string
			     	     //arrayToDataTablev 是吃json格式  
		  			  var data = google.visualization.arrayToDataTable(chartdata); 
		  		
// 		  			  data.addRows([[50,10000000,"point { size: 18; shape-type: star; fill-color: #a52714; }"]]);
		  			 data.addRows([[50,10000000]]);
		  			  
//		         alert(chartobj); 
		  		        var options = {
		          title: 'Area x Price 散佈圖 ',
		          hAxis: {title: 'Area-總坪數', minValue: 0, maxValue: 15},
		          vAxis: {title: 'Price-總價', minValue: 0, maxValue: 15},
		          pointSize: 10,
		          pointShape: { type: 'star', sides: 6 },
		          legend: 'none'
		        };
//		   		   alert(chartobj);             
// 		  		   alert("散佈圖,84%以區/類型選擇"+chartdata);
		  		 var chart = new google.visualization.ScatterChart(document.getElementById('chart_div2'));
		  	        chart.draw(data, options);
			     	   
			     	 },
		  		 error:function(jqXHR,textStatus,errorThrown){
		  		    alert(textStatus+"  XDXDXDDXDD "+errorThrown);
		  		    }
		 	   });
		  }
		  
		  
		  
// 		  var price_city1 ="大安區";
// 		  var price_bdtype1 = "套房";
		  var price_city0 = "${param.sellhouse_address}";
		  var price_bdtype0 = "${param.sellhouse_patterns}";
		  var price_city1 = price_city0.substring(3,6);
		  var price_bdtype1 = price_bdtype0.substring(0,2);
		  var price_transes1 = "一樓";

		  function drawChart2() {
			  
				  $.ajax({
		           
			    	  
//			     	   async: false,   
			    	   url:"${pageContext.request.contextPath}/_10_chart.controller/chart.controller",      //发送请求地址
			    	   type:"get",//请求方式
			    	   cache: false, 
					   dataType: "JSON",
			    	   data:{//发送给数据库的数据
			    		   
			    		   price_city : price_city1,
			    		   price_bdtype : price_bdtype1,
			    		   price_transes : price_transes1
//			     		   price_city:$("#areaend").val(),
//			     		   price_bdtype:$("#typetype").val()
			    	   }, 
			    	   //请求成功后的回调函数有两个参数
			    	   
			     	   success: function(chartdata){ 
// 			     		  alert("BAR時間圖1>>>"+chartdata); 
			     	   
//		 	     		 var chartobj =JSON.parse(chartdata);      //此處 很怪!!!!!!!!!!! jq 指定callback datatype了 json 所以回來已經是json 所以不必再轉 所以 var data 直接裡面塞 chardata而不是 chartobj
//		 	     		alert(chartobj); 
			     		 //成功執行servlet 並且得到servlet回傳資料 chartdata  res.getWriter().write 回傳的
			     		 //又轉成json JSON.parse(chartdata); 是因為 得到的不知為何是string
			     	     //arrayToDataTablev 是吃json格式  
//		 	     	         alert("BAR時間圖2>>>"+chartobj); 
		  			  var data = google.visualization.arrayToDataTable(chartdata); 
		  		    //辦公大樓 住宅大樓 公寓(5樓以下)  套房  店面 倉庫 其它 透天厝 華廈(10樓以下)
		             
		             var options = {
		                     title: 'The decline of BAR時間圖',
		                     vAxis: {title: 'Accumulated Rating'},
		                     isStacked: true
		                   };
		             
		             var chart = new google.visualization.SteppedAreaChart(document.getElementById('chart_div'));
				    chart.draw(data, options);
		    	   
		    	 },
				 error:function(jqXHR,textStatus,errorThrown){
				    alert(textStatus+"  XDXDXDDXDD "+errorThrown);
				    }
		   });

		  }
		  
		  
		  
		  
		  
// 		  @@!
		})
	
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
	
// 		$('.map').tinyMap({
// 		    'center': '台北市信義區台北101',
// 		    'zoom'  : 14
// 		});
	
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
	var address = "${param.sellhouse_address}";
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
	
</script>
 
 
 <!-- 檢舉按鍵事件 -->
<title>Insert title here</title>
</head>
<style>
     #map {
        height: 350px;
        width:350px
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
</style>
<body>

<!--  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥以下偶的  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  -->


<!-- <script type="text/javascript"> -->

<!-- </script> -->
<!--  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥以上偶的  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  -->

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
				<h2>${param.sellhouse_name}</h2>
				<figure style="padding-RIGHT:150px">
				<img id="img1"  src="${pageContext.servletContext.contextPath}/image1?sellhouse_id=${param.sellhouse_id}" style="height:450px;width:450px">
				</figure>					
					<input type="hidden" value="${param.sellhouse_id}" name="sellhouse_id"/>
					<input type="hidden" value="${param.user_account}" name="user_account"/>
					<br>
					<br>
					<p>帳號:${param.user_account}</p>
					<p>姓名:${param.user_name}</p>
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
				<fieldset style="width:700px">
					<legend>聯絡資訊</legend>
					<div>
						<table>
						<tr>
						<td><img src="/Happyhouse/images/phone.jpg" width="70px" padding-bottom="10px"></td>
						<td>
						<h3>姓名:${param.user_name}</h3>
						<h3>電話:${param.sellhouse_phone}</h3>
						<h3>E-mail:${param.sellhouse_email}</h3>
						</td>
						</tr>
						</table>		
					</div>
				</fieldset>
				</form>
				<button class="buttonReport" value="${messageVO.message_id}" >我要檢舉</button>
				<button type="button" class="MessageButton" value="" >寄送站內信</button>
				<button type="button" class="buttonCart" value="" >加入收藏</button>
				<fieldset>
				<legend>其他資訊</legend>
				<p>${param.sellhouse_describe}</p>
				</fieldset>
			
			<p><img id="img1"  src="${pageContext.servletContext.contextPath}/image1?sellhouse_id=${param.sellhouse_id}" width="150px"></p>
				<br>
			<p><img id="img1"  src="${pageContext.servletContext.contextPath}/image2?sellhouse_id=${param.sellhouse_id}" width="150px"></p>
				<br>
				<p><img id="img1"  src="${pageContext.servletContext.contextPath}/image3?sellhouse_id=${param.sellhouse_id}" width="150px"></p>															
				
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@以下 -->
				
			<div id="chart_div2" style="width: 900px; height:500px;"></div>
			<div id="chart_div" style="width: 900px; height: 500px;"></div>
				
				
			<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@以上 -->	
				
		<!-- 估狗 -->		
				<div id="map"></div>
				
				
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
		

<!-- 站內信 -->
<div class="dialog" title="站內信" id="MessageForMe">
	          <form action="/Happyhouse/sellhouse.sms.controller" method="post" class="sms">
	            <label>收信人</label><br/>
<%-- 	            <p>帳號:${param.user_account}</p> --%>
				<input type="hidden" id="user_account" name="user_account1" value="${param.user_account}"><br/>
				<input type="hidden" id="user_account" name="sellhouse_id2" value="${param.sellhouse_id}"><br/>
	          	<input type="text" id="user_account" name="user_account2" value="${param.user_account}" readonly="readonly"><br/>	 
	          	<label>標題</label><br/>
	          	<label>25字以內，目前字數:</label><div id="2blWordCountNow" style="font-size:larger;">0</div>
				<input type="text" id="sms_title" name="sms_title" ><br/>
				<label>訊息內容</label><br/>
				<textarea rows="8" cols="30" name="sms_describe" id="sms_describe" ></textarea>
				<input type="submit" id="messagesubmit" name="type"  value="送出" />
			  </form>
		 </div>
<!-- 加入收藏 -->
 
<div class="dialog" title="加入收藏" id="cartform">
	          <form action="/Happyhouse/cartsinsert.controller" method="post">
<%-- 	            <p>帳號:${param.user_account}</p> --%>
				<input type="text" id="user_account" name="user_account3" value="${LoginOK.user_account}"><br/>
				<input type="text" id="user_account" name="sellhouse_id3" value="${param.sellhouse_id}"><br/>
	          
	          	<label>確認加入收藏嗎?</label><br/>
				<input type="submit" id="messagesubmit" name="type"  value="確認" />
			  </form>
		 </div>
		 </div>
</div>
	
	
	<BR>
	<BR>
	<BR>
	<BR>
	
	<div id="menu">
			<a href="http://validator.w3.org/check?uri=referer">好宅網有限公司 版權所有 © 2015-2016 HappyHouse. All Rights Reserved. </a>
		</div>




</body>
</html>