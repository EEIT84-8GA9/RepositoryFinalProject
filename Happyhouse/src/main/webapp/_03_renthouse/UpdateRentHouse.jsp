<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 	<meta charset="UTF-8"> -->
<!-- 	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
<!-- 	<meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
	<title>刊登房屋資料填寫</title>
<link rel='stylesheet prefetch' href='/Happyhouse/css/Insert/reset.css'>
<link rel="stylesheet" type="text/css" href="/Happyhouse/css/Insert/default.css">
<link rel="stylesheet" type="text/css" href="/Happyhouse/css/Insert/styles.css">


 </head> 
 <body>
 


<form  enctype="multipart/form-data" action="<c:url value="/house/house3.controller"/>" method="post" id="msform">
	<article class="htmleaf-content">  
		<!-- multistep form -->
			<!-- progressbar -->
			<ul id="progressbar">
				<li class="active">填寫資料</li>
				<li>填寫資料</li>
				<li>上傳圖片</li>
			</ul>
			<!-- fieldsets -->
			<fieldset>	
				<h2 class="fs-title">刊登您的房屋</h2>
				<h3 class="fs-subtitle">請填寫詳細資料</h3>
				<input type="text" name="user_account" placeholder="請輸入使用者帳號" value="${param.user_account}" />
				<input type="hidden" style="${style.renthouse_name}" name="renthouse_id" placeholder="請輸入標題" value="${param.renthouse_id}" />
				<input type="text" style="${style.renthouse_name}" name="renthouse_name" placeholder="請輸入標題" value="${param.renthouse_name}" />
				<input type="text" style="${style.renthouse_address}" name="renthouse_address" placeholder="請輸入地址" value="${param.renthouse_address}"/>
				<input type="text" style="${style.renthouse_price}" name="renthouse_price" placeholder="請輸入租金，必須是數字且不得為0" value="${param.renthouse_price}" />
				<input type="text" style="${style.renthouse_deposit}" name="renthouse_deposit" placeholder="請輸入押金，必須是數字且不得為0" value="${param.renthouse_deposit}" />
				<input type="text" style="${style.renthouse_patterns}" name="renthouse_patterns" placeholder="請輸入格局" value="${param.renthouse_patterns}" />
				<input type="text" style="${style.renthouse_size}" name="renthouse_size" placeholder="請輸入坪數，必須是數字且不得為0" value="${param.renthouse_size}"/>
				<input type="text" style="${style.renthouse_floor}" name="renthouse_floor" placeholder="請輸入樓層" value="${param.renthouse_floor}" />
				<input type="button"  name="next" class="next action-button" value="Next" />
			</fieldset>
			<fieldset>
				<h2 class="fs-title">刊登您的房屋</h2>
				<h3 class="fs-subtitle">請填寫詳細資料</h3>
				<input type="text" style="${style.renthouse_rentdate}" name="renthouse_rentdate" placeholder="請填寫最短租期" value="${param.renthouse_rentdate}" />
				<input type="text" style="${style.renthouse_car}" name="renthouse_car" placeholder="請填寫有無車位" value="${param.renthouse_car}" />
				<input type="text" style="${style.renthouse_phone}" name="renthouse_phone" placeholder="請填寫連絡電話" value="${param.renthouse_phone}" />
				<input type="text" style="${style.renthouse_email}" name="renthouse_email" placeholder="請填寫連絡EMAIL" value="${param.renthouse_email}" />	
<!-- 				<input type="text" name="renthouse_type" placeholder="請填寫連絡EMAIL" />	 -->
				<textarea name="renthouse_describe" style="${style.renthouse_describe}"  placeholder="請填寫額外描述" >${param.renthouse_describe}</textarea>
				<input type="button" name="previous" class="previous action-button" value="Previous" />
				<input type="button" name="next" class="next action-button" value="Next" />
			</fieldset>
			<fieldset>
				<h2 class="fs-title">刊登您的房屋</h2>
				<h3 class="fs-subtitle">請上傳三張圖片</h3>
				<input type="file" name="renthouse_photo1">
				<input type="file" name="renthouse_photo2">
				<input type="file" name="renthouse_photo3">
				<input type="button" name="previous" class="previous action-button" value="Previous" />
				<input type="submit" name="prodaction" class="submit action-button" value="修改" />
			</fieldset>
	</article>
	</form>

	
	
	
	
	<script src="//libs.useso.com/js/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>
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
// 	$('.submit').click(function () {
// 	    return false;
// 	});

	</script>
</body>
</html>