{mpagedata_set( 'left_menu', true() )}
{mpagedata_set( 'left_nav_menu', false() )}
{mpagedata_set( 'extra_menu', false() )}


{run-once}
{ezcss_require(array('jquery.svg.css','provincia_map.css'))}
{ezscript_require( array( concat( 'ezjsc::', 'jqueryio' ),
            'classes/jquery.svgdom.min.js','classes/jquery-ui-min.js',
            'classes/svgloader.js','init_provmaploader.js'))}
{/run-once}
{def $user=fetch(user, current_user)}



<div class="content-view-full">
    <div class="provincia-map">


        <div class="attribute-short">
            <h1>{$node.name}</h1>
        </div>
   
       

{if $node.children_count|gt(0)}
{def $ticket_systems=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', array('ticketsystem')
                                                          ))
     $ticket_s_list=array() }
{def $svg_maps=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', array('file')
                                                          ))}
    {foreach $ticket_systems as  $ticket_system}

        {set $ticket_s_list=$ticket_s_list|append(hash('name',$ticket_system.name,'id_code',$ticket_system.data_map.code.content,
                                                        'url_alias',$ticket_system.url_alias))}

    {/foreach}

        <div id="svgmap">
            <div id="graph"></div>
            <div id="legend">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        </div>


     

 <div id="config-provincia-map" style="visibility:hidden">
            <p title="node_id">{$node.node_id}</p>
            <p title="user_id">{$user.contentobject_id}</p>
            <p title="svg_map">{$svg_maps[0].data_map.file.content.filepath|ezurl(no)}</p>
            <p title="ticket_s_list">{$ticket_s_list|json_encode()}</p>
            <p title="object_id">{$node.object.id}</p>

 </div>


 {/if}

  </div>
</div>