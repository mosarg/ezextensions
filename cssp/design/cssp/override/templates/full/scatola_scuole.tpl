{* Folder - Full view *}

{mpagedata_set( 'left_menu', true() )}
{mpagedata_set( 'left_nav_menu', false() )}
{mpagedata_set( 'extra_menu', false() )}
{run-once}
{ezcss_require('filter_scuole.css')}
{ezscript_require( array( concat( 'ezjsc::', 'jqueryio' ),'classes/jquery-ui-min.js','classes/schools_filter.js',
            'init_schoolfilter.js'))}
{/run-once}



<div class="content-view-full">
    <div id="facetes">
        <div id="inputs"></div>
        <div id="filter_results"></div>
    </div>


    <div class="class-folder">
        <div class="attribute-header">
            <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>
        </div>
     
       

        {if $node.object.data_map.description.has_content}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        {/if}

      
            {def $page_limit = 10
                 $classes=array('scuola')
                 $children = array()
                 $children_count = ''}
                 


            {set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'sort_by', $node.sort_array,
                                                           class_filter_type,'include',
                                                           class_filter_array,$classes,
                                                          'limit', $page_limit ) )
                 $children_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
                                                                      'class_filter_type', 'include',
                                                                      'class_filter_array', $classes ) )}



            <div class="content-view-children">
		
                {if $children_count|gt(0)}
                {foreach $children as $child }
                    {node_view_gui view='line' content_node=$child}
		{/foreach}
                {/if}
		
            </div>




            {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     item_count=$children_count
                     view_parameters=$view_parameters
                     item_limit=$page_limit}

        
    </div>
</div>

{def $users_close_by = fetch( 'content', 'tree', hash(
                              'parent_node_id', $node.node_id,
                              'sort_by', array( 'distance', true() ),
                              'class_filter_type', 'include',
                              'class_filter_array', array( 'scuola' ),
                              'extended_attribute_filter', hash( 'id', 'ezgmlLocationFilter', 'params', hash( 'latitude', 46.066837,
                                                                                                      'longitude',13.237675,
                                                                                                              'distance', 15 ) )
                              ) )}
{include uri='design:parts/gmap.tpl'
    locations=$users_close_by
    size=array(800,500)
    location_attribute='location'
    center=array(46.066837,13.237675)
    zoom=12
    popup_view='line'
    
}


<div id="config-filter-scuole" style="visibility:hidden">
            <p title="facetes">denom_istituzione,titolo_plesso,meccanografico_scuola,tipo,comune,cap</p>
            <p title="facetes_hash">{hash('denom_istituzione','Denominazione','titolo_plesso','Nome scuola',
                                          'meccanografico_scuola','Codice Meccanografico',
                                          'tipo','Tipologia','comune','Comune','cap','Cap')|json_encode()}</p>
            <p title="node_id">{$node.node_id}</p>
            <p title="can_edit">{fetch( 'content', 'can_instantiate_classes',hash('parent_node',$node))}</p>
    </div>
