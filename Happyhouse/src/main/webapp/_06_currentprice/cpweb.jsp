<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<title>CurrentPriceWeb</title>

<script type="text/javascript" src="../js/json2.js"></script>
<script type="text/javascript" src="../js/product.js"></script>
<script type="text/javascript">
var path = "${pageContext.request.contextPath}";
function doBlur() {
	document.getElementsByTagName("img")[0].style.display =  "inline";
 	var url = path+"/pages/product.view";
	var id = document.getElementsByTagName("input")[0].value;
// 	sendGetRequest(url, id, "textText");
// 	sendPostRequest(url, id, "textXml");
// 	sendPostRequest(url, id, "textJson");
	sendPostRequestJSON(url, id);
}
function clearForm() {
	var inputs = document.getElementsByTagName("input");
	for(var i=0; i<inputs.length; i++) {
		if(inputs[i].type=="text") {
			inputs[i].value="";
		}
	}
	var spanElement = document.getElementsByTagName("span")[0];
	spanElement.removeChild(spanElement.firstChild);
}
</script>
</head>
<body>

<h3>Welcome ${user.email}</h3>
<h3>CP Table </h3>

<form action="<c:url value="/_10_chart.controller/chart.controller"/>" method="get">
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
		<td>currentprice_city(區域):[大安區 信義區 松山區..]</td>
		<td><input type="text" name="currentprice_city" value="${param.currentprice_city}" onblur="doBlur()" onfocus="clearForm()"></td>
		<td><span class="error">${error.currentprice_city}</span><img src="../img/ajax-loader.gif" style="display:none"/></td>
	</tr>
	<tr>
		<td>currentprice_bdtype(類別):[公寓 套房  透天 華廈 住宅大樓 店面 其它]</td>
		<td><input type="text" name="currentprice_bdtype" value="${param.currentprice_bdtype}"></td>
		<td></td>
	</tr>

	<tr>
		<td>currentprice_transes(樓層):[一層 二層 三層 地下..]</td>
		<td><input type="text" name="currentprice_transes" value="${param.currentprice_transes}"></td>
		<td><span class="error">${error.currentprice_transes}</span></td>
	</tr>
	<tr>
		<td>currentprice_housearea(總坪數):</td>
		<td><input type="text" name="currentprice_housearea" value="${param.currentprice_housearea}"></td>
		<td><span class="error">${error.currentprice_housearea}</span></td>
	</tr>
	<tr>
		<td>currentprice_tprice(總價格):</td>
		<td><input type="text" name="currentprice_tprice" value="${param.currentprice_tprice}"></td>
		<td><span class="error">${error.currentprice_tprice}</span></td>
	</tr>
	<tr>
		<td>
			<input type="submit" name="prodaction" value="Scatter">
			<input type="submit" name="prodaction" value="Pie">
			<input type="submit" name="prodaction" value="none">
			<input type="submit" name="prodaction" value="Select">
			<input type="button" value="Clear" onclick="clearForm()">
		</td>
	</tr>
</table>


</form>
<h3><span class="error">${error.action}</span></h3>



<!-- 此區為 Chart導向 form -->
<form action="<c:url value="/_10_chart.controller/chart.controller"/>" method="get">

<!-- 以各區分別     currentprice_city -->
<!-- 以類別區分     currentprice_bdtype  -->
<!-- 賣的樓層       currentprice_transes   -->
<!-- 總坪數         currentprice_housearea -->
<!-- 總價元         currentprice_tprice -->

<table>
	<tr>
		<td>currentprice_city(區域):[大安區 信義區 松山區..]</td>
		<td><input type="text" name="currentprice_city" value="${param.currentprice_city}" onblur="doBlur()" onfocus="clearForm()"></td>
		<td><span class="error">${error.currentprice_city}</span><img src="../img/ajax-loader.gif" style="display:none"/></td>
	</tr>
	<tr>
		<td>currentprice_bdtype(類別):[公寓 套房  透天 華廈 住宅大樓 店面 其它]</td>
		<td><input type="text" name="currentprice_bdtype" value="${param.currentprice_bdtype}"></td>
		<td></td>
	</tr>

	<tr>
		<td>currentprice_transes(樓層):[一層 二層 三層 地下..]</td>
		<td><input type="text" name="currentprice_transes" value="${param.currentprice_transes}"></td>
		<td><span class="error">${error.currentprice_transes}</span></td>
	</tr>
	<tr>
		<td>currentprice_housearea(總坪數):</td>
		<td><input type="text" name="currentprice_housearea" value="${param.currentprice_housearea}"></td>
		<td><span class="error">${error.currentprice_housearea}</span></td>
	</tr>
	<tr>
		<td>currentprice_tprice(總價格):</td>
		<td><input type="text" name="currentprice_tprice" value="${param.currentprice_tprice}"></td>
		<td><span class="error">${error.currentprice_tprice}</span></td>
	</tr>
    <tr>
		<td>
			<input type="submit" name="prodaction" value="Scatter">
			<input type="submit" name="prodaction" value="Pie">
		   	<input type="submit" name="prodaction" value="Column">
			<input type="submit" name="prodaction" value="Line">
			<input type="submit" name="prodaction" value="LineLine">
			<input type="submit" name="prodaction" value="Scattermine">
			<input type="button" value="Clear" onclick="clearForm()">
		</td>
	</tr>
</table>


</form>






</body>
</html>