{* Folder - Full view *}
<div class="border-box">
<div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
<div class="border-ml"><div class="border-mr"><div class="border-mc float-break">

<div class="content-view-full">
    <div class="class-folder">

        <div class="attribute-header">
            <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>
        </div>

        {*Show prof personal information on prof folder page*}
                 
            {if $node.object.data_map.short_description.has_content}
                <div class="attribute-short">
                    {attribute_view_gui attribute=$node.data_map.short_description}
                </div>
            {/if}
        
            {if $node.object.data_map.description.has_content}
                <div class="attribute-long">
                    {attribute_view_gui attribute=$node.data_map.description}
                </div>
            {/if}

        
            {def $page_limit = 10
                 $classes = array( 'infobox' )
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
               {*da rifare*}
            <table id="docenti">   
                <tr>
                    <th>Docenti</th><th>Email</th><th>Telefono</th>
                </tr>    
                {foreach $children as $child }
                   <tr>
                        <td>{node_view_gui view='line' content_node=$child}</td>
                        <td>{attribute_view_gui attribute=$child.data_map.email}</td>
                        <td>{attribute_view_gui attribute=$child.data_map.telefono}</td>
                    </tr>    
                {/foreach}
            </table>    
            </div>

            {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     item_count=$children_count
                     view_parameters=$view_parameters
                     item_limit=$page_limit}

       
    </div>
</div>

</div></div></div>

</div>