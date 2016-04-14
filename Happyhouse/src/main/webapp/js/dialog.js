$(document).ready(function(){
	
	$(function() {
		$("#reportform").dialog({
			autoOpen: false,
			
			 show: {
				 	direction:"up",
			        effect: "drop",
			        duration: 700
			      },
			      hide: {
			    	  direction:"up",
			          effect: "drop",
			          duration: 700
			        }
			
		});
		$(".buttonReport").on("click", function() {
			$("#reportform").dialog("open");
			 
		});
	});
	$(".buttonReport").click(function() {
		var idnum = $(this).val();
		$('#idNumber').attr('value',idnum);
	});
	
	$(function() {
		$("#MessageForMe").dialog({
			autoOpen: false,
			 show: {
				 	direction:"up",
			        effect: "drop",
			        duration: 700
			      },
			      hide: {
			    	  direction:"up",
			          effect: "drop",
			          duration: 700
			        }
		});
		$(".MessageButton").on("click", function() {
			$("#MessageForMe").dialog("open");
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

