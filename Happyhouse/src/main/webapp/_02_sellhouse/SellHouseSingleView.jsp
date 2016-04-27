<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>搜尋頁面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="free website template" />
<meta name="keywords" content="enter your keywords here" />




<script type="text/javascript" src="/Happyhouse/js/jquery.min.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery.easing.min.js"></script>
<script type="text/javascript"	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="//maps.googleapis.com/maps/api/js?key=AIzaSyAFRq0_sxIvH_oCfO9n9pRVLqsfjSDET24&callback=initMap" async defer></script>


<link rel="stylesheet" type="text/css" href="/Happyhouse/css/style.css" />
<link rel="stylesheet" href="/Happyhouse/css/sms_menu/dialog.css"/>
<link rel="stylesheet" href="/Happyhouse/rinocss/sellnormalize.css">
<link rel="stylesheet" href="/Happyhouse/rinocss/sellstyle.css" media="screen" type="text/css" />


<!-- <script type="text/javascript" src="/Happyhouse/js/dialog.js"></script> -->
<!-- 檢舉彈跳視窗 -->
<!-- <script type="text/javascript" src="/Happyhouse/js/dialog.js"></script> -->
<!--  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->
<!--  <script src="//code.jquery.com/jquery-1.10.2.js"></script> -->
<!--  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> -->
<!--  <link rel="stylesheet" href="/resources/demos/style.css"> -->

 
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
  
// 	$('#loadingIMG3').show();
// 		 setTimeout("$('#loadingIMG3').hide();", 6000 );
  
  geocodeAddress(geocoder, map);
  
//   setMarkers(map);
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






// $("#tab2").click(function() {
// 	  $("#loadingIMG").show();
// 	   setTimeout("$('#loadingIMG').hide();", 6000 );
// });


	$(document).ready(function(){
		 $("#response").click(function(){
		        $("#form").slideToggle("slow");
		    });
		
		$("#response").click(function(){
	        $("#form").slideToggle("slow");
	    });
		

		$("#tab2").click(function() {
			  $("#loadingIMG").show();
			   setTimeout("$('#loadingIMG').hide();", 6000 );
		});

		
		$("#tab3").click(function() {
			  $("#loadingIMG").show();
			   setTimeout("$('#loadingIMG2').hide();", 6000 );
		});
		
		$("#tab4").click(function() {
			  $("#loadingIMG").show();
			   setTimeout("$('#loadingIMG3').hide();", 6000 );
		});
		
		
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
// 		  			 data.addRows([[50,10000000]]);
		  			  
//		         alert(chartobj); 
		  		        var options = {
		          title: 'Area x Price 散佈圖 ',
		          hAxis: {title: '總坪數', minValue: 0, maxValue: 15},
		          vAxis: {title: '總價', minValue: 0, maxValue: 15},
		          pointSize: 10,
		          pointShape: { type: 'star', sides: 6 },
		          legend: 'none' 
		        };
		  		  
		  		        
		  		      
		  		   
//		   		   alert(chartobj);             
// 		  		   alert("散佈圖,84%以區/類型選擇"+chartdata);
		  		 var chart = new google.visualization.ScatterChart(document.getElementById('chart_div2'));
		  	       
		  		
		  		 
		  		//$("#loadingIMG").show();
// 		  		$('#loadingIMG').show();
// 		  		 setTimeout("$('#loadingIMG').hide();", 6000 );
		      //  google.visualization.events.addListener(chart, 'ready',
		        //    function() {
 		         //     $("#loadingIMG").hide();
		//  });
		  		 
		  		
		  		
		  		 chart.draw(data, options);
			     	   
		  	 
			     	 },
			      
			    
// 			     	ajaxStop:function(){
// 			            $("#loadingIMG").hide();
// 			        },
	                
	                
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
		                     title: '',
		                     vAxis: {title: '坪價'},
		                     isStacked: true
		                   };
		             
		             var chart = new google.visualization.SteppedAreaChart(document.getElementById('chart_div'));
				    
		             
// 		         	$('#loadingIMG2').show();
// 			  		 setTimeout("$('#loadingIMG2').hide();", 6000 );
		             
		             chart.draw(data, options);
		    	   
		    	 },
				 error:function(jqXHR,textStatus,errorThrown){
				    alert(textStatus+"  XDXDXDDXDD "+errorThrown);
				    }
		   });

		  }
		  
		  
		  
		  
		  
// 		  @@!
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
	
// 		$('.map').tinyMap({
// 		    'center': '台北市信義區台北101',
// 		    'zoom'  : 14
// 		});


	

	
	
	
	
	
	
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
	
	
	
	
	
	
</script>
 

 
 <!-- 檢舉按鍵事件 -->
<title>Insert title here</title>
</head>
<style>
    #map { 
    height:450px; 
    overflow: hidden; 
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
	width: 500px;
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

<!--  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥以下偶的  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  -->


<!-- <script type="text/javascript"> -->

<!-- </script> -->
<!--  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥以上偶的  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  ❥  -->

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
				<h2>${param.sellhouse_name}</h2>
				<div class="showbox" >
				<img id="show-image" src="${pageContext.servletContext.contextPath}/image1?sellhouse_id=${param.sellhouse_id}" style="height:450px;width:500px"/></div>
				<p></p>
					<div class="abgne-block-20120106">
		<a href="${pageContext.servletContext.contextPath}/image1?sellhouse_id=${param.sellhouse_id}"><img src="${pageContext.servletContext.contextPath}/image1?sellhouse_id=${param.sellhouse_id}" title="" /></a>
		<a href="${pageContext.servletContext.contextPath}/image2?sellhouse_id=${param.sellhouse_id}"><img src="${pageContext.servletContext.contextPath}/image2?sellhouse_id=${param.sellhouse_id}" title="" /></a>
		<a href="${pageContext.servletContext.contextPath}/image3?sellhouse_id=${param.sellhouse_id}"><img src="${pageContext.servletContext.contextPath}/image3?sellhouse_id=${param.sellhouse_id}" title="" /></a>
	</div>
<%-- 				<img id="img1"  src="${pageContext.servletContext.contextPath}/image1?sellhouse_id=${param.sellhouse_id}" style="height:450px;width:450px"> --%>
<!-- 				</div>					 -->
<div style="padding-left:510px">
					<input type="hidden" value="${param.sellhouse_id}" name="sellhouse_id"/>
					<input type="hidden" value="${param.user_account}" name="user_account"/>
					<br>
					<br>
					<p><font color="#7B7B7B">價格:</font><font style="color:#FF8000;font-size:18px;font-weight:bolder" >${param.sellhouse_price}萬元</font></p>
					<p><font color="#7B7B7B">格局:</font>${param.sellhouse_patterns}</p>
					<p><font color="#7B7B7B">坪數:</font>${param.sellhouse_size}坪</p>
					<p><font color="#7B7B7B">樓層:</font>${param.sellhouse_floor}</p>
					<p><font color="#7B7B7B">屋齡:</font>${param.sellhouse_age}年</p>
					<p><font color="#7B7B7B">車位:</font>${param.sellhouse_car}</p>
					<p><font color="#7B7B7B">地址:</font>${param.sellhouse_address}</p>
					
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
						<h3><font style="color:	#000000">姓名:${param.user_name}</font></h3>
						<h3><font style="color:	#000000">電話:${param.sellhouse_phone}</font></h3>
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
<%-- 				<button class="buttonReport" value="${messageVO.message_id}" >我要檢舉</button> --%>
<%-- 				</c:if> --%>
<%-- 				<c:if test="${LoginOK.user_account!=param.user_account}"> --%>
<!-- 				<button type="button" class="MessageButton" value="" >寄送站內信</button> -->
<%-- 				</c:if> --%>
<%-- 				<c:if test="${LoginOK.user_account!=param.user_account}"> --%>
<!-- 				<button type="button" class="buttonCart" value="" >加入收藏</button> -->
<%-- 				</c:if> --%>
				<fieldset style="width:700px">
				<legend>其他資訊</legend>
				<p>${param.sellhouse_describe}</p>
				</fieldset>
			
			
<!-- 			@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

<div class="wrapper">
<div style="text-align:center;clear:both;">
<!-- <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script> -->
<!-- <script src="/follow.js" type="text/javascript"></script> -->
</div>
<section class="tabs-section">
<nav class="tabs-wrapper">

<input type="radio" name="tab" id="tab2"/><label for="tab2"><span>附近成交樣本</span></label>
<input type="radio" name="tab" id="tab3"/><label for="tab3"><span>平均房價走勢</span></label>
<input type="radio" name="tab" id="tab4"/><label for="tab4"><span>GOOGLE MAP</span></label>
<div class="tabs-content">

<section>
<h2>本建物所在區域自104/05成交物件</h2>
 <div id="loadingIMG"  style="display:none"><img src="/Happyhouse/rinocss/ajax-loader3.gif" height='10' />資料處理中，請稍後。</div>
<div id="chart_div2" style="width: 680px; height:370px;"></div>


</section>


<section>
<h2>本建物所在區域自104/05成交物件</h2>
<h3>以本物件分類之平均房價走勢圖</h3>
<div id="loadingIMG2" ><img src="/Happyhouse/rinocss/ajax-loader32.gif" height='10'/>資料處理中，請稍後。</div>
<div id="chart_div" style="width: 600px; height: 320px;"></div>






</section>
			
<section>
<h3>本物件所在位置<div id="loadingIMG3" ><img src="/Happyhouse/rinocss/ajax-loader33.gif" height='10'/>資料處理中，請稍後。</div></h3>
<div id="map"></div>	

</section>

<!-- <section> -->
<!-- <h3>... aaaaaand</h3> -->

<!-- </section> -->

</nav>
</section>
</div>
			

<!-- 			@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
			
			
			
			
			
			
			
<%-- 			<p><img id="img1"  src="${pageContext.servletContext.contextPath}/image1?sellhouse_id=${param.sellhouse_id}" width="150px"></p> --%>
<!-- 				<br> -->
<%-- 			<p><img id="img1"  src="${pageContext.servletContext.contextPath}/image2?sellhouse_id=${param.sellhouse_id}" width="150px"></p> --%>
<!-- 				<br> -->
<%-- 				<p><img id="img1"  src="${pageContext.servletContext.contextPath}/image3?sellhouse_id=${param.sellhouse_id}" width="150px"></p>															 --%>
				
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@以下 -->
				
<!-- 			<div id="chart_div2" style="width: 900px; height:500px;"></div> -->
<!-- 			<div id="chart_div" style="width: 900px; height: 500px;"></div> -->
				
				
			<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@以上 -->	
				
		<!-- 估狗 -->		
<!-- 				<div id="map"></div> -->
				<c:if test="${LoginOK.user_account!=param.user_account}">
				<button class="buttonReport" value="${messageVO.message_id}" >檢舉不實廣告</button>
				</c:if>
				
				
		</tbody>
	</c:if>
	</form>
	</div>	
	
	

	

<!--  -->











<div class="dialog" title="檢舉原因" id="reportform">
	          <form action="/Happyhouse/reportsellhouse.controller" method="post">
	            <label>您的帳號</label><br/>
				<input type="text" id="sellhouse_reportfrom" name="sellhouse_reportfrom" value="${LoginOK.user_account}" readonly="readonly" style="color:black"><br/>
	            <label>文章編號</label><br/>
				<input type="text" id="sellhouse_id" name="sellhouse_id" value="${param.sellhouse_id}" readonly="readonly" style="color:black"><br/>	
				<label>說明原因</label><br/>
				<label>限制50字以內，目前字數:</label><div id="lblWordCountNow" style="font-size:larger;">0</div>
				<textarea rows="10" cols="40" name="reportreason" id="reportreason" style="color:black"></textarea>
				<input type="submit" id="reportsubmit" value="Submit" />
			  </form>
		  </div>
		

<!-- 站內信 -->
<div class="dialog" title="站內信" id="MessageForMe">
	          <form action="/Happyhouse/sellhouse.sms.controller" method="post" class="sms">
	            <label>收信人</label><br/>
<%-- 	            <p>帳號:${param.user_account}</p> --%>
	<input type="text" id="user_account" name="user_account1" value="${param.user_name}" style="color:black" readonly="readonly">
				<input type="hidden" id="user_account" name="user_account1" value="${param.user_account}">
				<input type="hidden" id="user_account" name="sellhouse_id2" value="${param.sellhouse_id}">
	          	<input type="hidden" id="user_account" name="user_account2" value="${param.user_account}" readonly="readonly" style="color:black"><br/>	 
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
	          <form action="/Happyhouse/cartsinsert.controller" method="post">
<%-- 	            <p>帳號:${param.user_account}</p> --%>
				<input type="hidden" id="user_account" name="user_account3" value="${LoginOK.user_account}">
				<input type="hidden" id="user_account" name="sellhouse_id3" value="${param.sellhouse_id}">
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