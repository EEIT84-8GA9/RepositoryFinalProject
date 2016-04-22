<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['type', 'percentage'],
          <c:forEach var="hikari5" items="${Pie1}">
          ['${hikari5.currentprice_bdtype}',${hikari5.count_by_city_type}],
          </c:forEach>
        ]);

        
        
        
          var options = {
          title: '區域 VS 房屋類型',
          pieHole: 0.4,
          is3D: true,
        };
          alert("圓餅1圖"+[
                        ['type', 'percentage'],
                        <c:forEach var="hikari5" items="${Pie1}">
                        ['${hikari5.currentprice_bdtype}',${hikari5.count_by_city_type}],
                        </c:forEach>
                      ]);
        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
    </script>
    
 <script type="text/javascript">
      google.charts.load("current2", {packages:["corechart2"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Area', 'percentage'],
          <c:forEach var="hikari6" items="${Pie2}">
          ['${hikari6.housearea_range}',${hikari6.housearea_count}],
          </c:forEach>
        ]);

        var options = {
          title: '區域 VS 平均坪數 [ex:10=10~20坪]',
          is3D: true,
        };
        alert("圓餅2圖"+[
                      ['Area', 'percentage'],
                      <c:forEach var="hikari6" items="${Pie2}">
                      ['${hikari6.housearea_range}',${hikari6.housearea_count}],
                      </c:forEach>
                    ]);
        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>
     
    
    <script type="text/javascript">
      google.charts.load("current3", {packages:["corechart3"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          <c:forEach var="hikari7" items="${Pie3}">  
          ['${hikari7.currentprice_transes}',${hikari7.transes_count}],
          </c:forEach>
       
        ]);

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

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="donutchart" style="width: 900px; height: 500px;"></div>
    <div id="piechart_3d" style="width: 900px; height: 500px;"></div>
    <BR>
    <div id="piechart" style="width: 900px; height: 500px;"></div>
  </body>
</html>