<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/Happyhouse/css/style.css" />	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">              
<script type="text/javascript" src="/Happyhouse/js/jquery-2.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/Happyhouse/css/for_GMmessage/bootstrap-table-expandable.css">
<script src="/Happyhouse/js/for_GMmessage/bootstrap-table-expandable.js"></script>
<script type="text/javascript">
</script>
<title>討論區管理者頁面</title>
</head>
<body>
<div id="main">
		<div id="site_content">
			<div id="site_heading">
				<h1>好宅房屋網</h1>
			</div>
			<!--close site_heading-->
			<div id="header">
				<div id="menubar">
					<ul id="menu">
						<li class="current"><a href="/Happyhouse/index.jsp">首頁</a></li>
						<li><a href="/Happyhouse/_08_news/Gmindex.jsp">管理者頁面</a></li>
						<li><a href="/Happyhouse/_02_sellhouse/SellHouseSearch.jsp">檢舉管理</a>
						<ul>
						<li><a href="#">出售區檢舉</a></li>
                        <li><a href="#">出租區檢舉</a></li>
                        <li><a href="/Happyhouse/GMmessage.controller">留言板檢舉</a></li>
                        <li><a href="#">信件檢舉</a></li>                        
                        <li><a href="#">封鎖會員</a></li>                   
						</ul>
						</li>
						<li><a href="/Happyhouse/_08_news/test.jsp">首頁更新</a></li>									
						<c:if test="${empty LoginOK}">
						<li><a href="/Happyhouse/_01_users/login.jsp">會員登入</a></li>
						</c:if>
						<c:if test="${not empty LoginOK}">
						<li><a href="/Happyhouse/_04_message/logout.jsp">登出</a></li>
						</c:if>
					</ul>
				</div>
				<!--close menubar-->
			</div>
			<!--close header-->
			<c:if test="${not empty LoginOK}">
			<h1 align="center"><font color=blue>${LoginOK.user_name}你好</font></h1>
			</c:if>

<h3 align="center">檢舉名單</h3>
<div class="container">
<form action="<c:url value="/GMmessage.controller" />" method="POST">

			<table class="table table-hover table-expandable">
                <thead>
                    <tr>
                        <th>編號</th>
                        <th>會員名稱</th>
                        <th>討論區主題</th>
	                    <th>狀態處理</th>
                    </tr>
                </thead>
                <c:forEach var="row" items="${list}">
				<c:if test="${row.message_type=='B'}">
				<tbody>
					<tr>
						<td>${row.message_id}</td>
						<td>${row.user_account}</td>
						<td>${row.message_title}</td>
						<td>狀態改為<input  type="radio" name="message_type" value="A">正常
							<input  type="radio" name="message_type" value="C">違規
							<button type="submit" name="id" value="${row.message_id}"  onClick="confirmChoice()">更新</button>
						</td>
					</tr>
					<tr>
						<td colspan="5">
							<h4>檢舉人</h4>
							<ul>
								<li>${row.message_reportfrom}</li>
							</ul>
							<h4>檢舉原因</h4>
							<ul>
								<li>${row.message_reportreason}</li>
							</ul>
							<h4>被檢舉內容</h4>
							<ul>
								<li>${row.message_describe}</li>
							
							</ul>   
						</td>
					</tr>
				</tbody>
				</c:if>
            </c:forEach>
            </table>
            </form>

		</div>
		<!--close container-->
		
		<div id="footer">
			<a href="http://validator.w3.org/check?uri=referer">好宅網，最專業、最豐富的新屋、預售屋展示平台 |</a>
			<a href="http://validator.w3.org/check?uri=referer">好宅網有限公司 版權所有 © 2015-2016 HappyHouse. All Rights Reserved. </a>
		</div>
		<!--close footer-->
		</div>
		<!--close site_content-->
	</div>
	<!--close main-->
	</body>	
</html>
