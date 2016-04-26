<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CurrentPrice Page</title>
</head>
<link rel="stylesheet" type="text/css" href="/Happyhouse/css/style.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="../js/tabulator.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery.easing.min.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript"	src="https://www.gstatic.com/charts/loader.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="/Happyhouse/rinocss/normalize.css" /> -->
<!-- 	<link rel="stylesheet" type="text/css" href="/Happyhouse/rinocss/htmleaf-demo.css"> -->
<!-- 	<link rel="stylesheet" type="text/css" href="/Happyhouse/rinocss/style.css"> -->
<!-- <script src="/Happyhouse/js/main.js"></script> -->
<link rel="stylesheet" type="text/css" href="/Happyhouse/rinocss/style.css" />
		<script src="/Happyhouse/rinocss/modernizr.custom.63321.js"></script>
<!-- 上為選單效果 -->
		<link rel="stylesheet" type="text/css" href="/Happyhouse/rinocss/normalize.css" />
	    <link rel="stylesheet" type="text/css" href="/Happyhouse/rinocss/search-form.css">



<body>

<div id="main">
		<div id="site_content">
<%-- 				<c:if test="${not empty LoginOK}"> --%>
<!-- 				<h2 align="right"></h2> -->
<%-- 				</c:if> --%>
			<div id="site_heading">
				<h1>好宅房屋網</h1>
				
			</div>
			<BR>
			<!--close site_heading-->
			<div id="header">			

				<div id="menubar">
					<ul id="menu">

						<li class="current"><a href="/Happyhouse/index.jsp">首頁</a></li>
						<li><a href="/Happyhouse/_02_sellhouse/SellHouseSearch.jsp">出售專區</a>
						<ul>
						<li><a href="/Happyhouse/_02_sellhouse/SellHouseSearch.jsp">搜尋出售</a></li>
                        <li><a href="http://localhost:8080/Happyhouse/_02_sellhouse/InsertSellHouse.jsp">刊登出售</a></li>
						</ul>

						
						
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
						<li><a href="/Happyhouse/pages/product.controller?furniture_id=&prodaction=查詢所有刊登家具">查詢所有刊登家具</a></li>	
						<li><a href="/Happyhouse/pages/product.controller?user_account=${LoginOK.user_account}&prodaction=查詢您的刊登家具">查詢您刊登的家具</a></li>
						
						</ul>
					    </c:if>
						</li>
						<li><a href="/Happyhouse/addarticle.controller">討論區</a></li>										
						<c:if test="${empty LoginOK}">
						<li><a href="/Happyhouse/_01_users/login.jsp">會員登入</a></li>
						</c:if>
						<c:if test="${not empty LoginOK}">
						<li><a href="">${LoginOK.user_name}個人專區</a>
						<ul>
<!-- 					<li><a href="/Happyhouse/sms.controller">修改個人密碼</a></li> -->
						<li><a href="_01_users/chasgePw.jsp">修改個人密碼</a></li>
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
			<c:if test="${not empty ChangeOK}">
            <h3 align="center">提示: 更改密碼成功</h3>
            </c:if>
	<section class="htmleaf-container">
		<form onsubmit="submitFn(this, event);" action="<c:url value="/_06_currentprice.controller/cpweb.controller"/>" method="get">
            <div class="search-wrapper">
                <div class="input-holder">
                    <input type="text" name="currentprice_address" value="${param.currentprice_address}" class="search-input" placeholder="Type to search" />
                    <button class="search-icon" type="submit" name="prodaction" value="Pick" onclick="searchToggle(this, event);"><span></span></button>
                </div>
                <span class="close" onclick="searchToggle(this, event);"></span>
                <div class="result-container">

                </div>
            </div>
        </form>
	</section>

<script type="text/javascript">
// var path = "${pageContext.request.contextPath}";
// function doBlur() {
// 	document.getElementsByTagName("img")[0].style.display =  "inline";
//  	var url = path+"/pages/product.view";
// 	var id = document.getElementsByTagName("input")[0].value;
// // 	sendGetRequest(url, id, "textText");
// // 	sendPostRequest(url, id, "textXml");
// // 	sendPostRequest(url, id, "textJson");
// 	sendPostRequestJSON(url, id);
// }
// function clearForm() {
// 	var inputs = document.getElementsByTagName("input");
// 	for(var i=0; i<inputs.length; i++) {
// 		if(inputs[i].type=="text") {
// 			inputs[i].value="";
// 		}
// 	}
// 	var spanElement = document.getElementsByTagName("span")[0];
// 	spanElement.removeChild(spanElement.firstChild);
// }
</script>
<c:if test="${not empty Pick}">
<script type="text/javascript">
	//sample data to be used in all tabulators
	var tabledata = [
	             	<c:forEach var="row" items="${Pick}" varStatus="loop">
 	{id:"${(loop.index)+1}",address:"${row.currentprice_address}",bdtype:"${row.currentprice_bdtype}",trades:"${row.currentprice_trades}",transes:"${row.currentprice_transes}",
 	rooms:"${row.currentprice_rooms}",livinroom:"${row.currentprice_livinroom}",toilet:"${row.currentprice_toilet}",
 	enddate:"${row.currentprice_enddate}",tradedate:"${row.currentprice_tradedate}",housearea:"${row.currentprice_housearea}",oneprice:"${row.currentprice_oneprice}",
 	
 	
 	},</c:forEach>
	];
	</script>
</c:if>

<%-- <td>${row.currentprice_enddate}</td> --%>
<%-- 	            		<td>${row.currentprice_tradedate}</td> --%>
<%-- 	            		<td>${row.currentprice_housearea}</td> --%>
<%-- 	            		<td>${row.currentprice_oneprice}</td> --%>


<%-- <h3>Welcome ${user.email}</h3> --%>

<!-- fitColumns:true -->
<!-- 列填滿效果 -->
<!-- rowClick:function(e, id, data, row){ -->
<!-- 			alert("Row " + id + " Clicked!!!!") -->
<!-- 		}, -->
<!-- 		rowContext:function(e, id, data, row){ -->
<!-- 			alert("Row " + id + " Context Clicked!!!!") -->
<!-- click效果 -->




 

<%-- <form action="<c:url value="/_06_currentprice.controller/cpweb.controller"/>" method="get"> --%>
<!-- <!-- 以各區分別     currentprice_city --> 
<!-- <!-- 以類別區分     currentprice_bdtype  --> 
<!-- <!-- 賣的樓層       currentprice_transes   -->
<!-- <!-- 總坪數         currentprice_housearea -->
<!-- <!-- 總價元         currentprice_tprice -->
<!-- <table > -->

<!-- <!--用"currentprice_city"  將 value="${param.currentprice_city}" 輸入的值  放到Servlet中   -->
<!-- <!-- String currentprice_city = request.getParameter("currentprice_city"); --> 
<!-- <!-- 再轉換成字串使用 -->
<!-- 	<tr> -->
		
<!-- 		<td> -->
<!-- 		<select id="cityend" > -->
<!-- 			<!-- <option value = document.getElementById(area)> --> 
<!-- 			<option value="">城市</option> -->
<!-- 			<option value="台北市">台北市</option> -->
<!-- 			<option value="台北縣">台北縣</option> -->
<!-- 			<option value="桃園市">桃園市</option> -->
<!-- 			<option value="新竹市">新竹市</option> -->
<!-- 			<option value="高雄市">高雄市</option> -->
<!-- 			<option value="花蓮市">花蓮市</option> -->
<!-- 			<option value="台東市">台東市</option> -->
<!-- 			<option value="南投市">南投市</option> -->
<!-- 		</select>  -->
<!-- 		</td> -->
<!-- 		<td>(區域)時價查詢:請輸入..[EX:大安區安和路一段]</td> -->
<%-- 		<td><input type="text" name="currentprice_address" value="${param.currentprice_address}" onblur="doBlur()" onfocus="clearForm()"></td> --%>
<%-- 		<td><span class="error">${error.currentprice_address}</span></td> --%>
	    
<!-- 		<td> -->
<!-- 			<input type="submit" name="prodaction" value="Pick"> -->
<!-- 			<input type="button" value="Clear" onclick="clearForm()"> -->
<!-- 		</td> -->
<!--         <td> -->
<%--         <h3><span class="error">${error.action}</span></h3>	 --%>
<!-- 	    </td> -->
	
<!-- 	</tr> -->
	
	
	
	
<!-- </table> -->
<!-- </form> -->




<div id="currentprice_table" style="margin-top:90px;"></div>
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
// 		fitColumns:true,
		columns:[
		{title:"Id", field:"id", width:25},
		{title:"建物地址", field:"address", width:280},
		{title:"建物類型", field:"bdtype", width:100},
		{title:"筆棟數", field:"trades", width:120},
		{title:"樓層", field:"transes", width:50},
		{title:"房", field:"rooms", width:25},
		{title:"廳", field:"livinroom", width:25},
		{title:"衛", field:"toilet", width:25},
		{title:"完工", field:"enddate", width:70},
		{title:"交易", field:"tradedate", width:60},
		{title:"總坪數", field:"housearea", width:70},
		{title:"一坪價格", field:"oneprice", width:90},
		
		
		],
	}); 
// 	<td>${row.currentprice_enddate}</td>
// 	<td>${row.currentprice_tradedate}</td>
// 	<td>${row.currentprice_housearea}</td>
// 	<td>${row.currentprice_oneprice}</td>
// 	<th>建物地址</th>
// 	<th>建物類型</th>
// 	<th>筆棟數</th>
// 	<th>樓層</th>
// 	<th>房</th>
// 	<th>廳</th>
// 	<th>衛</th>
// 	<th>建物完成年月</th>
// 	<th>交易完成年月</th>
// 	<th>總坪數</th>
// 	<th>一坪價格</th>
	
	//alert(tabledata);
// 	alert(JSON.stringify(tabledata));
	$("#currentprice_table").tabulator("setData",tabledata);
	$(window).resize(function(){
		$("#currentprice_table").tabulator("redraw");
	});
	</script>
	
</section>

	
<!-- alert(JSON.stringify(tabledata)); -->
<%-- 	$("#example-table-simple").tabulator("setData",[<c:forEach var="row" items="${Pick}" varStatus="loop"> --%>
<%--  	{id:"${loop.index}",name:"${row.currentprice_address}",age:"${row.currentprice_bdtype}",gender:"${row.currentprice_trades}",height:"${row.currentprice_transes}",col:"${row.currentprice_rooms}",dob:"${row.currentprice_livinroom}",cheese:"${row.currentprice_toilet}"}, --%>
<%--   	</c:forEach>]); --%>
<!-- 	$(window).resize(function(){ -->
<!-- 		$("#example-table-simple").tabulator("redraw"); -->
<!-- 	}); -->
<!-- 	</script> -->



<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@以下為3PIE圖@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

<script type="text/javascript">
$(document).ready(function(){
//   此為開啟首面直接 READY去叫預設值 畫圖~
//   ajax就是去call function得到回傳資料, 並且局部更新網頁畫面,不用重新載入整個頁面
//   以servlet原本的會重新導向的那個內容就不適用 ( 他不算資料)	  應該是要回傳你要畫圖的資料
//   google.charts.load('current', {'packages':['bar']});    兩張不同圖的解法?   LINE加入~! 下一張 頭 一樣! 但有些要加 2
//   function test(Choose1){ 
 google.charts.load("current", {packages:["corechart"]});
 //google.charts.load('current', {packages: ['bar','corechart', 'line']});  只會LOAD 一次!!!!!!!!!!!!
   google.charts.setOnLoadCallback(drawChart);
   google.charts.setOnLoadCallback(drawChart2);
   google.charts.setOnLoadCallback(drawChart3);
  //與二區圖  方法作為區別所以 句末加一
 
  var price_city1 ="大安區";

  function drawChart() {
	  
		  $.ajax({
           
	    	  
//	     	   async: false,   
	    	   url:"${pageContext.request.contextPath}/_06_currentprice.controller/cpweb.controller",      //发送请求地址
	    	   type:"get",//请求方式
	    	   cache: false, 
			   dataType: "JSON",
	    	   data:{//发送给数据库的数据
	    		   
	    		   price_city : price_city1
// 	    		   price_bdtype : price_bdtype1
//	     		   price_city:$("#areaend").val(),
//	     		   price_bdtype:$("#typetype").val()
	    	   }, 
	    	   //请求成功后的回调函数有两个参数
	    	   
	     	   success: function(chartdata){ 	     		 
// 	     		 var chartobj =JSON.parse(chartdata);      //此處 很怪!!!!!!!!!!! jq 指定callback datatype了 json 所以回來已經是json 所以不必再轉 所以 var data 直接裡面塞 chardata而不是 chartobj
// 	     		alert(chartobj); 
	     		 //成功執行servlet 並且得到servlet回傳資料 chartdata  res.getWriter().write 回傳的
	     		 //又轉成json JSON.parse(chartdata); 是因為 得到的不知為何是string
	     	     //arrayToDataTablev 是吃json格式  
  			  var data = google.visualization.arrayToDataTable(chartdata); 
  		    //辦公大樓 住宅大樓 公寓(5樓以下)  套房  店面 倉庫 其它 透天厝 華廈(10樓以下)
//         alert(chartobj); 
  		     var options = {
             title: '區域 VS 房屋類型',
             pieHole: 0.4,
             is3D: true,
           };
//   		   alert(chartobj);             
//   		   alert("圓餅一圖"+chartdata);
  		   var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
  	        chart.draw(data, options);
	     	   
	     	 },
  		 error:function(jqXHR,textStatus,errorThrown){
  		    alert(textStatus+"  XDXDXDDXDD "+errorThrown);
  		    }
 	   });
  }
      //上為function1 ending處  預設 BAR圖~
       
      
     
//        *********************以下餅二圖**********************
       var price_city1 ="大安區";
       var price_bdtype1 ="套房";
      
  function drawChart2() {
	  
		  $.ajax({
           
	    	  
//	     	   async: false,   
	    	   url:"${pageContext.request.contextPath}/_06_currentprice.controller/cpweb.controller",      //发送请求地址
	    	   type:"get",//请求方式
	    	   cache: false, 
			   dataType: "JSON",
	    	   data:{//发送给数据库的数据
	    		   
	    		   price_city : price_city1,
	    		   price_bdtype : price_bdtype1
//	     		   price_city:$("#areaend").val(),
//	     		   price_bdtype:$("#typetype").val()
	    	   }, 
	    	   //请求成功后的回调函数有两个参数
	    	   
	     	   success: function(chartdata){ 	     		 
// 	     		 var chartobj =JSON.parse(chartdata);      //此處 很怪!!!!!!!!!!! jq 指定callback datatype了 json 所以回來已經是json 所以不必再轉 所以 var data 直接裡面塞 chardata而不是 chartobj
// 	     		alert(chartobj); 
	     		 //成功執行servlet 並且得到servlet回傳資料 chartdata  res.getWriter().write 回傳的
	     		 //又轉成json JSON.parse(chartdata); 是因為 得到的不知為何是string
	     	     //arrayToDataTablev 是吃json格式  
  			  var data = google.visualization.arrayToDataTable(chartdata); 
  		    //辦公大樓 住宅大樓 公寓(5樓以下)  套房  店面 倉庫 其它 透天厝 華廈(10樓以下)
//         alert(chartobj); 
  		     var options = {
          title: '區域 VS 平均坪數 [ex:10=10~20坪]',
          is3D: true,
        };
//   		   alert(chartobj);             
//   		   alert("圓餅二圖"+chartdata);
  		 var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
         chart.draw(data, options);
	     	   
	     	 },
  		 error:function(jqXHR,textStatus,errorThrown){
  		    alert(textStatus+"  XDXDXDDXDD "+errorThrown);
  		    }
 	   });
  }
      
//  *********************以上餅二圖**********************
      
      
      
      
//   *********************以下餅三圖**********************

var price_city1 ="大安區";
var price_bdtype1 ="套房";
var price_transes1 ="一樓";

  function drawChart3() {
	  
		  $.ajax({
           
	    	  
//	     	   async: false,   
	    	   url:"${pageContext.request.contextPath}/_06_currentprice.controller/cpweb.controller",      //发送请求地址
	    	   type:"get",//请求方式
	    	   cache: false, 
			   dataType: "JSON",
	    	   data:{//发送给数据库的数据
	    		   
	    		   price_city : price_city1,
	    		   price_bdtype : price_bdtype1,
	    		   price_transes : price_transes1
//	     		   price_city:$("#areaend").val(),
//	     		   price_bdtype:$("#typetype").val()
	    	   }, 
	    	   //请求成功后的回调函数有两个参数
	    	   
	     	   success: function(chartdata){ 	     		 
// 	     		 var chartobj =JSON.parse(chartdata);      //此處 很怪!!!!!!!!!!! jq 指定callback datatype了 json 所以回來已經是json 所以不必再轉 所以 var data 直接裡面塞 chardata而不是 chartobj
// 	     		alert(chartobj); 
	     		 //成功執行servlet 並且得到servlet回傳資料 chartdata  res.getWriter().write 回傳的
	     		 //又轉成json JSON.parse(chartdata); 是因為 得到的不知為何是string
	     	     //arrayToDataTablev 是吃json格式  
  			  var data = google.visualization.arrayToDataTable(chartdata); 
  		    //辦公大樓 住宅大樓 公寓(5樓以下)  套房  店面 倉庫 其它 透天厝 華廈(10樓以下)
//         alert(chartobj); 
  		     
        var options = {
                title: '區域 VS 樓層分佈',
                legend: 'none',
                pieSliceText: 'label',
                slices: {  0: {offset:0.2},
                          1: {offset: 0.15},
                          2: {offset: 0.1},
                          3: {offset: 0.05},
                
                },
        };
//   		   alert(chartobj);             
//   		   alert("圓餅三圖"+chartdata);
  		 var chart = new google.visualization.PieChart(document.getElementById('piechart'));
         chart.draw(data, options);
	     	   
	     	 },
  		 error:function(jqXHR,textStatus,errorThrown){
  		    alert(textStatus+"  XDXDXDDXDD "+errorThrown);
  		    }
 	   });
  }








//   *********************以上餅三圖**********************
});
</script>	      








	      
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@以上為3PIE圖@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->



<!-- 以下為顯示表~最原始版 -->
<!-- <link rel="stylesheet" type="text/css" href="../css/table.css" /> -->


<!-- <h3>Select CurrentPrice Table Result : XXX row(s) selected</h3> -->

<%-- <c:if test="${not empty Pick}"> --%>
<!-- <table> -->
<!-- 	<thead> -->
<!-- <!-- currentprice address,currentprice_bdtype, currentprice_trades , currentprice_transes,currentprice_rooms,currentprice_livinroom,currentprice_toilet, --> 
<!-- <!-- currentprice_enddate,currentprice_tradedate,currentprice_housearea,currentprice_oneprice --> 
<!-- 	<tr> -->
<!-- 		<th>建物地址</th> -->
<!-- 		<th>建物類型</th> -->
<!-- 		<th>筆棟數</th> -->
<!-- 		<th>樓層</th> -->
<!-- 		<th>房</th> -->
<!-- 		<th>廳</th> -->
<!-- 		<th>衛</th> -->
<!-- 		<th>建物完成年月</th> -->
<!-- 		<th>交易完成年月</th> -->
<!-- 		<th>總坪數</th> -->
<!-- 		<th>一坪價格</th> -->
		
<!-- 	</tr> -->
<!-- 	</thead> -->
	
<!-- 	<tbody> -->
<%-- 	<c:forEach var="row" items="${Pick}"> --%>

<!-- 	<tr> -->
<%-- 	    <td>${row.currentprice_address}</td> --%>
<%-- 		<td>${row.currentprice_bdtype}</td> --%>
<%-- 		<td>${row.currentprice_trades}</td> --%>
<%-- 		<td>${row.currentprice_transes}</td> --%>
<%-- 		<td>${row.currentprice_rooms}</td> --%>
<%-- 		<td>${row.currentprice_livinroom}</td> --%>
<%-- 		<td>${row.currentprice_toilet}</td> --%>
<%-- 		<td>${row.currentprice_enddate}</td> --%>
<%-- 		<td>${row.currentprice_tradedate}</td> --%>
<%-- 		<td>${row.currentprice_housearea}</td> --%>
<%-- 		<td>${row.currentprice_oneprice}</td> --%>
<!-- 	</tr> -->
<%-- 	</c:forEach> --%>
<!-- 	</tbody> -->
<!-- </table> -->
<%-- </c:if> --%>

<!-- <div id="donutchart" style="width: 900px; height: 500px;"></div> -->
<!-- <div id="piechart_3d" style="width: 900px; height: 500px;"></div> -->
<!-- <div id="piechart" style="width: 900px; height: 500px;"></div> -->





<div class="container">	
			<header class="clearfix">
				<h1>房屋(類型/坪數/樓層)統計 <span>以下圖表統計自105/05起</span></h1>
			</header>
			<BR>
			<BR>
			<BR>
			<div class="main">
				<div id="mi-slider" class="mi-slider">
					<ul>
						<li><a href="#"><div id="donutchart" style="width: 630px; height: 350px;"></div><h4></h4></a></li>
						<li><a href="#"><h4></h4></a></li>
						<li><a href="#"><h4></h4></a></li>
						<li><a href="#"><h4></h4></a></li>
					</ul>
					<ul>
						<li><a href="#"><div id="piechart_3d" style="width:630px; height: 350px;"><h4></h4></a></li>
						<li><a href="#"><h4></h4></a></li>
						<li><a href="#"><h4></h4></a></li>
						<li><a href="#"><h4></h4></a></li>
					</ul>
					<ul>
						<li><a href="#"><div id="piechart" style="width: 630px; height: 350px;"></div><h4></h4></a></li>
						<li><a href="#"><h4></h4></a></li>
						<li><a href="#"><h4></h4></a></li>
					</ul>
<!-- 					<ul> -->
<!-- 						<li><a href="#"><img src="images/12.jpg" alt="img12"><h4>Carry-Ons</h4></a></li> -->
<!-- 						<li><a href="#"><img src="images/13.jpg" alt="img13"><h4>Duffel Bags</h4></a></li> -->
<!-- 						<li><a href="#"><img src="images/14.jpg" alt="img14"><h4>Laptop Bags</h4></a></li> -->
<!-- 						<li><a href="#"><img src="images/15.jpg" alt="img15"><h4>Briefcases</h4></a></li> -->
<!-- 					</ul> -->
					<nav>
						<a href="#">房屋/類型 圓餅圖</a>
						<a href="#">房屋/坪數 圓餅圖</a>
						<a href="#">房屋/樓層 圓餅圖</a>
<!-- 						<a href="#">Bags</a> -->
					</nav>
					
				</div>
			</div>
		</div><!-- /container -->
		<script src="/Happyhouse/rinocss/jquery.catslider.js"></script>
		<script>
			$(function() {

				$( '#mi-slider' ).catslider();

			});
		</script>


<!-- ********************** -->


	
	
	<script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>
	<script type="text/javascript">
        function searchToggle(obj, evt){
            var container = $(obj).closest('.search-wrapper');

            if(!container.hasClass('active')){
                  container.addClass('active');
                  evt.preventDefault();
            }
            else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
                  container.removeClass('active');
                  // clear input
                  container.find('.search-input').val('');
                  // clear and hide result container when we press close
                  container.find('.result-container').fadeOut(100, function(){$(this).empty();});
            }
        }

        function submitFn(obj, evt){
            value = $(obj).find('.search-input').val().trim();

            _html = "Yup yup! Your search text sounds like this: ";
            if(!value.length){
                _html = "Yup yup! Add some text friend :D";
            }
            else{
                _html += "<b>" + value + "</b>";
            }

            $(obj).find('.result-container').html('<span>' + _html + '</span>');
            $(obj).find('.result-container').fadeIn(100);

            evt.preventDefault();
        }
    </script>


<%-- <h3><a href="<c:url value="/index.jsp" />">index</a></h3> --%>


       	
		<div id="menu">
			<a href="http://validator.w3.org/check?uri=referer">好宅網有限公司 版權所有 © 2015-2016 HappyHouse. All Rights Reserved. </a>
		</div>
		<!--close footer-->
	</div>

</body>
</html>
