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
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript" src="js/AddressSelectList.js"></script>
<script type="text/javascript"	src="https://www.gstatic.com/charts/loader.js"></script>


<!-- ☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻ 以下偶的 ☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻-->
<script type="text/javascript">
//       google.charts.load('current', {'packages':['bar']});    兩張不同圖的解法?   LINE加入~! 下一張 頭 一樣! 但有些要加 2
      google.charts.load('current', {packages: ['bar','corechart', 'line']});      
      google.charts.setOnLoadCallback(drawChart);
      //下圖為 單一區 類型圖~
      //24行,大安區是與 chartFilter.java 預設一樣寫死   下面的 "${param.price_city}" 則是自動取select中的區域填入
      function drawChart() {
    	  <c:choose> 
    	  <c:when test="${select.data_result3 != null}" >   
    	  var data = google.visualization.arrayToDataTable([
    	   ['區域','辦公大樓','住宅大樓', '公寓(5樓以下)','套房','店面','其它','透天厝','華廈(10樓以下)'],
    	   ['大安區',<c:forEach var="hikari2" items="${select.data_result3}">
    	   ${hikari2.avgoneprice_by_city_type},</c:forEach>],]);
    	  </c:when>     
    	  <c:when test="${Choose1 != null}">   
    	  var data = google.visualization.arrayToDataTable([
    	   ['區域','辦公大樓','住宅大樓', '公寓(5樓以下)','套房','店面','其它','透天厝','華廈(10樓以下)'],
    	    ['"${param.price_city}"', <c:forEach var="hikari2" items="${Choose1}"> ${hikari2.avgoneprice_by_city_type},       
    	    </c:forEach>],]);
    	  </c:when> 
    	  <c:otherwise>
          No comment sir...
          </c:otherwise>      
    	  </c:choose>   
    	  
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
      }
    </script>

<!--    下圖為 單一區   單一類型    時間 坪價折線圖~ -->
<%--    24行,大安區是與 chartFilter.java 預設一樣寫死   下面的 "${param.price_city}" 則是自動取select中的區域填入 --%>
<script type="text/javascript">
//     google.charts.load('current2', {packages: ['corechart', 'line']});
    google.charts.load('current2', {packages: ['bar2','corechart2', 'line2']});

    google.charts.setOnLoadCallback(drawBackgroundColor);
    
    function drawBackgroundColor() {
          var data = new google.visualization.DataTable();
          data.addColumn('string','X');
          data.addColumn('number', '平均每坪價格');
          
          <c:choose> 
    	  <c:when test="${select.data_result4 != null}" >   
    	  data.addRows([
                        <c:forEach var="hikari3" items="${select.data_result4}">
                        ['${hikari3.currentprice_tradedate}',${hikari3.avgoneprice_by_tradedate}],
                        </c:forEach>
          ]);
    	  </c:when>     
    	  <c:when test="${Choose2 != null}"> 
    	  
    	  data.addRows([
                        <c:forEach var="hikari3" items="${Choose2}">
                        ['${hikari3.currentprice_tradedate}',${hikari3.avgoneprice_by_tradedate}],
                        </c:forEach>
          ]);
    	  
    	  </c:when> 
    	  <c:otherwise>
          No comment sir...
          </c:otherwise>                                                 
    	        	  
    	  </c:choose>   
          
          console.log("字串1")
          var options = {
              title: '平均每坪價格X 時間變動圖',
              subtitle: 'xxx',
            hAxis: {
              title: 'YearMonth(民國月份)'
            },
            vAxis: {
              title: '坪價'
            },
            backgroundColor: '#f1f8e9'
          };
          console.log("字串2")
          var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
          console.log("字串4")
          chart.draw(data, options);
          console.log("字串5")
        }
          console.log("字串3")
    </script>

<script type="text/javascript">
        window.onload = function () {
        AddressSeleclList.Initialize('cityend', 'areaend');}
        </script>
<!-- ☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻ 以上偶的 ☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻-->

<script type="text/javascript">
	$(window).load(function() {
		$('#slider').nivoSlider();
	});
</script>  
</head>
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
						<li class="current"><a href="index.jsp">首頁</a></li>
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
						<li><a href="addarticle.controller">討論區</a></li>										
						<c:if test="${empty LoginOK}">
						<li><a href="_01_users/login.jsp">會員登入</a></li>
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
			<h1 align="center">${LoginOK.user_name}你好</h1>
			</c:if>
			<!--close header-->
<!-- 			<div id="banner_image"> -->
<!-- 				<div id="slider-wrapper"> -->
<!-- 					<div id="slider" class="nivoSlider"> -->
 						    <img src="images/house.jpg" alt="" /> 
<!--                        <img src="images/2.jpg" alt="" />  -->
<!-- 					<img src="images/3.jpg" alt="" /> -->
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
					<a href="#"><img style="border: 10px solid #FFF;" alt="image"
						src="images/11.jpg" /></a>
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
						src="images/22.jpg" /></a>
				</div>
				
				<!--close content_image-->
				
				<div class="content_text_left">
					<h1>${select.three.new_title}</h1>
					<p>${select.three.new_describe}</p>
				</div>
				<!--close content_text-->

			</div>
			<!--close content-->

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
		
<!-- ☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻以下偶的☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻ -->
		
           
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
		<input type="submit" name="prodaction" value="Choose">
		<td><span class="error">${error.currentprice_city}</span></td>

	</form>
		
		
		<div id="columnchart_material" style="width: 450px; height: 350px;"></div>
	    <div id="chart_div" style="width: 450px; height: 300px;"></div>
<!-- ☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻ 以上偶的 ☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻☻-->
		<!--close site_content-->
		<div id="menu">
			<a href="http://validator.w3.org/check?uri=referer">好宅網有限公司 版權所有 © 2015-2016 HappyHouse. All Rights Reserved. </a>
		</div>
		<!--close footer-->
	</div>
	<!--close main-->
</body>
</html>
