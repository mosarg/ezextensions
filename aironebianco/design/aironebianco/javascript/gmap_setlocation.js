function eZGmapLocation_MapControl( attributeId, latLongAttributeBase )
{
    var mapid = 'ezgml-map-' + attributeId, latid  = 'ezcoa-' + latLongAttributeBase + '_latitude', longid = 'ezcoa-' + latLongAttributeBase + '_longitude';
    var geocoder = null, addressid = 'ezgml-address-' + attributeId;


    var showAddress = function()
    {
        
        var address = document.getElementById( addressid ).value;
        
        if ( geocoder )
        {
            geocoder.geocode( {
                'address':address
            }, function(result,status )

            {
                var point=result.pop();
                ;
                if ( !point )
                {
                    alert( address + " not found" );
                }
                else
                {
                    map.setCenter(point.geometry.location);
                    map.setZoom(13);
                    marker.setMap(null);
                    marker=new google.maps.Marker({
                        position:point.geometry.location,
                        map:map,
                        icon: 'http://google-maps-icons.googlecode.com/files/factory.png'
                    });


                    updateLatLngFields( point.geometry.location );
                }
            });
        }
    };
    var updateLatLngFields = function( point )
    {
        document.getElementById(latid).value = point.lat();
        document.getElementById(longid).value = point.lng();
        document.getElementById( 'ezgml-restore-button-' + attributeId ).disabled = false;
        document.getElementById( 'ezgml-restore-button-' + attributeId ).className = 'button';
    };
    var restoretLatLngFields = function()
    {
        document.getElementById( latid ).value     = document.getElementById('ezgml_hidden_latitude_' + attributeId ).value;
        document.getElementById( longid ).value    = document.getElementById('ezgml_hidden_longitude_' + attributeId ).value;
        document.getElementById( addressid ).value = document.getElementById('ezgml_hidden_address_' + attributeId ).value;
        if ( document.getElementById( latid ).value && document.getElementById( latid ).value != 0 )
        {
            var point = new google.maps.LatLng( document.getElementById( latid ).value, document.getElementById( longid ).value );
            map.setCenter(point);
            map.setZoom(13);
           
            marker.setMap(null);
            marker=new google.maps.Marker({
                position:point,
                map:map,
                icon: 'http://google-maps-icons.googlecode.com/files/factory.png'
            });

            map.panTo( point );
        }
        document.getElementById( 'ezgml-restore-button-' + attributeId ).disabled = true;
        document.getElementById( 'ezgml-restore-button-' + attributeId ).className = 'button-disabled';
        return false;
    };
    var getUserPosition = function()
    {
        navigator.geolocation.getCurrentPosition( function( position )
        {
            var location = '', point = new google.maps.LatLng(  position.coords.latitude, position.coords.longitude );

            if ( navigator.geolocation.type == 'Gears' && position.gearsAddress )
                location = [position.gearsAddress.city, position.gearsAddress.region, position.gearsAddress.country].join(', ');
            else if ( navigator.geolocation.type == 'ClientLocation' )
                location = [position.address.city, position.address.region, position.address.country].join(', ');

            document.getElementById( addressid ).value = location;
            map.setCenter( point);
            map.setZoom(13);
            marker.setMap(null);
            marker=new google.maps.Marker({
                position:point,
                map:map,
                icon: 'http://google-maps-icons.googlecode.com/files/factory.png'
            });
            updateLatLngFields( point );
        },
        function( e )
        {
            alert( 'Could not get your location, error was: ' + e.message );
        },
        {
            'gearsRequestAddress': true
        });
    };

    var options = {
        zoom: 0,
        startPoint: null,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map( document.getElementById( mapid ),options ),marker=null;
    if ( document.getElementById( latid ).value && document.getElementById( latid ).value != 0 )
    {
        options.startPoint = new google.maps.LatLng( document.getElementById( latid ).value, document.getElementById( longid ).value );
        options.zoom = 13;
            
    }
    else
    {
        options.startPoint = new google.maps.LatLng(0,0);
    }
  
       
    map.setCenter(options.startPoint);

    marker=new google.maps.Marker({
        position:options.startPoint,
        map:map,
        icon: 'http://google-maps-icons.googlecode.com/files/factory.png'
    });
   
    geocoder = new google.maps.Geocoder();
    google.maps.event.addListener( map, 'click', function( event )
    {
        marker.setMap(null);
        marker=new google.maps.Marker({
            position:event.latLng,
            map:map,
            icon: 'http://google-maps-icons.googlecode.com/files/factory.png'
        });
        map.panTo(event.latLng);
        updateLatLngFields( event.latLng );
        document.getElementById( addressid ).value = '';
    });

    document.getElementById( 'ezgml-address-button-' + attributeId ).onclick = showAddress;
    document.getElementById( 'ezgml-restore-button-' + attributeId ).onclick = restoretLatLngFields;

    if ( navigator.geolocation )
    {
        document.getElementById( 'ezgml-mylocation-button-' + attributeId ).onclick = getUserPosition;
        document.getElementById( 'ezgml-mylocation-button-' + attributeId ).className = 'button';
        document.getElementById( 'ezgml-mylocation-button-' + attributeId ).disabled = false;
    }
    
}

