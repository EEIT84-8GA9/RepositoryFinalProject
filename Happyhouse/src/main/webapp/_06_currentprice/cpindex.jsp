<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CurrentPrice Page</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="../js/tabulator.js"></script>

<body>
<style type="text/css">
	body{
		padding:20px 40px;
		font-family: 'Montserrat', sans-serif !important;
	}
	.tabulator{
	}
	header{
		font-weight: bold;
		font-size: 30px;
	}
	header span{
		vertical-align: middle;
		font-size: .5em;
		color: #999;
	}
	header span a{
		font-size: .9em;
	}
	section:first-of-type header{
		font-size: 50px;
	}
	section{
		margin-bottom:30px;
	}
	ul>li{
		margin-bottom:2px;
	}
	button, select{
		margin-right:20px;
	}
	input{
		font-family: 'Montserrat', sans-serif !important;
	}
	</style>
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
<h3>CP Table </h3>

<section>
	<header>Simple Table</header>

<div id="currentprice_table"></div>
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
		fitColumns:true,
		columns:[
		{title:"Id", field:"id", width:40},
		{title:"建物地址", field:"address", width:320},
		{title:"建物類型", field:"bdtype", width:220},
		{title:"筆棟數", field:"trades", width:130},
		{title:"樓層", field:"transes", width:130},
		{title:"房", field:"rooms"},
		{title:"廳", field:"livinroom"},
		{title:"衛", field:"toilet"},
		{title:"建物完成年月", field:"enddate"},
		{title:"交易完成年月", field:"tradedate"},
		{title:"總坪數", field:"housearea", width:130},
		{title:"一坪價格", field:"oneprice", width:130},
		
		
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
	alert(JSON.stringify(tabledata));
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







<form action="<c:url value="/_06_currentprice.controller/cpweb.controller"/>" method="get">
<!-- 以各區分別     currentprice_city -->
<!-- 以類別區分     currentprice_bdtype  -->
<!-- 賣的樓層       currentprice_transes   -->
<!-- 總坪數         currentprice_housearea -->
<!-- 總價元         currentprice_tprice -->
<table>

<!--用"currentprice_city"  將 value="${param.currentprice_city}" 輸入的值  放到Servlet中   -->
<!-- String currentprice_city = request.getParameter("currentprice_city"); -->
<!-- 再轉換成字串使用 -->
	<tr>
		<td>currentprice_address(區域)時價查詢:請輸入..[EX:台北市大安區安和路一段]</td>
		<td><input type="text" name="currentprice_address" value="${param.currentprice_address}" onblur="doBlur()" onfocus="clearForm()"></td>
		<td><span class="error">${error.currentprice_address}</span><img src="../images/ajax-loader.gif" style="display:none"/></td>
	</tr>
	
	<tr>
		<td>
			<input type="submit" name="prodaction" value="Pick">
			<input type="button" value="Clear" onclick="clearForm()">
		</td>
        <td>
        <h3><span class="error">${error.action}</span></h3>	
	    </td>
	
	</tr>
</table>
</form>
<BR>


<!-- <link rel="stylesheet" type="text/css" href="../css/table.css" /> -->


<h3>Select CurrentPrice Table Result : XXX row(s) selected</h3>

<c:if test="${not empty Pick}">
<table>
	<thead>
<!-- currentprice address,currentprice_bdtype, currentprice_trades , currentprice_transes,currentprice_rooms,currentprice_livinroom,currentprice_toilet, -->
<!-- currentprice_enddate,currentprice_tradedate,currentprice_housearea,currentprice_oneprice -->
	<tr>
		<th>建物地址</th>
		<th>建物類型</th>
		<th>筆棟數</th>
		<th>樓層</th>
		<th>房</th>
		<th>廳</th>
		<th>衛</th>
		<th>建物完成年月</th>
		<th>交易完成年月</th>
		<th>總坪數</th>
		<th>一坪價格</th>
		
	</tr>
	</thead>
	
	<tbody>
	<c:forEach var="row" items="${Pick}">

	<tr>
	    <td>${row.currentprice_address}</td>
		<td>${row.currentprice_bdtype}</td>
		<td>${row.currentprice_trades}</td>
		<td>${row.currentprice_transes}</td>
		<td>${row.currentprice_rooms}</td>
		<td>${row.currentprice_livinroom}</td>
		<td>${row.currentprice_toilet}</td>
		<td>${row.currentprice_enddate}</td>
		<td>${row.currentprice_tradedate}</td>
		<td>${row.currentprice_housearea}</td>
		<td>${row.currentprice_oneprice}</td>
	</tr>
	</c:forEach>
	</tbody>
</table>
</c:if>

<h3><a href="<c:url value="/index.jsp" />">index</a></h3>
</body>
</html>
