/*
---------------------------
-Click on the Button Join !-
---------------------------
*/


var t = 0;

function join_1(){
if(t == 0){  document.querySelectorAll('.cont_letras > p')[0].style.left = '300px';
  document.querySelectorAll('.cont_letras > p')[1].style.left = '-320px'; 
setTimeout(function(){
  document.querySelector('.cont_join').className = 'cont_join cont_join_form_act';
},1000);    
t++;
          }else{
t++;            
document.querySelector('.cont_form_join').style.bottom = '-420px';
            
           
setTimeout(function(){               
	document.querySelector('.cont_join').className = 'cont_join cont_join_form_act cont_join_finish';
	document.getElementById("myForm").submit();
	 
	
    }
   ,500);  
 
alertify.success('UPDATE SUCCESS!!! ready return to index!');  
//alertify.alert("UPDATE SUCCESS!!! ready return to index!");

     }         
} 