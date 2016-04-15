<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>分步式用户注册表单UI界面设计|DEMO_jQuery之家-自由分享jQuery、html5、css3的插件库</title>
	<link rel='stylesheet prefetch' href='/Happyhouse/css/Insert/reset.css'>
	<link rel="stylesheet" type="text/css" href="/Happyhouse/css/Insert/default.css">
	<link rel="stylesheet" type="text/css" href="/Happyhouse/css/Insert/styles.css">
	<!--[if IE]>
		<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
</head>
<body>
<!-- 	<header class="htmleaf-header"> -->
<!-- 		<h1>分步式用户注册表单UI界面设计 <span>A Step By Step User Register Form </span></h1> -->
<!-- 		<div class="htmleaf-links"> -->
<!-- 			<a class="htmleaf-icon icon-htmleaf-home-outline" href="http://www.htmleaf.com/" title="jQuery之家" target="_blank"><span> jQuery之家</span></a> -->
<!-- 			<a class="htmleaf-icon icon-htmleaf-arrow-forward-outline" href="http://www.htmleaf.com/css3/ui-design/201509062532.html" title="返回下载页" target="_blank"><span> 返回下载页</span></a> -->
<!-- 		</div> -->
<!-- 	</header> -->
	<article class="htmleaf-content">
		<!-- multistep form -->
		<form id="msform" enctype="multipart/form-data" action="<c:url value="/house/house1.controller"/> "method="post">
			<!-- progressbar -->
			<ul id="progressbar">
				<li class="active">账号设置</li>
				<li>社交账号</li>
				<li>个人详细信息</li>
			</ul>
			<!-- fieldsets -->
			<fieldset>
				<h2 class="fs-title">刊登您的房屋</h2>
				<h3 class="fs-subtitle">第一步</h3>
				<input type="text" name="sellhouse_name" placeholder="標題" />
				<input type="password" name="pass" placeholder="密码" />
				<input type="password" name="cpass" placeholder="重复密码" />
				<input type="button" name="next" class="next action-button" value="Next" />
			</fieldset>
			<fieldset>
				<h2 class="fs-title">填写社交账号</h2>
				<h3 class="fs-subtitle">填写你的常用社交网络账号</h3>
				<input type="text" name="x-weibo" placeholder="新浪微博" />
				<input type="text" name="t-weibo" placeholder="腾讯微博" />
				<input type="text" name="qq" placeholder="腾讯QQ" />
				<input type="button" name="previous" class="previous action-button" value="Previous" />
				<input type="button" name="next" class="next action-button" value="Next" />
			</fieldset>
			<fieldset>
				<h2 class="fs-title">个人详细信息</h2>
				<h3 class="fs-subtitle">个人详细信息是保密的，不会被泄露</h3>
				<input type="text" name="fname" placeholder="昵称" />
				<input type="text" name="lname" placeholder="姓名" />
				<input type="text" name="phone" placeholder="电话号码" />
				<textarea name="address" placeholder="家庭住址"></textarea>
				<input type="button" name="previous" class="previous action-button" value="Previous" />
				<input type="submit" name="submit" class="submit action-button" value="Submit" />
			</fieldset>
		</form>
	</article>
	
	<script src="http://libs.useso.com/js/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>
	<script>window.jQuery || document.write('<script src="/Happyhouse/js/test/jquery-2.1.1.min.js"><\/script>')</script>
	<script src="/Happyhouse/js/test/jquery.easing.min.js" type="text/javascript"></script>
	<script>
	var current_fs, next_fs, previous_fs;
	var left, opacity, scale;
	var animating;
	$('.next').click(function () {
	    if (animating)
	        return false;
	    animating = true;
	    current_fs = $(this).parent();
	    next_fs = $(this).parent().next();
	    $('#progressbar li').eq($('fieldset').index(next_fs)).addClass('active');
	    next_fs.show();
	    current_fs.animate({ opacity: 0 }, {
	        step: function (now, mx) {
	            scale = 1 - (1 - now) * 0.2;
	            left = now * 50 + '%';
	            opacity = 1 - now;
	            current_fs.css({ 'transform': 'scale(' + scale + ')' });
	            next_fs.css({
	                'left': left,
	                'opacity': opacity
	            });
	        },
	        duration: 800,
	        complete: function () {
	            current_fs.hide();
	            animating = false;
	        },
	        easing: 'easeInOutBack'
	    });
	});
	$('.previous').click(function () {
	    if (animating)
	        return false;
	    animating = true;
	    current_fs = $(this).parent();
	    previous_fs = $(this).parent().prev();
	    $('#progressbar li').eq($('fieldset').index(current_fs)).removeClass('active');
	    previous_fs.show();
	    current_fs.animate({ opacity: 0 }, {
	        step: function (now, mx) {
	            scale = 0.8 + (1 - now) * 0.2;
	            left = (1 - now) * 50 + '%';
	            opacity = 1 - now;
	            current_fs.css({ 'left': left });
	            previous_fs.css({
	                'transform': 'scale(' + scale + ')',
	                'opacity': opacity
	            });
	        },
	        duration: 800,
	        complete: function () {
	            current_fs.hide();
	            animating = false;
	        },
	        easing: 'easeInOutBack'
	    });
	});
	$('.submit').click(function () {
	    return false;
	});
	</script>
</body>
</html>