$(document).ready(function(){
	function TextArea1WordCount()
	{
	//允許輸入最大長度
	var intMaxLength = 50;
	//文字輸入//取得計算字數的物件塊
	TextArea1 = document.getElementById("reportreason");
	
	//取得計算字數的物件 
	lblWordCountNow = document.getElementById("lblWordCountNow");
	//將文字輸入方塊表度寫入顯示Label
	lblWordCountNow.innerHTML = TextArea1.value.length;

	//比對字數是否超過允許長度
	if (TextArea1.value.length > intMaxLength)
	{
		alert("字數超過50字，請修正!");
	  
	}

	//250毫秒後再執行一次此function
	setTimeout("TextArea1WordCount()", 250);

	}
	function TextArea1WordCount1()
	{
	//允許輸入最大長度
	var intMaxLength = 25;
	//文字輸入//取得計算字數的物件塊
	TextArea1 = document.getElementById("sms_title");
	
	//取得計算字數的物件 
	lblWordCountNow = document.getElementById("2blWordCountNow");
	//將文字輸入方塊表度寫入顯示Label
	lblWordCountNow.innerHTML = TextArea1.value.length;

	//比對字數是否超過允許長度
	if (TextArea1.value.length > intMaxLength)
	{
		alert("字數超過25字，請修正!");
	  
	}

	//250毫秒後再執行一次此function
	setTimeout("TextArea1WordCount1()", 250);

	}
	
	
//	 $("#reportreason").keydown(function(){
//	     TextArea1WordCount();
//	    });
	
	
	$(function() {
		$("#reportform").dialog({
			autoOpen: false,
			modal:true,
			 show: {
				 	direction:"down",
			        effect: "drop",
			        duration: 700
			      },
			      hide: {
			    	  direction:"down",
			          effect: "drop",
			          duration: 700
			        }
			
		});
		$(".buttonReport").on("click", function() {
			$("#reportform").dialog("open"),
			 $("#reportreason").keyup(function(){
			     TextArea1WordCount();
			    });
		});
	});
	$(".buttonReport").click(function() {
		var idnum = $(this).val();
		$('#idNumber').attr('value',idnum);
	});
	
	$(function() {
		$("#MessageForMe").dialog({
			autoOpen: false,
			modal:true,
			 show: {
				 	direction:"down",
			        effect: "drop",
			        duration: 700
			      },
			      hide: {
			    	  direction:"down",
			          effect: "drop",
			          duration: 700
			        }
		});
		$(".MessageButton").on("click", function() {
			$("#MessageForMe").dialog("open"),
			$("#sms_title").keyup(function(){
			     TextArea1WordCount1();
			    });
		});
	});
	$(".MessageButton").click(function() {
		var account = $(this).val();
		$('#user_account').attr('value',account);
		 
	});
	

	//validating Form Fields.....
	$("#reportsubmit").click(function(e){
	var  a= $("#reportreason").val();
	if(a ===''){
		alert("請說明原因...!!!!!!");
		e.preventDefault();
		}
	else 
	   {
         alert("填寫成功");
	   }

	});
	$("#messagesubmit").click(function(e){
		var  a= $("#sms_title").val();
		if(a ===''){
			alert("請填寫標題...!!!!!!");
			e.preventDefault();
			}
		else 
		   {
	         alert("訊息已送出");
		   }

		});
	
});

