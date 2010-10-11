function eZGmapLocation_MapView( attributeId, latitude, longitude )
{
    var startPoint=null;
    var options = {
        zoom: 0,
        startPoint: null,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
       if( latitude && longitude )
             startPoint = new google.maps.LatLng( latitude, longitude ), options.zoom = 13;
        else
             startPoint = new google.maps.LatLng( 0, 0 ), options.zoom = 0;
        
        options.startPoint=startPoint;

        var map = new google.maps.Map( document.getElementById( 'ezgml-map-' + attributeId ),options );
        
        map.setCenter( startPoint);
       
        new google.maps.Marker({
                position:startPoint,
                map:map,
                icon: 'http://google-maps-icons.googlecode.com/files/factory.png'
            });
          
}

