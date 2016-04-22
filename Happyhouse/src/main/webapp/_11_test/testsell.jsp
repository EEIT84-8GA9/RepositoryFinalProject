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
<script type="text/javascript" src="/Happyhouse/js/jquery.easing.min.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript"	src="https://www.gstatic.com/charts/loader.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="/Happyhouse/rinocss/normalize.css" /> -->
<!-- 	<link rel="stylesheet" type="text/css" href="/Happyhouse/rinocss/htmleaf-demo.css"> -->
<!-- 	<link rel="stylesheet" type="text/css" href="/Happyhouse/rinocss/style.css"> -->
<!-- <script src="/Happyhouse/js/main.js"></script> -->
<link rel="stylesheet" type="text/css" href="/Happyhouse/rinocss/style.css" />
<script src="/Happyhouse/rinocss/modernizr.custom.63321.js"></script>
</head>
<body>


<script type="text/javascript">
$(document).ready(function(){
//   此為開啟首面直接 READY去叫預設值 畫圖~
//   ajax就是去call function得到回傳資料, 並且局部更新網頁畫面,不用重新載入整個頁面
//   以servlet原本的會重新導向的那個內容就不適用 ( 他不算資料)	  應該是要回傳你要畫圖的資料
//   google.charts.load('current', {'packages':['bar']});    兩張不同圖的解法?   LINE加入~! 下一張 頭 一樣! 但有些要加 2
//   function test(Choose1){ 
 google.charts.load("current", {packages:["corechart"]});
 //google.charts.load('current', {packages: ['bar','corechart', 'line']});  只會LOAD 一次!!!!!!!!!!!!
//    google.charts.setOnLoadCallback(drawChart);
//    google.charts.setOnLoadCallback(drawChart2);
   google.charts.setOnLoadCallback(drawChart1);
   google.charts.setOnLoadCallback(drawChart2);
  //與二區圖  方法作為區別所以 句末加一
 
//   var price_city1 ="大安區";

//   function drawChart() {
	  
// 		  $.ajax({
           
	    	  
// //	     	   async: false,   
// 	    	   url:"${pageContext.request.contextPath}/_06_currentprice.controller/cpweb.controller",      //发送请求地址
// 	    	   type:"get",//请求方式
// 	    	   cache: false, 
// 			   dataType: "JSON",
// 	    	   data:{//发送给数据库的数据
	    		   
// 	    		   price_city : price_city1
// // 	    		   price_bdtype : price_bdtype1
// //	     		   price_city:$("#areaend").val(),
// //	     		   price_bdtype:$("#typetype").val()
// 	    	   }, 
// 	    	   //请求成功后的回调函数有两个参数
	    	   
// 	     	   success: function(chartdata){ 	     		 
// // 	     		 var chartobj =JSON.parse(chartdata);      //此處 很怪!!!!!!!!!!! jq 指定callback datatype了 json 所以回來已經是json 所以不必再轉 所以 var data 直接裡面塞 chardata而不是 chartobj
// // 	     		alert(chartobj); 
// 	     		 //成功執行servlet 並且得到servlet回傳資料 chartdata  res.getWriter().write 回傳的
// 	     		 //又轉成json JSON.parse(chartdata); 是因為 得到的不知為何是string
// 	     	     //arrayToDataTablev 是吃json格式  
//   			  var data = google.visualization.arrayToDataTable(chartdata);
//   			   alert("圓餅一圖2>>"+chartdata);	 
//   		    //辦公大樓 住宅大樓 公寓(5樓以下)  套房  店面 倉庫 其它 透天厝 華廈(10樓以下)
// //         alert(chartobj); 
//   		     var options = {
//              title: '區域 VS 房屋類型',
//              pieHole: 0.4,
//              is3D: true,
//            };
// //   		   alert(chartobj);             
//   		   alert("圓餅一圖3>>"+chartdata);
//   		   var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
//   	        chart.draw(data, options);
	     	   
// 	     	 },
//   		 error:function(jqXHR,textStatus,errorThrown){
//   		    alert(textStatus+"  XDXDXDDXDD "+errorThrown);
//   		    }
//  	   });
//   }
  
  
  
  
  
  var price_city1 ="大安區";
  var price_bdtype1 = "套房";
  var price_floors1 = "TEST層" ;
  
  function drawChart1() {
	  
		  $.ajax({
           
	    	  
//	     	   async: false,   
	    	   url:"${pageContext.request.contextPath}/_10_chart.controller/chart.controller",      //发送请求地址
	    	   type:"get",//请求方式
	    	   cache: false, 
			   dataType: "JSON",
	    	   data:{//发送给数据库的数据
	    		   
	    		   price_city : price_city1,
	    		   price_bdtype : price_bdtype1,
	    		   price_floors : price_floors1
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
          title: 'area vs. price comparison',
          hAxis: {title: 'Area', minValue: 0, maxValue: 15},
          vAxis: {title: 'Price', minValue: 0, maxValue: 15},
          pointSize: 10,
          pointShape: { type: 'star', sides: 6 },
          legend: 'none'
        };
//   		   alert(chartobj);             
  		   alert("散佈圖,84%以區/類型選擇"+chartdata);
  		 var chart = new google.visualization.ScatterChart(document.getElementById('chart_div2'));
  	        chart.draw(data, options);
	     	   
	     	 },
  		 error:function(jqXHR,textStatus,errorThrown){
  		    alert(textStatus+"  XDXDXDDXDD "+errorThrown);
  		    }
 	   });
  }
  
  
  
  
  

  var price_city1 ="大安區";
  var price_bdtype1 = "套房";
  var price_transes1 = "一樓";

  function drawChart2() {
	  
		  $.ajax({
           
	    	  
//	     	   async: false,   
	    	   url:"${pageContext.request.contextPath}/_10_chart.controller/chart.controller",      //发送请求地址
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
	     		  alert("BAR時間圖1>>>"+chartdata); 
	     	   
// 	     		 var chartobj =JSON.parse(chartdata);      //此處 很怪!!!!!!!!!!! jq 指定callback datatype了 json 所以回來已經是json 所以不必再轉 所以 var data 直接裡面塞 chardata而不是 chartobj
// 	     		alert(chartobj); 
	     		 //成功執行servlet 並且得到servlet回傳資料 chartdata  res.getWriter().write 回傳的
	     		 //又轉成json JSON.parse(chartdata); 是因為 得到的不知為何是string
	     	     //arrayToDataTablev 是吃json格式  
// 	     	         alert("BAR時間圖2>>>"+chartobj); 
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
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
})
</script>











<div id="donutchart" style="width: 630px; height: 350px;"></div>
<div id="chart_div2" style="width: 900px; height:500px;"></div>
<div id="chart_div" style="width: 900px; height: 500px;"></div>


</body>
</html>