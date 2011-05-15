

{* Dipendenti - Full view *}


{include uri='design:parts/global_variables.tpl' left_menu=true() left_nav_menu=true() extra_menu=false()}


<div class="content-view-full">
    <div class="class-dipendenti">
        
        {if $node.object.state_id_array|contains('6')}
         <div class="wip">
                <p>{"Contenuto in preparazione non ancora visibile pubblicamente"|i18n('scuola/state')}</p>
         </div>
        {/if} 
        <div class="attribute-header">
            {if $node.data_map.image.has_content}
                <div class="attribute-image">
                 
                    {attribute_view_gui attribute=$node.data_map.image image_css_class='shadow' link_class=ezimage_zoom href=$node.data_map.image.content[original].url|ezroot image_class=gallerythumbnailsquare}
                 
                </div>
            {/if}
            <h1>{$node.name|wash()}</h1>
        </div>
        
        <div class="title-separator"></div>
        <div class="separator"></div>
        
        {if $node.data_map.description.has_content}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        {/if}
        {if $node.object.data_map.show_children.data_int}
            {def $page_limit = 10
                 $classes = ezini( 'MenuContentSettings', 'ContainerExcludeList', 'menu.ini' )
                 $children = array()
                 $children_count = ''}
             
           
            {set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'exclude',
                                                          'class_filter_array', $classes,
                                                          'limit', $page_limit ) )
                 $children_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
                                                                      'class_filter_type', 'exclude',
                                                                      'class_filter_array', $classes ) )}





            <div class="content-view-children">
                {foreach $children as $child }
                  {node_view_gui view='line' content_node=$child}
                {/foreach}
            </div>
            {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     item_count=$children_count
                     view_parameters=$view_parameters
                     item_limit=$page_limit}

        {/if}
    </div>
    {include uri='design:parts/object_informations.tpl' style='full'}
</div>
