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

<div>
<a href="/Happyhouse/index.jsp" title="回首頁"><img src="/Happyhouse/img/MB__home.png" width="50px"></a>
</div>
 </head> 
 <body>
<form  enctype="multipart/form-data" action="<c:url value="/house/house1.controller"/>" method="post" id="msform">
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
				<input type="hidden" name="user_account" placeholder="請輸入使用者帳號" value="${LoginOK.user_account}" />
				<input type="text" style="${style.sellhouse_name}" name="sellhouse_name" placeholder="請輸入標題" value="${right.sellhouse_name}興隆路四段精緻豪宅附車位" />
				<input type="text" style="${style.sellhouse_address}" name="sellhouse_address" placeholder="請輸入地址" value="${right.sellhouse_address}台北市文山區興隆路四段29巷"/>
				<input type="text" style="${style.sellhouse_price}" name="sellhouse_price" placeholder="請輸入售價，必須是數字單位為萬" value="${right.sellhouse_price}2100" />
				<input type="text" style="${style.sellhouse_patterns}" name="sellhouse_patterns" placeholder="請輸入格局" value="${right.sellhouse_patterns}店面/4房兩廳" />
				<input type="text" style="${style.sellhouse_size}" name="sellhouse_size" placeholder="請輸入坪數，必須是數字" value="${right.sellhouse_size}50"/>
				<input type="text" style="${style.sellhouse_floor}" name="sellhouse_floor" placeholder="請輸入樓層" value="${right.sellhouse_floor}5F" />
				<input type="button"  name="next" class="next action-button" value="Next" />
			</fieldset>
			<fieldset>
				<h2 class="fs-title">刊登您的房屋</h2>
				<h3 class="fs-subtitle">請填寫詳細資料</h3>
				<input type="text" style="${style.sellhouse_age}" name="sellhouse_age" placeholder="請填寫屋齡，必須是數字" value="${right.sellhouse_age}2" />
				<input type="text" style="${style.sellhouse_car}" name="sellhouse_car" placeholder="請填寫有無車位" value="${right.sellhouse_car}有車位" />
				<input type="text" style="${style.sellhouse_phone}" name="sellhouse_phone" placeholder="請填寫連絡電話" value="${right.sellhouse_phone}0987654321" />
				<input type="text" style="${style.sellhouse_email}" name="sellhouse_email" placeholder="請填寫連絡EMAIL" value="${right.sellhouse_email}Tom123@gmail.com" />	
				<textarea name="sellhouse_describe" style="${style.sellhouse_describe}"  placeholder="請填寫額外描述" >${right.sellhouse_describe}管理費:2000元</textarea>
				<input type="button" name="previous" class="previous action-button" value="Previous" />
				<input type="button" name="next" class="next action-button" value="Next" />
			</fieldset>
			<fieldset>
				<h2 class="fs-title">刊登您的房屋</h2>
				<h3 class="fs-subtitle">請上傳三張圖片</h3>
				<input type="file" name="sellhouse_photo1">
				<input type="file" name="sellhouse_photo2">
				<input type="file" name="sellhouse_photo3">
				<input type="button" name="previous" class="previous action-button" value="Previous" />
				<input type="submit" name="prodaction" class="submit action-button" value="新增" />
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