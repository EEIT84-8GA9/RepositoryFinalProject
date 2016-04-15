<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/AddressSelectList.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
//       google.charts.load('current', {'packages':['bar']});    兩張不同圖的解法?   LINE加入~! 下一張 頭 一樣! 但有些要加 2
      google.charts.load('current', {packages: ['bar','corechart', 'line']});
      
      google.charts.setOnLoadCallback(drawChart);
      //下圖為 單一區 類型圖~
      //24行,大安區是與 chartFilter.java 預設一樣寫死   下面的 "${param.price_city}" 則是自動取select中的區域填入
      function drawChart() {
    	  <c:choose> 
    	  <c:when test="${get_chart_data.data_result3 != null}" >   
    	  var data = google.visualization.arrayToDataTable([
    	                                                    ['區域','辦公大樓','住宅大樓', '公寓(5樓以下)','套房','店面','其它','透天厝','華廈(10樓以下)'],
    	                                                    ['大安區',
    	                                                     <c:forEach var="hikari2" items="${get_chart_data.data_result3}">
    	                                                     ${hikari2.avgoneprice_by_city_type},       
    	                                                    </c:forEach>],
    	                                                    ]);
    	  </c:when>     
    	  <c:when test="${Choose1 != null}">   
    	  var data = google.visualization.arrayToDataTable([
    	                                                    ['區域','辦公大樓','住宅大樓', '公寓(5樓以下)','套房','店面','其它','透天厝','華廈(10樓以下)'],
    	                                                                                                        
    	                                                   ['"${param.price_city}"',
    	                                                     <c:forEach var="hikari2" items="${Choose1}">
    	                                                      ${hikari2.avgoneprice_by_city_type},       
    	                                                    </c:forEach>],
    	                                                     ]);
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
    	  <c:when test="${get_chart_data.data_result4 != null}" >   
    	  data.addRows([
                        <c:forEach var="hikari3" items="${get_chart_data.data_result4}">
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



<!-- Ajax的測試Script -->

<!--           <script> -->
<!-- //          //在網頁加載後，對id=doAjaxBtn的Button設定click的function -->

<!-- //             $(document).ready(function(){ -->

<!-- //                $("#formId").change(function(){ -->

<!-- //                    $.ajax({ -->

<!-- //                         type:"POST",                    //指定http參數傳輸格式為POST -->

<!-- //                         url: "/chart.controller",        //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy -->

<!-- //                         data: AddressSeleclList.Baga0(), //要傳給目標的data為id=formId的Form其序列化(serialize)為的值，之 -->

<!-- //                                                        //內含有name的物件value -->

<!-- //                                    //目標url處理完後回傳的值之type，此列為一個JSON Object -->

<!-- //                         //Ajax成功後執行的function，response為回傳的值 -->

<!-- //                         //此範列回傳的JSON Object的內容格式如右所示: {userName:XXX,uswerInterest:[y1,y2,y3,...]} -->


<!-- //                     }); -->

<!-- //                }); -->

<!-- //             });   -->

<!--         </script> -->



<!-- <script>  -->
<!-- //  $(document).ready(function(){ -->
<!-- //      $("#cityend,#areaend").change(function(){ -->
<!-- //      	  var URLs="chart.controller"; -->

<!-- //           $.ajax({ -->
<!-- //         	   urlPatterns: URLs, -->
<!-- //                data: AddressSeleclList.Baga0(), -->
<!-- //                type:"GET", -->


<!-- //               success:function(msg){ -->
<!-- //                   alert(msg); -->

<!-- //                }, -->

<!-- //                error:function(xhr, ajaxOptions, thrownError){  -->
<!-- //                   alert(xhr.status);  -->
<!-- //                   alert(thrownError);  -->
<!-- //                } -->
<!-- //           }); -->
<!-- //     }); -->
<!-- // });    -->
<!-- </script> -->

<!-- <script> -->
<!-- // $(document).ready(function(){  -->

<!-- //  $("#formId").change(function(){  -->
<!-- // 	    var URLs="chart.controller"; -->
<!-- //         var unit = $('#cityend'); -->
<!-- //         var sta = $('#areaend'); -->


<!-- //         $.ajax({ -->
<!-- //         target: sta, -->
<!-- //         url: URLs, -->
<!-- //         data: { ajax: true} -->


<!-- //     }); -->
<!--  </script> -->


<!-- <script> -->
<!-- // $(document).ready(function(){ -->
<!-- // $("#formId").change(function(){ -->
<!-- //   $.post("/ChartPageServlet.do",{name:"Donald Duck",city:"Duckburg"}); -->
<!-- // }); -->
<!-- // }); -->


<!-- </script> -->

</head>

<body>

	<script type="text/javascript">
        window.onload = function () {
            //當頁面載完之後，用AddressSeleclList.Initialize()，
            //傳入要綁定的縣市下拉選單ID及鄉鎮市區下拉選單ID
            AddressSeleclList.Initialize('cityend', 'areaend');
            //此區綁定 select 後的值!    select id="cityend"   即對應這邊的JS裡的選項

//             //後面四個參數分別是兩個下拉選單的預設文字跟值
//            AddressSeleclList.Initialize('縣市2', '鄉鎮市區2', 'Please Select City00', '00', 'Please Select Area11', '01');
       }

       function show() {
            //取出指定縣市及鄉鎮市區的下拉選單的值
            alert(AddressSeleclList.ReturnSelectAddress('cityend','areaend'));
              }
       function show1() {
           //取出指定縣市及鄉鎮市區的下拉選單的值
           alert(AddressSeleclList.BagaCity('cityend'));
            }
       function show2() {
           //取出指定縣市及鄉鎮市區的下拉選單的值
           alert(AddressSeleclList.BagaArea('areaend'));
           }
       function show3() {
           //取出指定縣市及鄉鎮市區的下拉選單的值
           alert(AddressSeleclList.Baga0());
            }
//        alert(AddressSeleclList.Baga1());
       
       function show4() {
           //取出指定縣市及鄉鎮市區的下拉選單的值
           alert(currentprice_citymain + "currentprice_citymain" +currentprice_city + "currentprice_city");
            }
       
       
//               上為預設值!!!
       
    </script>

	<!--     <script> -->

	<!-- // var form = document.getElementById("form_name"); -->


	<!-- // //取得select的值 -->

	<!-- // var currentprice_city = form.price_city.value; -->

	<!-- </script> -->




	<form
		action="<c:url value="../_10_chart.controller/chart.controller"/>"
		method="get" name="form_name">
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
		</select> </select>
		<!--  類型 >> -->
		<input type="submit" name="prodaction" value="Choose">
		<td><span class="error">${error.currentprice_city}</span><img
			src="../img/ajax-loader.gif" style="display: none" /></td>

	</form>
	<!--     <select id="縣市2"> -->
	<!--     </select> -->
	<!--     <select id="鄉鎮市區2"> -->
	<!--     </select> -->
	<input type="button" onclick="show()" value="Show" />
	<input type="button" onclick="show1()" value="Show" />
	<input type="button" onclick="show2()" value="Show" />
	<input type="button" onclick="show3()" value="Show" />
	<input type="button" onclick="show4()" value="Show" />
	<br>
	<div id="columnchart_material" style="width: 450px; height: 350px;"></div>
	<br>
	<div id="chart_div" style="width: 450px; height: 300px;"></div>

</body>
</html>