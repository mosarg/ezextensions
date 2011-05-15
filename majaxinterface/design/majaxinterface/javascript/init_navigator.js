
$(document).ready(function() {
   //var mapid=$('#config_gmap p[title="mapid"]').text();
   var node_id=$('#navigator_elements p[title="node_id"]').text();
   var box_type=$('#navigator_elements p[title="box_type"]').text();
   var view_type=$('#navigator_elements p[title="view_type"]').text();
   var $navigator_interface=$('div.pagenavigator' );
   var formats=jQuery.parseJSON($('#page_elements p[title="formats"]').text());
 
   //var keys=jQuery.parseJSON($('#filter_elements p[title="keys"]').text());
   

   $navigator_interface.pagenavigator({
       node_id:node_id,
       box_type:box_type,
       view_type:view_type,
       formats:formats
       });

});


