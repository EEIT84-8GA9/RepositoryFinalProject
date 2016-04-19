<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/Happyhouse/css/jquery-confirm.css" />
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="http://libs.useso.com/js/bootstrap/3.2.0/css/bootstrap.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/Happyhouse/js/jquery-2.2.1.min.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery-confirm.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery.sticky.min.js"></script>
<title>Insert title here</title>

</head>
<body>
                                <button class="example2">example confirm</button>
                                
                               
                            <script type="text/javascript">

$('.example2').on('click', function () {
    $.confirm({
        title: 'Confirm!',
        content: 'Simple confirm!',
        confirm: function () {
            $.alert('Confirmed!');
        },
//         cancel: function () {
//             $.alert('Canceled!');
//         }
    });
});
</script>
</body>
</html>