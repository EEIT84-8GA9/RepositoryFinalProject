<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>


<script>
$(document).ready(function(){
    $("#city,#types").change(function(){
    	  var URLs="/ChartPageServlet.do";
          
          $.ajax({
              url: URLs,
              data: $('#sentToBack').serialize(),
              type:"GET",
              dataType:'text',

              success: function(msg){
                  alert(msg);
              },

               error:function(xhr, ajaxOptions, thrownError){ 
                  alert(xhr.status); 
                  alert(thrownError); 
               }
          });
          
      }
</script>	







<!-- <script> -->
<!--  $(document).ready(function(){ -->
<!--      $("#city,#types").change(function(){ -->
<!--         alert("The text has been changed."); -->
<!--   $('#selecttable').submit(); -->
<!--      }); -->
<!--  }); -->
<!-- </script>	 -->






</head>
<body>




<form action="" method="get" id="selecttable">

<table border=1 cellspacing=1 cellpadding=5>
		<tr>
			<td colspan=2>動態二階下拉選單 - 以<郵遞區號>為例</td>
		</tr>
		<tr>
			<td align=right>縣市</td>
			<td><select id="city" name=city size=1>
					<option value=0>臺北市</option>
					<option value="1">基隆市</option>
					<option value="2">臺北縣</option>
					<option value="3">宜蘭縣</option>

			</select></td>
		</tr>
		<tr>
			<td align=right>區域</td>
			<td>'辦公大樓','住宅大樓', '公寓(5樓以下)','套房','店面','其它','透天厝','華廈(10樓以下)' <select
				name=type size=1 id="types">
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
	
</form>








</body>
</html>
