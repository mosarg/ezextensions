

{* Dipendenti - Full view *}


{include uri='design:parts/global_variables.tpl' left_menu=true() left_nav_menu=true() extra_menu=false()}


<div class="content-view-full">
    <div class="class-dipendenti">
        
        
        <div class="attribute-header">
            {if $node.data_map.logo.has_content}
                <div class="attribute-image">
                 
                    <div class="shadow" >{attribute_view_gui attribute=$node.data_map.logo link_class=ezimage_zoom href=$node.data_map.logo.content[original].url|ezroot image_class=gallerythumbnailsquare}</div>
                 
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
