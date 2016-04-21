
<!doctype html>
<html lang="zh">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



	<link rel="stylesheet" type="text/css" href="/Happyhouse/rinocss/normalize.css" />
	<link rel="stylesheet" type="text/css" href="/Happyhouse/rinocss/default.css">
	<link rel="stylesheet" type="text/css" href="/Happyhouse/rinocss/search-form.css">
	
	<!--[if IE]>
		<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
</head>
<body>
	
	<section class="htmleaf-container">
		<form onsubmit="submitFn(this, event);">
            <div class="search-wrapper">
                <div class="input-holder">
                    <input type="text" class="search-input" placeholder="Type to search" />
                    <button class="search-icon" onclick="searchToggle(this, event);"><span></span></button>
                </div>
                <span class="close" onclick="searchToggle(this, event);"></span>
                <div class="result-container">

                </div>
            </div>
        </form>
	</section>
	
	<script src="http://libs.useso.com/js/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>
	<script type="text/javascript">
        function searchToggle(obj, evt){
            var container = $(obj).closest('.search-wrapper');

            if(!container.hasClass('active')){
                  container.addClass('active');
                  evt.preventDefault();
            }
            else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
                  container.removeClass('active');
                  // clear input
                  container.find('.search-input').val('');
                  // clear and hide result container when we press close
                  container.find('.result-container').fadeOut(100, function(){$(this).empty();});
            }
        }

        function submitFn(obj, evt){
            value = $(obj).find('.search-input').val().trim();

            _html = "Yup yup! Your search text sounds like this: ";
            if(!value.length){
                _html = "Yup yup! Add some text friend :D";
            }
            else{
                _html += "<b>" + value + "</b>";
            }

            $(obj).find('.result-container').html('<span>' + _html + '</span>');
            $(obj).find('.result-container').fadeIn(100);

            evt.preventDefault();
        }
    </script>
</body>
</html>