{* dir circolari - Full view *}


{include uri='design:parts/global_variables.tpl' left_menu=false() left_nav_menu=false() extra_menu=false()}


<div class="border-box">
<div class="content-view-full">
    <div class="class-dir_circolari">

        <div class="attribute-header">
            <h1>{$node.name|wash}</h1>
        </div>
        
        {if eq( ezini( 'folder', 'SummaryInFullView', 'content.ini' ), 'enabled' )}
            {if $node.object.data_map.short_description.has_content}
                <div class="attribute-short">
                    {attribute_view_gui attribute=$node.data_map.short_description}
                </div>
            {/if}
        {/if}

        {if $node.object.data_map.description.has_content}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        {/if}

    
            {def $classes =array('folder_circolari')
                 $children = array()
                }
                
             {set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $classes ) )}

            {if gt($children|count,0)}
             <div class="content-view-children">
                 <h4>{"Elementi correlati"|i18n('scuola/folder/line')}</h4>
                {foreach $children as $child }
                    {node_view_gui view='folder_circolari_icon' content_node=$child}
                {/foreach}
            </div>
            {/if}
    </div>
</div>
</div>