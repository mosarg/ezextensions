
$(document).ready(function(){
    
  hideUnused();  
    
});

function hideUnused(){
    var current_school=$('#edit_elements p[title="current_school"]').text();
    
    $('.school-id').each(function(){
      if( !$(this).hasClass(current_school)){
          $(this).hide();
      }else{
          $(this).children('span.name').hide();
      }
    });
  
    
  
}