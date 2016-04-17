<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	 <!-- including css & jQuery Dialog UI here-->
	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/ui-darkness/jquery-ui.css" rel="stylesheet">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/Happyhouse/js/dialog.js"></script>
<script type="text/javascript">
	$(window).load(function() {
		$('#slider').nivoSlider();
	});
	$(document).ready(function(){
	    $("#response").click(function(){
	        $("#form").slideToggle("slow");
	    });
	});
	
	
	
	/*站內*/
// 	  $(function() {
// 		    $( "#dialog1" ).dialog({
// 		      autoOpen: false,
// 		      show: {
// 		        effect: "blind",
// 		        duration: 1000
// 		      },
// 		      hide: {
// 		        effect: "explode",
// 		        duration: 1000
// 		      }
// 		    });
		 
// 		    $( "#opener" ).click(function() {
// 		      $( "#dialog1" ).dialog( "open" );
// 		    });
// 		  });
		  </script>
	
	
	
</script>






</head>
<body>

<div class="dialog" title="檢舉原因" id="reportform">
	          <form action="/Happyhouse/reportsellhouse.controller" method="post">
	            <label>您的帳號</label><br/>
				<input type="text" id="sellhouse_reportfrom" name="sellhouse_reportfrom" value="Tom123"><br/>
	            <label>文章編號</label><br/>
				<input type="text" id="sellhouse_id" name="sellhouse_id" value="100"><br/>	
				<label>說明原因</label><br/>
				<label>限制50字以內，目前字數:</label><div id="lblWordCountNow" style="font-size:larger;">0</div>
				<textarea rows="10" cols="40" name="reportreason" id="reportreason" ></textarea>
				<input type="submit" id="reportsubmit" value="Submit" />
			  </form>
		  </div>
<button class="buttonReport" value="${messageVO.message_id}">response</button>






</body>
</html>