{def $location = $block.custom_attributes.location}

<h1>{$block.name|wash()}</h1>



<div id="map-container-{$block.id}" class="map-container shadow oldborder1"></div>

<span id="blockid" style="display: none">{$block.id}</span>
<span id="location" style="display: none">{$location}</span>


{ezscript_require(array('loadgmaps.js'))}


{undef  $location}