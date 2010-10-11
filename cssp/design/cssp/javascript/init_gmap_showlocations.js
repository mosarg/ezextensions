
$(document).ready(function() {
   var mapid=$('#config_gmap p[title="mapid"]').text();
   var popup_view=$('#config_gmap p[title="popup_view"]').text();
   var $map=$('#'+ mapid);

   var locations=jQuery.parseJSON($('#config_gmap p[title="locations"]').text());
   

   $map.gmapLocations({
        locations:locations,
        mapid:mapid,
        icon:'http://google-maps-icons.googlecode.com/files/school.png',
        popup_view:popup_view
   });

});
