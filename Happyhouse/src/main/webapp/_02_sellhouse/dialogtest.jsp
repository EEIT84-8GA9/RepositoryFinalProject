<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 檢舉彈跳視窗 -->
<script type="text/javascript" src="/Happyhouse/js/dialog.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
 <script src="//code.jquery.com/jquery-1.10.2.js"></script>
 <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
 <link rel="stylesheet" href="/resources/demos/style.css">
 <!-- 檢舉彈跳視窗 -->
<title>Insert title here</title>
<!-- 檢舉按鍵事件 -->
<script type="text/javascript">
$(function() {
    $( "#dialog" ).dialog({
      autoOpen: false,
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }
    });
 
    $( "#opener" ).click(function() {
      $( "#dialog" ).dialog( "open" );
    });
  });
  $("#reportsubmit").
  
  

  
  
  
</script>
<!-- 檢舉視窗 -->
 <form action="<c:url value="/house/sellhousereport.controller"/>" method="post">
 <input type="hidden" id="submit" name="submit">
 <div id="dialog" title="檢舉原因">
  <label>您的帳號</label><br/>
 <input type="text" id="urName" name="urName" value="${LoginOK.user_account}" readonly="readonly"><br/>
 <label>文章編號</label><br/>
				<input type="text" id="idNumber" name="idNumber" value="" readonly="readonly"><br/>
	          	<label>檢舉刊登主題</label><br/>
				<input type="text" id="title" name="title"readonly="readonly"><br/>	
				<label>說明原因</label><br/>
				<label>限制50字以內，目前字數:</label><div style="font-size:larger;">0</div>
				<textarea rows="10" cols="23" name="reportreason" ></textarea>
				<input type="submit" id="reportsubmit" value="Submit" name="555"/>
				</div>
 </form>

 <!-- 檢舉視窗 -->

   
 
<button id="opener">Open Dialog</button>

</body>
</html>