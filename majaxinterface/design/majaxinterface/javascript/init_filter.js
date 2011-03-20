
$(document).ready(function() {
   //var mapid=$('#config_gmap p[title="mapid"]').text();
   //var popup_view=$('#config_gmap p[title="popup_view"]').text();
   var $filter_interface=$('#filter' );

   var keys=jQuery.parseJSON($('#filter_elements p[title="keys"]').text());
   var show_all=jQuery.parseJSON($('#filter_elements p[title="show_all"]').text());
   var view_parameters=jQuery.parseJSON($('#filter_elements p[title="view_parameters"]').text());
   var pagenavigator=$('#filter_elements p[title="navigator"]').text();
   var initial_view=$('#filter_elements p[title="initial_view"]').text();

   $filter_interface.contentfilter({
        keys:keys,
        pagenavigator:pagenavigator,
        show_all:show_all,
        view_parameters:view_parameters,
        initial_view:initial_view
   });

});

