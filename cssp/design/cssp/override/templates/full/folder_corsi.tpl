{* Folder - Full view *}

{mpagedata_set( 'left_menu', true() )}
{mpagedata_set( 'left_nav_menu', true() )}
{def $global_layout_class=fetch('content','list_count',hash(parent_node_id,$node.node_id,
                                    class_filter_type, "include",
                                    class_filter_array, array('infobox','global_layout')))}
{if gt($global_layout_class,0)}
    {mpagedata_set( 'extra_menu', true() )}
{else}
    {mpagedata_set( 'extra_menu', false() )}
{/if}


<div class="border-box">

<div class="content-view-full">
    <div class="folder-corsi">

        <div class="attribute-header">
            <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>
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

        {if $node.object.data_map.show_children.data_int}
            {def $page_limit = 10
                 $classes=array('folder','folder_corsi','article','corso')
                 $children = array()
                 $children_count = ''}
                 
            {if le( $node.depth, '3')}
                {set $classes = $classes|append('folder')}
            {/if}
                


            {set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'sort_by', $node.sort_array,
                                                          'depth',1,
                                                          'sort_by', array('priority',true),
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
</div>

</div>
