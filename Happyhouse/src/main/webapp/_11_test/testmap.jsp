<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAFRq0_sxIvH_oCfO9n9pRVLqsfjSDET24&callback=initMap" async defer></script>
<script type="text/javascript" src="/Happyhouse/rinocss/jquery.tinyMap.js"></script>
<script type="text/javascript" src="/Happyhouse/rinocss/jquery.tinyMap.min.js"></script>
<script type="text/javascript" src="/Happyhouse/js/jquery.min.js"></script>
<script>
$(selector).tinyMap({
    // Map center
    'center': {
        'lat': 'Lat', 
        'lng': 'Lng'
    },
    // or 'center': 'lat, lng'
    // or 'center': [lat, lng]
    // or 'center': 'ADDRESS'
    // or 'center': 'N48°45.5952  E20°59.976' // WGS84 format
    'zoom': 14
});
</script>

<style>
#map {
    width: 'MAP WIDTH';
    height: 'MAP HEIGHT';
}

</style>




</head>
<body>

	
<div id="map"></div>
</body>
</html>