{* 
This is a re-usable map template that will generate a google map and place
a set of points on it. By modifying the parameters passed in, you can adjust 
the appearance of the map. This template won't do everything that you can 
do with the GMaps extension, but it will probably take care of around 70%
of the things that you'd like to do.

This template is also compatible (and included) with the locationfinder 
extension, which geocodes objects and lets you find a list of items that are 
the closest to a given point (find the nearest store, etc).

Parameters: 

locations
--------------------
This can be either a list of content nodes returned from a fetch, 
or a list of GeocoderItem objects from the locationfinder extension.

location_attribute
--------------------
The identifier of the attribute on the objects passed in that contains the 
location to use on the map. If you passed in a collection of GeocoderItems
instead of content nodes, this attribute is ignored. 
Default: 'location'

size
--------------------
A two-element array containing the width and height (respectively) to 
render the map. 
Default: 400 by 400

map_type
--------------------
The type of map to show. Valid Google-supplied options are G_NORMAL_MAP, 
G_SATELLITE_MAP, and G_HYBRID_MAP.
Default: 'G_NORMAL_MAP'

center
--------------------
A two-element array containing the latitude and longitude (respectively) on 
which to center the map. If this is left blank, the javascript will 
automatically pick a point in the center of all the mapped items.
Default: automatically select a center point

zoom
--------------------
An integer zoom level to use on the map. Valid Zoom levels usually range from 
0 (entire globe) to around 16-18, depending on the map type. If left blank, the
javascript will pick the closest zoom level that still shows all of the mapped 
points.
Default: automatically select a zoom level

popup_view
--------------------
Template calls are made to node_view_gui in order to render the HTML used in
the map's 'popup' boxes associated with each point. Set this to determine 
which 'view' the template uses when calling node_view_gui.
Default: 'line'

show_popups_on_page
--------------------
The template puts the HTML in the popup windows by rendering it on to the 
page inside a div that's hidden by an inline style rule. Often, you 
want to display a map and then list the locations on the page as well. 
If that's the case, you can just show the HTML rendered in the hidden 
div to get a list of the items. 
Default: false 

map_id
--------------------
The ID to use on the map. You probably only want to worry about this 
unless you have another item on the page with an ID of 'map'.
Default: 'map'  

Examples
--------------------
List all office objects under node 57 and display their 'location' 
attributes on a 600x400 map. Also list the offices on the page:

{def $offices = fetch('content','list', hash(
                'parent_node_id', 57,
                'class_filter_type', 'include',
                'class_filter_array', array('office')))}

{include uri='design:gmaps.tpl' 
    locations=$offices
    size=array(600,400)
    show_popups_on_page=true()
}


Recursively get all image objects under node 243 and display their 
'gps_point' attributes on a 400x400 map. Center the map on Yellowstone
National Park at a reasonable zoom level, and use the object's 'galleryline'
view for the map popups:

{def $pictures = fetch('content','tree', hash(
                'parent_node_id', 243,
                'class_filter_type', 'include',
                'class_filter_array', array('image')))}

{include uri='design:gmaps.tpl' 
    locations=$pictures
    location_attribute='gps_point'
    center=array(44.62566, -110.5389)
    zoom=8
    popup_view='galleryline'
}


Pull the 'location' attribute from the object at node 415, and display a 
small map centered on that point. Don't display any markers.
{def $center = fetch('content','node', hash(
                'node_id', 415))}
                

{include uri='design:gmaps.tpl' 
    center=$center.object.data_map.location.content
    zoom=8
    size=array(150,150)
}
 
  
*}
{if is_set( $locations )|not }
{def $locations= array()}
{/if}
{if is_set( $size )|not }
{def $size= array(400, 400)}
{/if}
{if is_set($show_popups_on_page)|not}
{def $show_popups_on_page=false()}
{/if}
{if is_set($map_id)|not}
{def $map_id='map'}
{/if}
{if is_set($map_type)|not}
{def $map_type = 'G_NORMAL_MAP'}
{/if}
{if is_set($popup_view)|not}
{def $popup_view = 'line'}
{/if}
{if is_set($location_attribute)|not}
{def $location_attribute = 'location'}
{/if}
{run-once}
 {ezscript_require( array('gmap_showlocations.js','init_gmap_showlocations.js'))}
{/run-once}

<div id="{$map_id}" style="width: {$size[0]}px; height: {$size[1]}px"></div>
{if $locations}
<div class="locations" {if $show_popups_on_page|not}style="display: none"{/if}>
{def $location_node=null}
{def $json_locations=array()
     $coordinates=null}

{foreach $locations as $location}

    {set $coordinates=$location.data_map.location.content}

    {set $json_locations=$json_locations|append(hash(node_id,$location.node_id,
                                                     latitude,$coordinates.latitude,
                                                     longitude,$coordinates.longitude))}


{/foreach}
</div>
{/if}
<div id="config_gmap" style="display:none">
            <p title="mapid">{$map_id}</p>
            <p title="locations">{$json_locations|json_encode()}</p>
            <p title="popup_view">{$popup_view}</p>
</div>