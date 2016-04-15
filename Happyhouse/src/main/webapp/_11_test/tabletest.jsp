<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="../js/tabulator.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
        <!-- 加載Ajax -->
 
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
 
        <!-- Ajax的測試Script -->
 
         <script>
 
             //在網頁加載後，對id=doAjaxBtn的Button設定click的function
 
            $(document).ready(function(){
 
               $("#doAjaxBtn").click(function(){
 
                   $.ajax({
 
                        type:"POST",                    //指定http參數傳輸格式為POST
 
                        url: "/Happyhouse/doAjaxServlet.do",        //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
 
                        data: $("#formId").serialize(), //要傳給目標的data為id=formId的Form其序列化(serialize)為的值，之
 
                                                        //內含有name的物件value
 
                        dataType: "json",               //目標url處理完後回傳的值之type，此列為一個JSON Object
 
                        //Ajax成功後執行的function，response為回傳的值
 
                        //此範列回傳的JSON Object的內容格式如右所示: {userName:XXX,uswerInterest:[y1,y2,y3,...]}
 
                        success : function(response){
 
                            //在id=ajaxResponse的fieldset中顯示Ajax的回傳值
 
                            $("#ajaxResponse").html("您的大名:"+response.userName+"</br>");
 
                            $("#ajaxResponse").append("您的興趣:</br>");
 
                            var userInterestString = "";
 
                            for(var i = 0 ; i<response.userInterest.length ; i++){
 
                                $("#ajaxResponse").append(response.userInterest[i]+"</br>");
 
                                userInterestString += "\n"+response.userInterest[i];
 
                            }
 
                            //用彈出視窗顯示Ajax的回傳值
 
                            alert("UserName:"+response.userName+"\nInterest: "+userInterestString);
 
                        },
 
                        //Ajax失敗後要執行的function，此例為印出錯誤訊息
 
                        error:function(xhr, ajaxOptions, thrownError){
 
                            alert(xhr.status+"\n"+thrownError);
                        }
 
                    });
 
               });
 
            });  
 
        </script>
 
    </head>
 
    <body>
 
        <div>AjaxTest</div>
 
        <form id="formId">
 
            大名:<input type="text" name="userName">
 
            <input type="checkbox" name="userInterest" value="看書" />看書
 
            <input type="checkbox" name="userInterest" value="遊戲" />遊戲
 
            <input type="checkbox" name="userInterest" value="電影" />電影
 
            <input type="button" id="doAjaxBtn" value="啟動Ajax" />           
 
        </form>
 
        <div id="anotherSection">
 
            <!-- 用來顯示Ajax回傳值的fieldset -->
 
         <fieldset>
 
             <legend>Response from jQuery Ajax Request</legend>
 
             <div id="ajaxResponse"></div>
 
         </fieldset>
 
        </div> 
 
    </body>  
 
</html>