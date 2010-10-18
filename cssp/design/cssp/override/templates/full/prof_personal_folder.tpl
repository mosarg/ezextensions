{* Folder - Full view  no side menu no extrainfo*}

{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}
<div class="border-box">
<div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
<div class="border-ml"><div class="border-mr"><div class="border-mc float-break">

<div class="content-view-full">
    <div class="class-folder">

        <div class="attribute-header">
            <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>
        </div>

        {*Show prof personal information on prof folder page*}
        
        {def $prof_object=fetch( 'content', 'reverse_related_objects',
                     hash( 'object_id',$node.contentobject_id) )}
    
        <div class="prof_personal_info"
        <div class="prof_picture">
        {attribute_view_gui attribute=$prof_object[0].data_map.image}   
        </div>
        <div class="prof_description">
        {attribute_view_gui attribute=$prof_object[0].data_map.signature}
        </div>
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


    
        <div id="contatti">        
        {if $node.object.data_map.email.has_content}
        <div id="email">
        <h2>{"Email"|i18n("design/m2000/full/proffolder")}</h2>
        {attribute_view_gui attribute=$node.data_map.email}
        </div>
        {/if}
        
        {if $node.data_map.telefono.has_content}
        <div id="telefono">
        <h2>{"Telefono"|i18n("design/m2000/full/proffolder")}</h2>
        {attribute_view_gui attribute=$node.data_map.telefono}
        </div>
        {/if}
        </div>
        {*classi insegnamento*}
        
        <div class="teach_class">
            <h2>{"Insegno in"|i18n("design/m2000/full/proffolder")}</h2>
        {attribute_view_gui attribute=$prof_object[0].data_map.teachwhere context='embed' sort='school'}
        </div>
        {if $node.object.data_map.show_children.data_int}
            {def $page_limit = 10
                 $classes = array( 'infobox' )
                 $children = array()
                 $children_count = ''}
                 
            {if le( $node.depth, '3')}
                {set $classes=array( 'infobox', 'folder' )}
            {/if}

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
                {foreach $children as $child }
                    {if $child.class_identifier|eq('infoprof')}
                        {node_view_gui view='full' content_node=$child}
                    {/if}
                {/foreach}
                {foreach $children as $child }
                    {if $child.class_identifier|ne('infoprof')}
                        {node_view_gui view='line' content_node=$child}
                    {/if}
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

</div></div></div>
<div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
</div>