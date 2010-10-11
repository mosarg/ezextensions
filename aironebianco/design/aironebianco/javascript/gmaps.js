/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
    var mapid = '{$map_id}';
    var map = null;
    var geocoder = null;
    var gmapExistingOnload = null;
    var marker = null;

    {literal}
    if (window.onload)
    {
            //Hang on to any existing onload function.
            gmapsExistingOnload = window.onload;
    }

    function createMarker( lat, lng, info, bounds, icon)
    {
      var point = new GLatLng(lat, lng);
      var marker = new GMarker( point, icon );
      GEvent.addListener(marker, "click", function() {
        marker.openInfoWindowHtml(info);
      });
      if (bounds)
      {
          bounds.extend(point);
      }
      return marker;
    }

    window.onload=function(ev){
        //Run any onload that we found.
        if (gmapExistingOnload)
        {
                gmapExistingOnload(ev);
        }
        if (GBrowserIsCompatible()) {
          map = new GMap2(document.getElementById(mapid));

          map.addControl(new GSmallMapControl());
          map.setCenter(new GLatLng(0,0), 0);
          var bounds = new GLatLngBounds();
    {/literal}

for(){
          var popupwindow_{$index}=document.getElementById('location_{$location.contentobject_id}').innerHTML;
          map.addOverlay(createMarker({$location_data.latitude},{$location_data.longitude},popupwindow_{$index}, bounds));
}



          map.setMapType({$map_type});
          {if is_set($center)}
          var center = new GLatLng({$center[0]},{$center[1]});
          {else}
          var center = bounds.getCenter();
          {/if}
          {if is_set($zoom)}
          var zoom = {$zoom};
          {else}
          var zoom = map.getBoundsZoomLevel(bounds);
          {/if}
          map.setCenter(center,zoom);
    {literal}

        }
    };

    {/literal}