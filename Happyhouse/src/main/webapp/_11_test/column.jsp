<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['區域','辦公大樓','住宅大樓', '公寓(5樓以下)','套房','店面','其它','透天厝','華廈(10樓以下)'],
          
          ['"${param.currentprice_city}"',
           <c:forEach var="hikari2" items="${get_chart_data.data_result3}">
           ${hikari2.avgoneprice_by_city_type},       
          </c:forEach>],
          
          
        ]);
        //上面的 items關鍵!!!  因為值是由 filter匯入~ 所以由get_chart_data.data_result3
        //去找 圖檔所在的預設資料~EX column圖為 方法3 line圖 & lineline圖為 方法4 
        //辦公大樓 住宅大樓 公寓(5樓以下)  套房  店面 倉庫 其它 透天厝 華廈(10樓以下)
        var options = {
          chart: {
            title: '房屋類型  Performance',
            subtitle: 'Sales, Expenses, and Profit: XXXXXXXX',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, options);
      }
    </script>
</head>
<body>
	<table border=1 cellspacing=1 cellpadding=5>
		<tr>
			<td colspan=2>動態二階下拉選單 - 以<郵遞區號>為例</td>
		</tr>
		<tr>
			<td align=right>縣市</td>
			<td><select name=type size=1>
					<option value=0>臺北市</option>
					<option value="1">基隆市</option>
					<option value="2">臺北縣</option>
					<option value="3">宜蘭縣</option>

			</select></td>
		</tr>
		<tr>
			<td align=right>區域</td>
			<td>'辦公大樓','住宅大樓', '公寓(5樓以下)','套房','店面','其它','透天厝','華廈(10樓以下)' <select
				name=type size=1>
					<option value=0>套房</option>
					<option value="1">辦公大樓</option>
					<option value="2">住宅大樓</option>
					<option value="3">公寓(5樓以下)</option>
					<option value="4">店面</option>
					<option value="5">透天厝</option>
					<option value="6">華廈(10樓以下)</option>
					<option value="7">其它</option>
					

			</select>
			</td>
		</tr>
	</table>



	<div id="columnchart_material" style="width: 900px; height: 500px;"></div>
</body>
</html>