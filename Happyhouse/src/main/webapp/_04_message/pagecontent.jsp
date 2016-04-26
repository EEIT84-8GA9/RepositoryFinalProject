<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>好宅網-討論區</title>
<meta name="description" content="free website template" />
<meta name="keywords" content="enter your keywords here" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
 <!-- including css file here-->
    
<style type="text/css">
.content_box {
	border: 1px solid #d9d9d9
}

.content {
	background-color: #edf1f2;
	height: 100%
}

.content {
	background: 0 0;
	padding-top: 10px;
	font-size: 15px;
	float: left
}

.leftSideBar {
	float: left;
	width: 150px;
	padding-top: 18px
}

.leftSideBar td {
	height: 23px;
	line-height: 23px;
	font-size: 12px;
	color: #4d4d4d
}

.rightSideBar {
	float: left;
	width: 700px;
	padding: 18px 10px 0;
	border-left: 1px solid #c5c5c5;
	background-color: #FFF
}

.content_floor {
	color: #676666;
	border-bottom: 1px dashed #CCC;
	padding: 3px 0;
	font-size: 12px
}

.content_detail {
	padding: 40px 0;
	color: #333;
	min-height: 130px;
	_height: 130px;
	font-size: 15px;
	word-wrap: break-word;
	line-height: 1.8em
}
.form{
	float: left;
	width: 700px;
	padding: 18px 10px 0;
	border-left: 1px solid #c5c5c5;
	background-color: #FFF
}
#form{
	display:none;

}
#response{
	margin:18px
}
</style>
<link rel="stylesheet" type="text/css" href="/Happyhouse/css/style.css" />
<link rel="stylesheet" href="/Happyhouse/css/dialog.css"/>
<script type="text/javascript" src="/Happyhouse/js/jquery.min.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery.easing.min.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery.nivo.slider.pack.js"></script>
	 <!-- including css & jQuery Dialog UI here-->
	<link href="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/ui-darkness/jquery-ui.css" rel="stylesheet">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
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
</script>
</head>

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
						<li><a href="/Happyhouse/_02_sellhouse/SellHouseSearch.jsp">搜尋出售</a></li>
                        <li><a href="http://localhost:8080/Happyhouse/_02_sellhouse/InsertSellHouse.jsp">刊登出售</a></li>
						</ul>
						</li>
						<li><a href="">出租專區</a>
						<ul>
						<li><a href="/Happyhouse/_03_renthouse/RentHouseSearch.jsp">搜尋出租</a></li>
                        <li><a href="/Happyhouse/_03_renthouse/InsertRentHouse.jsp">刊登出租</a></li>
						</ul>
						</li>
						<li><a href="">時價查詢</a>
						<ul>
						<li><a href="/Happyhouse/_06_currentprice/cpindex.jsp">售屋時價查詢</a></li>
                        <li><a href="/Happyhouse/_06_currentprice/cpindex.jsp">出租時價查句</a></li>
                        </ul>
						</li>
						<li><a href="/Happyhouse/_09_furniture/product.jsp">二手家具</a>
						<ul>
					    <li><a href="/Happyhouse/_09_furniture/product.jsp">搜尋家具</a></li>	
						<li><a href="/Happyhouse/_09_furniture/insertProduct.jsp">刊登二手家具</a></li>	
						<li><a href="/Happyhouse/pages/product.controller?furniture_id=&prodaction=查詢刊登家具">查詢所有刊登家具</a></li>	
						</ul>	
						<c:if test="${not empty LoginOK}">	
						<ul>
					    <li><a href="/Happyhouse/_09_furniture/product.jsp">搜尋家具</a></li>	
						<li><a href="/Happyhouse/_09_furniture/insertProduct.jsp">刊登二手家具</a></li>	
						<li><a href="/Happyhouse/pages/product.controller?furniture_id=&prodaction=查詢所有刊登家具">查詢所有刊登家具</a></li>	
						<li><a href="/Happyhouse/pages/product.controller?user_account=${LoginOK.user_account}&prodaction=查詢您的刊登家具">查詢您刊登的家具</a></li>
						
						</ul>
					    </c:if>
						</li>
						<li><a href="/Happyhouse/addarticle.controller">討論區</a></li>										
						<c:if test="${empty LoginOK}">
						<li><a href="/Happyhouse/_01_users/login.jsp">會員登入</a></li>
						</c:if>
						<c:if test="${not empty LoginOK}">
						<li><a href="">${LoginOK.user_name}個人專區</a>
						<ul>
<!-- 					<li><a href="/Happyhouse/sms.controller">修改個人密碼</a></li> -->
						<li><a href="_01_users/chasgePw.jsp">修改個人密碼</a></li>
						<li><a href="/Happyhouse/sms.controller">個人站內信箱</a></li>
						<li><a href="/Happyhouse/sellhousecart.controller">個人出售收藏</a></li>
						<li><a href="/Happyhouse/renthousecart.controller">個人出售收藏</a></li>
						<li><a href="/Happyhouse/_02_sellhouse/SellHouseUser.jsp">賣屋管理</a></li>
						<li><a href="/Happyhouse/_03_renthouse/RentHouseUser.jsp">租屋管理</a></li>
						<c:if test="${LoginOK.user_type=='B'||LoginOK.user_type=='C'}">
						<li><a href="/Happyhouse/_08_news/Gmindex.jsp">管理者頁面</a></li>
						</c:if>
						<li></li>
						</ul>
						</li>
						<li><a href="/Happyhouse/_01_users/logout.jsp">登出</a></li>
						</c:if>
					</ul>
					
                    </div>
				<!--close menubar-->
			</div>
			


			
			<div id="content">
				<div class="content_item">
					<h1>歡迎您來到好宅房屋網</h1>

				</div>
				<!--close content_item-->

				<div class="content_text">
					<p></p>
				</div>
				<!--close content_text-->

				<div class="content_text_left">

					<b><font color=red></font></b>
	<table border='1' cellpadding='5' cellspacing='0' width='880'>

		<tr bgcolor='' align='center' valign='middle' height='20'>
			<td>
				<h3>討論區</h3> 
				<br> <a href="/Happyhouse/addarticle.controller">回討論區首頁</a>
			</td>
		</tr>

	</table>
<h2><font color="blue">${param.message_title}
				</font>
				<font color="blue">${add.message_title}</font>
				<font color="blue">${resp.message_title}</font>
				<font color="blue">${resperror.message_title}</font>
				<font color="blue">${report.message_title}</font></h2>
	<div class="content_box">

			<!-- 1 -->
			<c:forEach var="messageVO" items="${list}">
			<c:if test="${messageVO.message_title==param.message_title && messageVO.message_type!='C'}">
				<div class="content">
					<div class="leftSideBar">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>

									<td colspan="2" align="center"><img
										src="/Happyhouse/images/head-image.png"
										width="80" height="80"></td>
								</tr>
								<tr>
									<td colspan="2" align="center" style="font-weight: 100"><font color="blue">${messageVO.user_account}</font></td>
								</tr>
								<c:if test="${messageVO.user_account!=LoginOK.user_account}">
								<tr>
									<td colspan="2" align="center" style="font-weight: 100"><button class="MessageButton" value="${messageVO.user_account}">站內信給我</button></td>
								</tr>
								</c:if>
							</tbody>
						</table>
					</div>
					
						<div class="rightSideBar" style="position: relative">

							<div class="blog-wonder-sign"></div>
							<div class="content_floor" style="height: 20px">
								<ul>
									<li style="float: left;"><font class="orange">${messageVO.user_account}</font>&nbsp;&nbsp;發表於${messageVO.message_date}</li>
<%-- 									<li style="float: right;">檢舉編號<button class="buttonReport">${messageVO.message_id}</button></li> --%>
								<c:if test="${messageVO.user_account!=LoginOK.user_account}">
										<li style="float: right;">編號${messageVO.message_id}<button class="buttonReport" value="${messageVO.message_id}">我要檢舉</button></li>
								</c:if>
								<c:if test="${messageVO.user_account==LoginOK.user_account}">
										<li style="float: right;">編號${messageVO.message_id}</li>
								</c:if>
								</ul>
							</div>
							<div class="content_detail">
								<div class="font_15">${messageVO.message_describe}</div>
							</div>
						</div>
						<img src="/Happyhouse/images/green.jpg"
							width="948" height="3" style="float: left;">
					
				</div>
			</c:if>
			</c:forEach>
			<!-- 1 End -->
			
			<!-- resp -->
			<c:forEach var="messageVO" items="${list}">
			<c:if test="${messageVO.message_title==resp.message_title && messageVO.message_type!='C'}">
				<div class="content">
					<div class="leftSideBar">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>

									<td colspan="2" align="center"><img
										src="/Happyhouse/images/head-image.png"
										width="80" height="80"></td>
								</tr>
								<tr>
									<td colspan="2" align="center" style="font-weight: 100"><font color="blue">${messageVO.user_account}</font></td>
								</tr>
								<c:if test="${messageVO.user_account!=LoginOK.user_account}">
								<tr>
									<td colspan="2" align="center" style="font-weight: 100"><button class="MessageButton" value="${messageVO.user_account}">站內信給我</button></td>
								</tr>
								</c:if>
							</tbody>
						</table>
					</div>
					
						<div class="rightSideBar" style="position: relative">

							<div class="blog-wonder-sign"></div>
							<div class="content_floor" style="height: 20px">
								<ul>
									<li style="float: left;"><font class="orange">${messageVO.user_account}</font>&nbsp;&nbsp;發表於${messageVO.message_date}</li>
									<c:if test="${messageVO.user_account!=LoginOK.user_account}">
										<li style="float: right;">編號${messageVO.message_id}<button class="buttonReport" value="${messageVO.message_id}">我要檢舉</button></li>
								</c:if>
								<c:if test="${messageVO.user_account==LoginOK.user_account}">
										<li style="float: right;">編號${messageVO.message_id}</li>
								</c:if>
								</ul>
							</div>
							<div class="content_detail">
								<div class="font_15">${messageVO.message_describe}</div>
							</div>
						</div>
						<img src="/Happyhouse/images/green.jpg"
							width="948" height="3" style="float: left;">
					
				</div>
			</c:if>
			</c:forEach>
			<c:if test="${not empty resp}">
				<div class="content">
					<div class="leftSideBar">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>

									<td colspan="2" align="center"><img
										src="/Happyhouse/images/head-image.png"
										width="80" height="80"></td>
								</tr>
								<tr>
									<td colspan="2" align="center" style="font-weight: 100"><font color="blue">${resp.user_account}</font></td>
								</tr>
								<tr>
									<td colspan="2" align="center" style="font-weight: 100"><button class="MessageButton" value="${resp.user_account}">站內信給我</button></td>
								</tr>
							</tbody>
						</table>
					</div>
					
						<div class="rightSideBar" style="position: relative">

							<div class="blog-wonder-sign"></div>
							<div class="content_floor" style="height: 20px">
								<ul>
									<li style="float: left;"><font class="orange">${resp.user_account}</font>&nbsp;&nbsp;發表於${resp.message_date}</li>
								</ul>
							</div>
							<div class="content_detail">
								<div class="font_15">${resp.message_describe}</div>
							</div>
						</div>
						<img src="/Happyhouse/images/green.jpg"
							width="948" height="3" style="float: left;">
					
				</div>
			</c:if>
	<!-- resp end -->
	<!-- add -->
			
			<c:if test="${not empty add}">
				<div class="content">
					<div class="leftSideBar">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>

									<td colspan="2" align="center"><img
										src="/Happyhouse/images/head-image.png"
										width="80" height="80"></td>
								</tr>
								<tr>
									<td colspan="2" align="center" style="font-weight: 100"><font color="blue">${add.user_account}</font></td>
								</tr>
								<c:if test="${messageVO.user_account!=LoginOK.user_account}">
								<tr>
									<td colspan="2" align="center" style="font-weight: 100"><button class="MessageButton" value="${add.user_account}">站內信給我</button></td>
								</tr>
								</c:if>
							</tbody>
						</table>
					</div>
					
						<div class="rightSideBar" style="position: relative">

							<div class="blog-wonder-sign"></div>
							<div class="content_floor" style="height: 20px">
								<ul>
									<li style="float: left;"><font class="orange">${add.user_account}</font>&nbsp;&nbsp;發表於${add.message_date}</li>
								</ul>
							</div>
							<div class="content_detail">
								<div class="font_15">${add.message_describe}</div>
							</div>
						</div>
						<img src="/Happyhouse/images/green.jpg"
							width="948" height="3" style="float: left;">
					
				</div>
			</c:if>
	<!-- add end -->
	<c:forEach var="messageVO" items="${list}">
	
	<c:if test="${resperror.message_title==messageVO.message_title && messageVO.message_type!='C'}">
				<div class="content">
					<div class="leftSideBar">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>

									<td colspan="2" align="center"><img
										src="/Happyhouse/images/head-image.png"
										width="80" height="80"></td>
								</tr>
								<tr>
									<td colspan="2" align="center" style="font-weight: 100" ><font color="blue">${messageVO.user_account}</font></td>
								</tr>
								<tr>
									<td colspan="2" align="center" style="font-weight: 100"><button class="MessageButton" value="${messageVO.user_account}">站內信給我</button></td>
								</tr>
							</tbody>
						</table>
					</div>
					<c:if test="${resperror.message_title==messageVO.message_title}">
						<jsp:useBean id ="add" class="_04_message.model.MessageVO" scope="page">
							<jsp:setProperty name="add" property="message_title" value="${resperror.message_title}" />
						</jsp:useBean>
						<div class="rightSideBar" style="position: relative">

							<div class="blog-wonder-sign"></div>
							<div class="content_floor" style="height: 20px">
								<ul>
									<li style="float: left;"><font class="orange">${messageVO.user_account}</font>&nbsp;&nbsp;發表於${messageVO.message_date}</li>
								<c:if test="${messageVO.user_account!=LoginOK.user_account}">
										<li style="float: right;">編號${messageVO.message_id}<button class="buttonReport" value="${messageVO.message_id}">我要檢舉</button></li>
								</c:if>
								<c:if test="${messageVO.user_account==LoginOK.user_account}">
										<li style="float: right;">編號${messageVO.message_id}</li>
								</c:if>
								</ul>
							</div>
							<div class="content_detail">
								<div class="font_15">${messageVO.message_describe}</div>
							</div>
						</div>
						<img src="/Happyhouse/images/green.jpg"
							width="948" height="3" style="float: left;">
					</c:if>
				</div>
			</c:if>
				</c:forEach>
	<!-- report start -->
	<c:forEach var="messageVO" items="${list}">
	
	<c:if test="${report.message_title==messageVO.message_title && messageVO.message_type!='C'}">
				<div class="content">
					<div class="leftSideBar">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>

									<td colspan="2" align="center"><img
										src="/Happyhouse/images/head-image.png"
										width="80" height="80"></td>
								</tr>
								<tr>
									<td colspan="2" align="center" style="font-weight: 100" ><font color="blue">${messageVO.user_account}</font></td>
								</tr>
								<tr>
									<td colspan="2" align="center" style="font-weight: 100"><button class="MessageButton" value="${messageVO.user_account}">站內信給我</button></td>
								</tr>
							</tbody>
						</table>
					</div>
					<c:if test="${report.message_title==messageVO.message_title}">
						<jsp:useBean id ="resp" class="_04_message.model.MessageVO" scope="page">
							<jsp:setProperty name="resp" property="message_title" value="${report.message_title}" />
						</jsp:useBean>
						<div class="rightSideBar" style="position: relative">

							<div class="blog-wonder-sign"></div>
							<div class="content_floor" style="height: 20px">
								<ul>
									<li style="float: left;"><font class="orange">${messageVO.user_account}</font>&nbsp;&nbsp;發表於${messageVO.message_date}</li>
								<c:if test="${messageVO.user_account!=LoginOK.user_account}">
										<li style="float: right;">編號${messageVO.message_id}<button class="buttonReport" value="${messageVO.message_id}">我要檢舉</button></li>
								</c:if>
								<c:if test="${messageVO.user_account==LoginOK.user_account}">
										<li style="float: right;">編號${messageVO.message_id}</li>
								</c:if>
								</ul>
							</div>
							<div class="content_detail">
								<div class="font_15">${messageVO.message_describe}</div>
							</div>
						</div>
						<img src="/Happyhouse/images/green.jpg"
							width="948" height="3" style="float: left;">
					</c:if>
				</div>
			</c:if>
				</c:forEach>
	<!-- report end -->
	</div>
	
	<!-- for reportReason form-->
		<div class="dialog" title="檢舉原因" id="reportform">
	          <form action="/Happyhouse/reportcontroller.controller" method="post">
	            <label>您的帳號</label><br/>
				<input type="text" id="urName" name="urName" value="${LoginOK.user_account}" readonly="readonly"><br/>

	            <label>文章編號</label><br/>
				<input type="text" id="idNumber" name="idNumber" value="" readonly="readonly"><br/>
	          	
	          	<label>檢舉文章主題</label><br/>
				<input type="text" id="title" name="title" value="${param.message_title}${add.message_title}${resp.message_title}" readonly="readonly"><br/>
				
				
				<label>說明原因</label><br/>
				<label>限制50字以內，目前字數:</label><div id="lblWordCountNow" style="font-size:larger;">0</div>
				<textarea rows="10" cols="40" name="reportreason" id="reportreason" ></textarea>
				<input type="submit" id="reportsubmit" value="Submit" />
				
			  </form>
		  </div>
	<!-- end reportReason form -->
	<!-- for MessageForMe form-->
		<div class="dialog" title="站內信" id="MessageForMe">
	          <form action="/Happyhouse/sms.controller" method="post">
	            <label>收信人</label><br/>
				<input type="text" id="user_account" name="user_account" value="" readonly="readonly"><br/>
	          	
	          	<label>標題</label><br/>
	          	<label>25字以內，目前字數:</label><div id="2blWordCountNow" style="font-size:larger;">0</div>
				<input type="text" id="sms_title" name="sms_title"><br/>
				
				<label>訊息內容</label><br/>
				
				<textarea rows="10" cols="40" name="sms_describe" id="sms_describe" ></textarea>
				
				<input type="submit" id="messagesubmit" name="type"  value="傳送" />
				<c:if test="${not empty param}">
				<input type="hidden" name="title" value="${param.message_title}">
				</c:if>
				<c:if test="${not empty report}">	
					<input type="hidden" name="title" value="<jsp:getProperty name='resp' property='message_title'/>">
				</c:if>
				
					<input type="hidden" name="title" value="${resperror.message_title}">
				
			  </form>
		  </div>
	<!-- end MessageForMe form -->
	<button id="response"><h4>我要回文:</h4></button><h4><font color="red">${error.contentEmpty}</font></h4>
	<div id="form">
	<form action="<c:url value="/addarticle.controller" />" method="post" id="respform">
	
		<table >
			<tr >
				<td ><textarea name="content" wrap="physical"
						style="width: 650px; height: 120px;" WRAP="physical">${param.content}</textarea></td>
			</tr>
			<tr>
				<td align='right'><input type="submit" name="type" value="回覆">
				<c:if test="${not empty add}">				
					<input type="hidden" name="title" value="${add.message_title}">
				</c:if>
				<c:if test="${not empty resp}">				
					<input type="hidden" name="title" value="${resp.message_title}">
				</c:if>
				<c:if test="${not empty param}">	
					<input type="hidden" name="title" value="${param.message_title}">						
				</c:if>
				<c:if test="${not empty resperror}">	
					<input type="hidden" name="title" value="<jsp:getProperty name='add' property='message_title'/>">
				</c:if>
				<c:if test="${not empty report}">	
					<input type="hidden" name="title" value="<jsp:getProperty name='resp' property='message_title'/>">
				</c:if>
				</td>
			</tr>
		</table>
</form>
</div>
				</div>
				<!--close content_text-->

			</div>
			<!--close content-->

			

		</div>
		<!--close site_content-->
	<div id="menu">
			<a href="http://validator.w3.org/check?uri=referer">好宅網有限公司 版權所有 © 2015-2016 HappyHouse. All Rights Reserved. </a>
		</div>
		<!--close footer-->
	</div>
	<!--close main-->
	<script type="text/javascript">
	$('#respform').submit(function() {
    var c = confirm("Click OK to continue?");
    
    return c; 
});
	</script>
</body>
</html>
