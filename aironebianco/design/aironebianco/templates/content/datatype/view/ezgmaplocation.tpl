{run-once}
 {ezscript_require( array('gmap_showlocation.js'))}
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
<div id="ezgml-map-{$attribute.id}" class="map-container shadow"></div>
{/if}