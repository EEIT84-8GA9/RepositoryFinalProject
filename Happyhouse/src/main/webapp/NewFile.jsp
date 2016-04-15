<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet prefetch' href='/Happyhouse/css/Insert/reset.css'>
	<link rel="stylesheet" type="text/css" href="/Happyhouse/css/Insert/default.css">
	<link rel="stylesheet" type="text/css" href="/Happyhouse/css/Insert/styles.css">
<title>Insert title here</title>
</head>
<body>
<form enctype="multipart/form-data" action="house/house1.controller"  method="post">
<input type="submit" name="prodaction" class="submit action-button" value="新增" />
</form>
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
// 	$('.submit').click(function () {
// 	    return false;
// 	});
	</script>
</body>
</html>