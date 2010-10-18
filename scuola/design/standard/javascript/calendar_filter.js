/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
        $("input.calendar-filter").click(onSelectChange);
 });

function onSelectChange(){
          
     if ($(this).is(':checked')){
         $("div[title*='"+$(this).val()+"']").each(function (i){
         $(this).show();
     }
     );}else{
              $("div[title*='"+$(this).val()+"']").each(function (i){
         $(this).hide();
     }
     );
     }
 }