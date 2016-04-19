<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="../js/tabulator.js"></script>



<script type="text/javascript">
	//sample data to be used in all tabulators
	var tabledata = [<c:forEach var="row" items="${select}" varStatus="loop">
	{id:"${row.sellhouse_id}", name:"${row.user_account}", age:"12", gender:"male", height:1, col:"red", dob:"", cheese:1, lucky_no:5},
	</c:forEach>];
	</script>
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

<body>


<section>
	<header>Simple Table</header>
	<p>
		In its simplest form, all you need to set in the options are the column titles and field names.
	</p>
	<p>
		By default columns are resizable (using edge of column header) and sortable (as strings).
	</P>
	<div id="example-table-simple"></div>
	<script type="text/javascript">
	$("#example-table-simple").tabulator({
		height:"320px",
		columns:[
		{title:"Name", field:"name", width:200},
		{title:"Age", field:"age", width:60},
		{title:"Gender", field:"gender"},
		{title:"Height", field:"height", width:80},
		{title:"Favourite Color", field:"col"},
		{title:"Date Of Birth", field:"dob"},
		{title:"Likes Cheese", field:"cheese"},
		],
	});
	$("#example-table-simple").tabulator("setData", tabledata);
	$(window).resize(function(){
		$("#example-table-simple").tabulator("redraw");
	});
	</script>
</section>



</body>
</html>