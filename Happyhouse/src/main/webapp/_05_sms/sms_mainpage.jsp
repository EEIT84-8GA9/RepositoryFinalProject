<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>站內信-首頁</title>
<meta name="description" content="free website template" />
<meta name="keywords" content="enter your keywords here" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
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
<link rel="stylesheet" type="text/css" href="/Happyhouse/css/sms_menu/style2.css" />
<script type="text/javascript" src="/Happyhouse/js/jquery.min.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery.easing.min.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery.nivo.slider.pack.js"></script>
<link rel="stylesheet" href="/Happyhouse/css/sms_menu/dialog.css"/>
<link rel="stylesheet" type="text/css" href="/Happyhouse/css/sms_menu/normalize.css" />
<link rel="stylesheet" type="text/css" href="/Happyhouse/css/sms_menu/default.css">
<link rel="stylesheet" href="/Happyhouse/css/sms_menu/style.css">
<script type="text/javascript">
	$(window).load(function() {
		$('#slider').nivoSlider();
	});
	
	function toggle(source) {
		  checkboxes = document.getElementsByName('sms_id');
		  for(var i=0, n=checkboxes.length;i<n;i++) {
		    checkboxes[i].checked = source.checked;
		  }
		}
</script>
</head>
<script type="text/javascript" src="/Happyhouse/js/jquery.min.js"></script>
 <!-- including css & jQuery Dialog UI here-->
	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/ui-darkness/jquery-ui.css" rel="stylesheet">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/Happyhouse/js/for_sms/dialog.js"></script>
<body>
	<div id="main">
		<div id="site_content">
			<div id="site_heading">
				<h1>好宅房屋網</h1>
				<h2>你刊登房屋的超棒選擇</h2>
			</div>
			<!--close site_heading-->
			<div id="header">
				<div id="menubar">
					<ul id="menu">
						<li class="current"><a href="/Happyhouse/index.jsp">首頁</a></li>
						<li><a href="/Happyhouse/_02_sellhouse/SellHouseSearch.jsp">出售專區</a>
						<ul>
						<li><a href="#">搜尋出售</a></li>
                        <li><a href="#">刊登出售</a></li>
                        <li><a href="#">查詢出售收藏</a></li>
						</ul>
						</li>
						<li><a href="testimonials.html">刊登出租</a>
						<ul>
						<li><a href="#">搜尋出租</a></li>
                        <li><a href="#">刊登出租</a></li>
                        <li><a href="#">查詢出租收藏</a></li>
						</ul>
						</li>
						<li><a href="/Happyhouse/_09_furniture/product.jsp">二手家具</a>	
						<ul>
						<li><a href="/Happyhouse/_09_furniture/product.jsp">搜尋家具</a></li>	
						<li><a href="/Happyhouse/_09_furniture/product.jsp">刊登二手家具</a></li>	
						</ul>
						</li>
						<li><a href="/Happyhouse/addarticle.controller">討論區</a></li>										
						<c:if test="${empty LoginOK}">
						<li><a href="/Happyhouse/_01_users/login.jsp">會員登入</a></li>
						</c:if>
						<c:if test="${not empty LoginOK}">
						<li><a href="/Happyhouse/_08_news/Gmindex.jsp">管理者頁面</a></li>
						<li><a href="">個人管理頁面</a>
						<ul>
						<li><a href="/Happyhouse/sms.controller">修改個人密碼</a></li>
						<li><a href="/Happyhouse/sms.controller">個人站內信箱</a></li>
						<li></li>
						</ul>
						</li>
						<li><a href="/Happyhouse/_04_message/logout.jsp">登出</a></li>
						</c:if>
					</ul>
				</div>
				<!--close menubar-->
			</div>
			<c:if test="${not empty LoginOK}">
			<h1 align="center"><font color=blue>${LoginOK.user_name}你好</font></h1>
			</c:if>
			<!--close header-->
			
	<article class="htmleaf-container">
<font color="red">${error.deleteSms_idEmpty}</font>

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
				<input type="text" id="user_account" name="user_account" value="" ><br/>
	          	
	          	<label>標題</label><br/>
	          	<label>25字以內，目前字數:</label><div id="2blWordCountNow" style="font-size:larger;">0</div>
				<input type="text" id="sms_title" name="sms_title" ><br/>
				
				<label>訊息內容</label><br/>
				
				<textarea rows="8" cols="30" name="sms_describe" id="sms_describe" ></textarea>
				
				<input type="submit" id="messagesubmit" name="type"  value="送出" />
				
			  </form>
		 </div>
	<!-- end MessageForMe form -->
	<script src="/Happyhouse/js/for_sms/script.js"></script>

	</form>
		</div>
		<!--close site_content-->
		<div id="footer">
			<a href="http://validator.w3.org/check?uri=referer">好宅網，最專業、最豐富的新屋、預售屋展示平台
				|</a> <a href="http://validator.w3.org/check?uri=referer">好宅網有限公司
				版權所有 © 2015-2016 HappyHouse. All Rights Reserved. </a>
		</div>
		<!--close footer-->
	</div>
	<!--close main-->
</body>

</html>
