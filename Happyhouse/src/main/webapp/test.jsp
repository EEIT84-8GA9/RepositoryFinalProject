<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>站內信首頁</title>
<link rel="stylesheet" href="css/sms_menu/dialog.css"/>
<link rel="stylesheet" type="text/css" href="css/sms_menu/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/sms_menu/default.css">
<link rel="stylesheet" href="css/sms_menu/style.css">
<style type="text/css">
#re{

    width: 30%;
    border: 1px solid #59b4d4;
    background: #0078a3;
    color: #eeeeee;
    padding: 3px 0px;
    border-radius: 5px;
    margin-left: 33%;
    cursor: pointer;

}
#writebutton{
 width: 30%;
    border: 1px solid #59b4d4;
    background: #0078a3;
    color: #eeeeee;
    padding: 3px 0px;
    border-radius: 5px;
/*     margin-left: 33%; */
    cursor: pointer;
}
</style>
<script type="text/javascript" src="/Happyhouse/js/jquery.min.js"></script>
 <!-- including css & jQuery Dialog UI here-->
	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/ui-darkness/jquery-ui.css" rel="stylesheet">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/Happyhouse/js/for_sms/dialog.js"></script>
	<script type="text/javascript">
		function toggle(source) {
		  checkboxes = document.getElementsByName('sms_id');
		  for(var i=0, n=checkboxes.length;i<n;i++) {
		    checkboxes[i].checked = source.checked;
		  }
		}
	</script>
</head>
<body>
	<article class="htmleaf-container">

	<form action="/Happyhouse/sms.controller" method="post">

		<table class="BH-table ML-tb1">
			<tbody>
				<div id="container">
					<h1>站內信箱</h1>
					<div class="title">
						&nbsp&nbsp&nbsp&nbsp<input type="checkbox" onClick="toggle(this)" />&nbsp全選
					</div>
						<ul class="faq">
							<c:forEach var="smsVO" items="${list}">
							<li class="q">
							<input name="sms_id" value="${smsVO.sms_id}" type="checkbox">
							Title&nbsp&nbsp<font size="4px" color="blue" >${smsVO.sms_title}</font><br><font size="2px">From:${smsVO.sms_mailers} Date:${smsVO.sms_date}</font>
							</li>
							<li class="a">${smsVO.sms_describe}<br><br><br><br><br>
							<button type="button"  id="re" class="re" value="${smsVO.sms_mailers}">回覆</button>
							</li>
							</c:forEach>
						</ul>
						<input type="submit" name="type" value="刪除信件" >
						<button type="button" class="re" value="" id="writebutton">寫信</button>
			</tbody>
		</table>
	</form>
	</article>
	<!-- for MessageForMe form-->
		<div class="dialog" title="站內信" id="MessageForMe">
	          <form action="/Happyhouse/sms.controller" method="post" class="sms">
	            <label>收信人</label><br/>
				<input type="text" id="user_account" name="user_account" value="" readonly="readonly"><br/>
	          	
	          	<label>標題</label><br/>
	          	<label>25字以內，目前字數:</label><div id="2blWordCountNow" style="font-size:larger;">0</div>
				<input type="text" id="sms_title" name="sms_title" ><br/>
				
				<label>訊息內容</label><br/>
				
				<textarea rows="8" cols="30" name="sms_describe" id="sms_describe" ></textarea>
				
				<input type="submit" id="messagesubmit" name="type"  value="送出" />
				
			  </form>
		 </div>
	<!-- end MessageForMe form -->
	<script src="js/for_sms/script.js"></script>
</body>
</html>