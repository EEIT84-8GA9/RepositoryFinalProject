<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/jquery-ui-1.11.4.custom/jquery-ui.min.css" />
<script type="text/javascript" src="/Happyhouse/js/jquery.min.js"></script>

<title>Insert title here</title>
<style type="text/css">

/* Styles for dialog window */
#small-dialog {
	background: white;
	padding: 20px 30px;
	text-align: left;
	max-width: 400px;
	margin: 40px auto;
	position: relative;
}


/**
 * Fade-zoom animation for first dialog
 */

/* start state */
.my-mfp-zoom-in .zoom-anim-dialog {
	opacity: 0;

	-webkit-transition: all 0.2s ease-in-out; 
	-moz-transition: all 0.2s ease-in-out; 
	-o-transition: all 0.2s ease-in-out; 
	transition: all 0.2s ease-in-out; 



	-webkit-transform: scale(0.8); 
	-moz-transform: scale(0.8); 
	-ms-transform: scale(0.8); 
	-o-transform: scale(0.8); 
	transform: scale(0.8); 
}

/* animate in */
.my-mfp-zoom-in.mfp-ready .zoom-anim-dialog {
	opacity: 1;

	-webkit-transform: scale(1); 
	-moz-transform: scale(1); 
	-ms-transform: scale(1); 
	-o-transform: scale(1); 
	transform: scale(1); 
}

/* animate out */
.my-mfp-zoom-in.mfp-removing .zoom-anim-dialog {
	-webkit-transform: scale(0.8); 
	-moz-transform: scale(0.8); 
	-ms-transform: scale(0.8); 
	-o-transform: scale(0.8); 
	transform: scale(0.8); 

	opacity: 0;
}

/* Dark overlay, start state */
.my-mfp-zoom-in.mfp-bg {
	opacity: 0;
	-webkit-transition: opacity 0.3s ease-out; 
	-moz-transition: opacity 0.3s ease-out; 
	-o-transition: opacity 0.3s ease-out; 
	transition: opacity 0.3s ease-out;
}
/* animate in */
.my-mfp-zoom-in.mfp-ready.mfp-bg {
	opacity: 0.8;
}
/* animate out */
.my-mfp-zoom-in.mfp-removing.mfp-bg {
	opacity: 0;
}



/**
 * Fade-move animation for second dialog
 */

/* at start */
.my-mfp-slide-bottom .zoom-anim-dialog {
	opacity: 0;
	-webkit-transition: all 0.2s ease-out;
	-moz-transition: all 0.2s ease-out;
	-o-transition: all 0.2s ease-out;
	transition: all 0.2s ease-out;

	-webkit-transform: translateY(-20px) perspective( 600px ) rotateX( 10deg );
	-moz-transform: translateY(-20px) perspective( 600px ) rotateX( 10deg );
	-ms-transform: translateY(-20px) perspective( 600px ) rotateX( 10deg );
	-o-transform: translateY(-20px) perspective( 600px ) rotateX( 10deg );
	transform: translateY(-20px) perspective( 600px ) rotateX( 10deg );

}

/* animate in */
.my-mfp-slide-bottom.mfp-ready .zoom-anim-dialog {
	opacity: 1;
	-webkit-transform: translateY(0) perspective( 600px ) rotateX( 0 ); 
	-moz-transform: translateY(0) perspective( 600px ) rotateX( 0 ); 
	-ms-transform: translateY(0) perspective( 600px ) rotateX( 0 ); 
	-o-transform: translateY(0) perspective( 600px ) rotateX( 0 ); 
	transform: translateY(0) perspective( 600px ) rotateX( 0 ); 
}

/* animate out */
.my-mfp-slide-bottom.mfp-removing .zoom-anim-dialog {
	opacity: 0;

	-webkit-transform: translateY(-10px) perspective( 600px ) rotateX( 10deg ); 
	-moz-transform: translateY(-10px) perspective( 600px ) rotateX( 10deg ); 
	-ms-transform: translateY(-10px) perspective( 600px ) rotateX( 10deg ); 
	-o-transform: translateY(-10px) perspective( 600px ) rotateX( 10deg ); 
	transform: translateY(-10px) perspective( 600px ) rotateX( 10deg ); 
}

/* Dark overlay, start state */
.my-mfp-slide-bottom.mfp-bg {
	opacity: 0;

	-webkit-transition: opacity 0.3s ease-out; 
	-moz-transition: opacity 0.3s ease-out; 
	-o-transition: opacity 0.3s ease-out; 
	transition: opacity 0.3s ease-out;
}
/* animate in */
.my-mfp-slide-bottom.mfp-ready.mfp-bg {
	opacity: 0.8;
}
/* animate out */
.my-mfp-slide-bottom.mfp-removing.mfp-bg {
	opacity: 0;
}
</style>
<script>
$(document).ready(function() {
	$('.popup-with-zoom-anim').magnificPopup({
		type: 'inline',

		fixedContentPos: false,
		fixedBgPos: true,

		overflowY: 'auto',

		closeBtnInside: true,
		preloader: false,
		
		midClick: true,
		removalDelay: 300,
		mainClass: 'my-mfp-zoom-in'
	});

	$('.popup-with-move-anim').magnificPopup({
		type: 'inline',

		fixedContentPos: false,
		fixedBgPos: true,

		overflowY: 'auto',

		closeBtnInside: true,
		preloader: false,
		
		midClick: true,
		removalDelay: 300,
		mainClass: 'my-mfp-slide-bottom'
	});
});
</script>
</head>

<body>

<a class="popup-with-zoom-anim" href="#small-dialog">Open with fade-zoom animation</a><br>
<a class="popup-with-move-anim" href="#small-dialog">Open with fade-slide animation</a>

<!-- dialog itself, mfp-hide class is required to make dialog hidden -->
<div id="small-dialog" class="zoom-anim-dialog mfp-hide">
	<h1>Dialog example</h1>
	<p>This is dummy copy. It is not meant to be read. It has been placed here solely to demonstrate the look and feel of finished, typeset text. Only for show. He who searches for meaning here will be sorely disappointed.</p>
</div>


</body>
</html>