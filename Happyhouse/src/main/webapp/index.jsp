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
<script type="text/javascript" src="/Happyhouse/js/AddressSelectList.js"></script>
<script type="text/javascript"	src="https://www.gstatic.com/charts/loader.js"></script>



<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>


<script type="text/javascript">







<script type="text/javascript">
	$(window).load(function() {
		$('#slider').nivoSlider();
	});
</script>  
</head>
<body>
<!-- ☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻ 以下偶的 ☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻-->
<script>
$(document).ready(function(){
//   此為開啟首面直接 READY去叫預設值 畫圖~
//   ajax就是去call function得到回傳資料, 並且局部更新網頁畫面,不用重新載入整個頁面
//   以servlet原本的會重新導向的那個內容就不適用 ( 他不算資料)	  應該是要回傳你要畫圖的資料
//   google.charts.load('current', {'packages':['bar']});    兩張不同圖的解法?   LINE加入~! 下一張 頭 一樣! 但有些要加 2
//   function test(Choose1){ 
 google.charts.load('current', {packages: ['bar','corechart', 'line']});
 //google.charts.load('current', {packages: ['bar','corechart', 'line']});  只會LOAD 一次!!!!!!!!!!!!
  google.charts.setOnLoadCallback(drawChart1);
  google.charts.setOnLoadCallback(drawBackgroundColor1);
  //與二區圖  方法作為區別所以 句末加一 喔喔喔喔喔
 
  var price_city1 ="大安區";

  function drawChart1() {
	  
		  $.ajax({
           
	    	  
//	     	   async: false,
	    	   url:"${pageContext.request.contextPath}/_10_chart.controller/chart.controller",//发送请求地址
	    	   type:"get",//请求方式
	    	   cache: false, 
			   dataType: "JSON",
	    	   data:{//发送给数据库的数据
	    		   
	    		   price_city : price_city1
// 	    		   price_bdtype : price_bdtype1
//	     		   price_city:$("#areaend").val(),
//	     		   price_bdtype:$("#typetype").val()
	    	   } 
	    	   , 
	    	   //请求成功后的回调函数有两个参数
	     	   success: function(chartdata){ 
// 	     		  alert("BAR圖"+chartdata);
	     		 var chartobj =JSON.parse(chartdata);
	     		 //成功執行servlet 並且得到servlet回傳資料 chartdata  res.getWriter().write 回傳的
	     		 //又轉成json JSON.parse(chartdata); 是因為 得到的不知為何是string
	     	     //arrayToDataTablev 是吃json格式  
  			  var data = google.visualization.arrayToDataTable(chartobj); 
  		    //辦公大樓 住宅大樓 公寓(5樓以下)  套房  店面 倉庫 其它 透天厝 華廈(10樓以下)

  		    var options = {
  		      chart: {
  		        title: '房屋類型  Performance',
  		        subtitle: '該區每種類型的平均一均價格',
  		        
  		      },
  		    backgroundColor: '#f1f8e9'
  		    };
  		    var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
  		    chart.draw(data, options);
	     	   
	     	 },
  		 error:function(jqXHR,textStatus,errorThrown){
  		    alert(textStatus+"  XDXDXDDXDD "+errorThrown);
  		    }
 	   });
  }
      //上為function1 ending處  預設 BAR圖~
        var price_city2 ="大安區";
        var price_bdtype2 ="套房";
	      function drawBackgroundColor1() {
	          $.ajax({
	               
//	    	     	   async: false,
	    	    	   url:"${pageContext.request.contextPath}/_10_chart.controller/chart.controller",//发送请求地址
	    	    	   type:"get",//请求方式
	    	    	   cache: false, 
	    			   dataType: "JSON",
	    	    	   data:{//发送给数据库的数据
	    	    		   
	    	    		   price_city : price_city2,
	    	    		   price_bdtype : price_bdtype2
//	    	     		   price_city:$("#areaend").val(),
//	    	     		   price_bdtype:$("#typetype").val()
	    	    	   } 
	    	    	   , 
	    	    	   //请求成功后的回调函数有两个参数
	    	     	   success: function(chartdata){ 
// 	    	     		   alert("折線圖"+chartdata);
	    	     		 var chartobj2 =JSON.parse(chartdata);
	    	     		 //成功執行servlet 並且得到servlet回傳資料 chartdata  res.getWriter().write 回傳的
	    	     		 //又轉成json JSON.parse(chartdata); 是因為 得到的不知為何是string
	    	     		 
	    	     		 
	    	     	var data =  new google.visualization.DataTable();	 
	    	     		 
	    	     		 
	    	     	     //arrayToDataTablev 是吃json格式  
// 	      			  var data2 = google.visualization.arrayToDataTable(chartobj2); 
	      		    //辦公大樓 住宅大樓 公寓(5樓以下)  套房  店面 倉庫 其它 透天厝 華廈(10樓以下)
                          data.addColumn('string','X');
                          data.addColumn('number', '平均價格');
                          data.addRows(chartobj2);
                          
	      		      var options = {
        		  
//         	         title: '平均每坪價格X 時間變動圖',
//                      subtitle: 'xxx',
                     hAxis: {
                     title: 'YearMonth(民國月份)'
                     },
                     vAxis: {
                     title: '坪價'
                     },
                      backgroundColor: '#f1f8e9'
                     };
	      		     var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
	      		    chart.draw(data, options);
	    	     	   
	    	     	 },
	      		 error:function(jqXHR,textStatus,errorThrown){
	      		    alert(textStatus+"  XDXDXDDXDD "+errorThrown);
	      		    }
	     	   });
	          //上為function2 ending處 預設 折線圖
	    		  
	    		  
	    	  }
  
//  此區為AJAX選單 變動圖   下圖為   BAR圖  後為 單一區   單一類型    時間 坪價折線圖~
<%--    24行,大安區是與 chartFilter.java 預設一樣寫死   下面的 "${param.price_city}" 則是自動取select中的區域填入 --%>
 
 
    $("#areaend ,#typetype").change(function(){
//       alert("The text has been changed.");
      var name=$("#areaend").text();
      var price_city = $("#areaend").val();
      
      var name2=$("#typetype").text();
      var price_bdtype = $("#typetype").val(); 
    
     		  google.charts.setOnLoadCallback(drawChart);
     		  //下圖為
     		  //24行,大安區是與 chartFilter.java 預設一樣寫死   下面的 "${param.price_city}" 則是自動取select中的區域填入
     		  function drawChart() {
     			  $.ajax({
     				  
     				  
//     		     	   async: false,
     		    	   url:"${pageContext.request.contextPath}/_10_chart.controller/chart.controller",//发送请求地址
     		    	   type:"get",//请求方式
     		    	   cache: false, 
     				   dataType: "JSON",
     		    	   data:{//发送给数据库的数据
     		    		   
     		    		   price_city : price_city 
//     		     		   price_city:$("#areaend").val(),
//     		     		   price_bdtype:$("#typetype").val()
     		    	   } 
     		    	   ,
     		    	   //请求成功后的回调函数有两个参数
     		     	   success: function(chartdata){ 
     		     		  
//      		     		 alert("改變後BAR圖"+chartdata);
     		     		 var chartobj =JSON.parse(chartdata);
     		     	   
     	     			  var data = google.visualization.arrayToDataTable(chartobj); 
     	     		    //辦公大樓 住宅大樓 公寓(5樓以下)  套房  店面 倉庫 其它 透天厝 華廈(10樓以下)

     	     		    var options = {
     	     		      chart: {
     	     		        title: '房屋類型  Performance',
     	     		        subtitle: '該區每種類型的平均一均價格',
     	     		        
     	     		      },
     	     		    backgroundColor: '#f1f8e9'
     	     		    };
     	     		    var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
     	     		    chart.draw(data, options);
     		     	   
     		     	 },
     	     		 error:function(jqXHR,textStatus,errorThrown){
     	     		    alert(textStatus+"  XDXDXDDXDD "+errorThrown);
     	     		    }
     	    	   
     	       	   });
     	         
     		  }
     			  
     		  
     			  google.charts.setOnLoadCallback(drawBackgroundColor);
        		  //下圖為 單一區 類型圖~
        		  //24行,大安區是與 chartFilter.java 預設一樣寫死   下面的 "${param.price_city}" 則是自動取select中的區域填入
        		  function drawBackgroundColor(){
        			  $.ajax({
       	               
//   	    	     	   async: false,
   	    	    	   url:"${pageContext.request.contextPath}/_10_chart.controller/chart.controller",//发送请求地址
   	    	    	   type:"get",//请求方式
   	    	    	   cache: false, 
   	    			   dataType: "JSON",
   	    	    	   data:{//发送给数据库的数据
   	    	    		   
   	    	    		   price_city : price_city,
   	    	    		   price_bdtype : price_bdtype
//   	    	     		   price_city:$("#areaend").val(),
//   	    	     		   price_bdtype:$("#typetype").val()
   	    	    	   } 
   	    	    	   , 
   	    	    	   //请求成功后的回调函数有两个参数
   	    	     	   success: function(chartdata){ 
//    	    	     		 alert("改變後折線圖"+chartdata);
   	    	     		 var chartobj =JSON.parse(chartdata);
   	    	     		 //成功執行servlet 並且得到servlet回傳資料 chartdata  res.getWriter().write 回傳的
   	    	     		 //又轉成json JSON.parse(chartdata); 是因為 得到的不知為何是string
   	    	     	     //arrayToDataTablev 是吃json格式  
//    	      			  var data2 = google.visualization.arrayToDataTable(chartobj); 
   	      		    //辦公大樓 住宅大樓 公寓(5樓以下)  套房  店面 倉庫 其它 透天厝 華廈(10樓以下)
                       var data = new google.visualization.DataTable();
                       data.addColumn('string','X');
                       data.addColumn('number', '平均價格'); 
   	      		    data.addRows(chartobj);

   	      		    
   	      		    
   	      		   var options = {
           		  
//            	         title: '平均每坪價格X 時間變動圖',
//                         subtitle: 'xxx',
                        hAxis: {
                        title: 'YearMonth(民國月份)'
                        },
                        vAxis: {
                        title: '坪價'
                        },
                         backgroundColor: '#f1f8e9'
                        };
   	      		     var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
   	      		    chart.draw(data, options);
   	    	     	   
   	    	     	 },
   	      		 error:function(jqXHR,textStatus,errorThrown){
   	      		    alert(textStatus+"  XDXDXDDXDD "+errorThrown);
   	      		    }
   	     	   });
   	          //上為function2 ending處 預設 折線圖
   	    		  
   	    		  
   	    	  }
     		  
     
         });
  
  
});
    
    
</script>

<script type="text/javascript">
        window.onload = function () {
            //當頁面載完之後，用AddressSeleclList.Initialize()，
            //傳入要綁定的縣市下拉選單ID及鄉鎮市區下拉選單ID
            AddressSeleclList.Initialize('cityend', 'areaend');
            //此區綁定 select 後的值!    select id="cityend"   即對應這邊的JS裡的選項

//             //後面四個參數分別是兩個下拉選單的預設文字跟值
//            AddressSeleclList.Initialize('縣市2', '鄉鎮市區2', 'Please Select City00', '00', 'Please Select Area11', '01');
       }
</script> 
        
<!-- ☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻ 以上偶的 ☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻-->

	<div id="main">
		<div id="site_content">
<%-- 				<c:if test="${not empty LoginOK}"> --%>
<!-- 				<h2 align="right"></h2> -->
<%-- 				</c:if> --%>
			<div id="site_heading">
				<h1>好宅房屋網</h1>
				<h2>歡迎  ${LoginOK.user_name}</h2>
			</div>
			<!--close site_heading-->
			<div id="header">			
				<div id="menubar">
					<ul id="menu">
					
						<li class="current"><a href="index.jsp">首頁</a></li>
						<li><a href="/Happyhouse/_02_sellhouse/SellHouseSearch.jsp">出售專區</a>
						<ul>
						<li><a href="/Happyhouse/_02_sellhouse/SellHouseSearch.jsp">搜尋出售</a></li>
                        <li><a href="http://localhost:8080/Happyhouse/_02_sellhouse/InsertSellHouse.jsp">刊登出售</a></li>
						</ul>
						</li>
						<li><a href="">出租專區</a>
						<ul>
						<li><a href="/Happyhouse/_03_renthouse/RentHouseSearch.jsp">搜尋出租</a></li>
                        <li><a href="/Happyhouse/_03_renthouse/InsertRentHouse.jsp">刊登出租</a></li>
						</ul>
						</li>
						<li><a href="testimonials.html">時價查詢</a>
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
						<li><a href="/Happyhouse/pages/product.controller?furniture_id=&prodaction=查詢所有刊登家具">查詢所有刊登家具</a></li>	
						<li><a href="/Happyhouse/pages/product.controller?user_account=${LoginOK.user_account}&prodaction=查詢您的刊登家具">查詢您刊登的家具</a></li>
						</ul>
					    </c:if>
						</li>
						<li><a href="/Happyhouse/addarticle.controller">討論區</a></li>										
						<c:if test="${empty LoginOK}">
						<li><a href="/Happyhouse/_01_users/login.jsp">會員登入</a></li>
						</c:if>
						<c:if test="${LoginOK.user_type=='B'||LoginOK.user_type=='C'}">
						<li><a href="/Happyhouse/_08_news/Gmindex.jsp">管理者頁面</a></li>
						</c:if>
						<c:if test="${not empty LoginOK}">
						<li><a href="">${LoginOK.user_name}個人專區</a>
						<ul>
<!-- 					<li><a href="/Happyhouse/sms.controller">修改個人密碼</a></li> -->
						<li><a href="_01_users/chasgePw.jsp">修改個人密碼</a></li>
						<li><a href="/Happyhouse/sms.controller">個人站內信箱</a></li>
						<li><a href="/Happyhouse/_07_carts/gousejsp.jsp">個人收藏頁面</a></li>
						<li><a href="/Happyhouse/_02_sellhouse/SellHouseUser.jsp">賣屋管理</a></li>
						<li><a href="/Happyhouse/_03_renthouse/RentHouseUser.jsp">租屋管理</a></li>
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
<!-- 			<div id="banner_image"> -->
<!-- 				<div id="slider-wrapper"> -->
<!-- 					<div id="slider" class="nivoSlider"> -->
 						    <img src="/Happyhouse/images/house.jpg" alt="" />                             
<!--                        <img src="/Happyhouse/images/2.jpg" alt="" />  -->
<!-- 					<img src="/Happyhouse/images/3.jpg" alt="" /> -->

<!-- 					</div> -->
<!-- <!-- 					close slider --> 
<!-- 				</div> -->
<!-- <!-- 				close slider_wrapper --> 
<!-- 			</div> -->
			<!--close banner_image-->
			<div id="content">
				<div class="content_item">
                    <h1>${select.one.new_title}</h1>
						<p>${select.one.new_describe}</p>
				</div>
				<!--close content_item-->
				<div class="content_image">
<!-- 					<a href="#"><img style="border: 10px solid #FFF;" alt="image" -->
<!-- 						src="/Happyhouse/images/11.jpg" /></a> -->
				<img style="border: 10px solid #FFF;" alt="image" src="${pageContext.servletContext.contextPath}/newimage1?new_id=${select.one.new_id}" width="150px">		
				</div>
				<!--close content_image-->
				<div class="content_text">
			        <h1>${select.two.new_title}</h1>
					<p>${select.two.new_describe}</p>
				</div>
				<!--close content_text-->
				<br style="clear: both" />
				<div class="content_image_right">
					<a href="#"><img style="border: 10px solid #FFF;" alt="image"
						src="/Happyhouse/images/22.jpg" /></a>
				</div>
				
				<!--close content_image-->
				
				<div class="content_text_left">
					<h1>${select.three.new_title}</h1>
					<p>${select.three.new_describe}</p>
				</div>
				
<!-- 				<div class="content_text_left"> -->

<!-- 				</div> -->
				<!--close content_text-->

<!-- 			</div> -->
			<!--close content-->


		<!--close site_content-->
		
		
		
		
		
<!-- 		<div> -->
		


		<!-- ☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻以下偶的☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻ -->
		
        <div class="content_select_div">
		<form action="<c:url value="/_10_chart.controller/chart.controller"/>"	method="get" name="form_name">
		<!-- FORM NAME其實沒用到.... -->
		<select id="cityend" name="currentprice_citymain">
			<!--     和input box一樣 用name 傳值給SERVLET -->
		</select>
		<!--  城市 >> 台北市 .... -->

		<select id="areaend" name="price_city">
			<!-- <option value = document.getElementById(area)> -->
		</select>
		<!--  區域 >> 大安 松山...... -->

	 
		<select id="typetype" name="price_bdtype">
			<!-- <option value = document.getElementById(area)> -->
			<option value="">建物類型</option>
			<option value="辦公商業大樓">辦公商業大樓</option>
			<option value="住宅大樓">住宅大樓</option>
			<option value="公寓">公寓(5樓以下)</option>
			<option value="套房">套房</option>
			<option value="店面">店面</option>
			<option value="其它">其它</option>
			<option value="透天厝">透天厝</option>
			<option value="華廈">華廈(10樓以下)</option>
		</select>
		<!--  類型 >> -->
</div>
		<div id="columnchart_material" style="width: 300px; height: 250px; float:left"></div>
		<div id="chart_div" style="width: 300px; height: 250px; float:left"></div>

	</form>
	</div>
<!-- ☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻ 以上偶的 ☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻-->







			<div class="sidebar_container">
				<div class="sidebar">
					<div class="sidebar_item">
	                    <h2>${select.four.new_title}</h2>
						<h4>${select.four.new_date}</h4>
						<p>${select.four.new_describe}</p>
					</div>
					<!--close sidebar_item-->
				</div>
				<!--close sidebar-->
				<div class="sidebar">
					<div class="sidebar_item">
						<h2>${select.five.new_title}</h2>
						<h4>${select.five.new_date}</h4>
						<p>${select.five.new_describe}</p>
					</div>
					<!--close sidebar_item-->
				</div>
				<!--close sidebar-->
				<div class="sidebar">
						<h2>${select.six.new_title}</h2>
						<h4>${select.six.new_date}</h4>
						<p>${select.six.new_describe}</p>
					</div>
					<!--close sidebar_item-->
				</div>
				<!--close sidebar-->
			</div>
			<!--close sidebar_container-->

		</div>
		
		
		
		
		

		
		
		
		

		
</script>	
	
	<div id="menu">
			<a href="http://validator.w3.org/check?uri=referer">好宅網有限公司 版權所有 © 2015-2016 HappyHouse. All Rights Reserved. </a>
		</div>
		<!--close footer-->
	</div>
	<!--close main-->
	
	

	
</body>
</html>
