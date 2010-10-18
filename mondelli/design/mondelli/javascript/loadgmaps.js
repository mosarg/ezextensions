$(document).ready(function() {
    var location=$('span#location').text();
    var blockid=$('span#blockid').text();
    var element_id="map-container-"+blockid;
    var mapContainer = document.getElementById(element_id);
    var $mapContainer=$('#'+element_id);
    var map = new GMap2(mapContainer);
    var geocoder = new GClientGeocoder();

    geocoder.getLatLng(location,function(point){
                if (point) {
                    map.setCenter(point, 13);
                    var marker = new GMarker(point);
                    map.addOverlay(marker);
                    marker.openInfoWindowHtml(location);
                }
            }
        );
  
});