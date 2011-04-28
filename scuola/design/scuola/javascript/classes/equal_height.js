(function($){
    $.fn.removeTempContent = function(){
    var tallest_title=0;
    var tallest_description=0;
    var tallest_image=0;
    $('.content-view-full').find('.content-view-children').each(
        
       function(){
        var descrition_height=$(this).find('.attribute-short').outerHeight(true);
        var title_height=$(this).find('.line-header-common').outerHeight(true);
        var image_height=$(this).find('.attribute-image').outerHeight(true);
        if(descrition_height>tallest_description){
            tallest_description=descrition_height;
        }
      
        if(title_height>tallest_title){
            tallest_title=title_height;
        }  
         if(image_height>tallest_image){
            tallest_image=image_height;
        }  
        
    });
      $('.content-view-full').find('.content-view-children >.content-view-line>div').each(function(){
          $(this).children('.line-header-common').height(tallest_title);
          $(this).children('.attribute-image').height(tallest_image);
          $(this).children('.attribute-short').height(tallest_description);
        }); 
      };
})(jQuery)



$(document).ready(function(){
rescale_elements();}
);


