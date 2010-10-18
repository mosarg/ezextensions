{run-once}

<script type="text/javascript">
{literal}
function eZGmapLocation_MapView( attributeId, latitude, longitude )
{
    if (GBrowserIsCompatible()) 
    {
        if( latitude && longitude )
            var startPoint = new GLatLng( latitude, longitude ), zoom = 13;
        else
            var startPoint = new GLatLng( 0, 0 ), zoom = 0;

        var map = new GMap2( document.getElementById( 'ezgml-map-' + attributeId ) );
        map.addControl( new GSmallMapControl() );
        map.setCenter( startPoint, zoom );
        map.addOverlay( new GMarker(startPoint) );
    }
}
{/literal}
</script>
{undef $GMapsKeyHost}
{/run-once}

{if $attribute.has_content}
<script type="text/javascript">
<!--

if ( window.addEventListener )
    window.addEventListener('load', function(){ldelim} eZGmapLocation_MapView( {$attribute.id}, {first_set( $attribute.content.latitude, '0.0')}, {first_set( $attribute.content.longitude, '0.0')} ) {rdelim}, false);
else if ( window.attachEvent )
    window.attachEvent('onload', function(){ldelim} eZGmapLocation_MapView( {$attribute.id}, {first_set( $attribute.content.latitude, '0.0')}, {first_set( $attribute.content.longitude, '0.0')} ) {rdelim} );

-->
</script>

<div class="block">
{if $attribute.content.address}
<h4>Indirizzo:</h4>
{$attribute.content.address}
{/if}
</div>
<div id="ezgml-map-{$attribute.id}" class="map-container oldborder2"></div>
{/if}