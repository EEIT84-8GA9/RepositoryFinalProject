<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['area', 'price'],
          <c:forEach var="hikari" items="${Scatter}">
          [${hikari.currentprice_housearea},${hikari.currentprice_tprice}],
          
          </c:forEach>

        ]);

        var options = {
          title: 'area vs. price comparison',
          hAxis: {title: 'Area', minValue: 0, maxValue: 15},
          vAxis: {title: 'Price', minValue: 0, maxValue: 15},
          pointSize: 1,
          legend: 'none'
        };

        var chart = new google.visualization.ScatterChart(document.getElementById('chart_div'));

        chart.draw(data, options);
      
      }
    </script>
  </head>
  <body>
    
    <div id="chart_div" style="width: 1800px; height: 1000px;"></div>
  </body>
</html>
