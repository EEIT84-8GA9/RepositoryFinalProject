<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Insert title here</title>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    google.charts.load('current', {packages: ['corechart', 'line']});
    google.charts.setOnLoadCallback(drawBackgroundColor);

    function drawBackgroundColor() {
          var data = new google.visualization.DataTable();
          data.addColumn('string','X');
          data.addColumn('number', '平均價格');

          data.addRows([
                        <c:forEach var="hikari3" items="${LineLine}">
                        ['${hikari3.currentprice_tradedate}',${hikari3.avgoneprice_by_tradedate}],
                        </c:forEach>
          ]);

          var options = {
            hAxis: {
              title: 'YearMonth(民國月份)'
            },
            vAxis: {
              title: '平均坪價'
            },
            backgroundColor: '#f1f8e9'
          };

          var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
          chart.draw(data, options);
        }
    </script>
  
</head>
<body>
     <div id="chart_div" style="width: 900px; height: 500px;"></div>
</body>
</html>