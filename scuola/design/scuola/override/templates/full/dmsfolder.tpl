{* Folder - Full view *}

{run-once}
 {ezscript_require( array('classes/navigator.js','init_navigator.js'))}
{/run-once}
{include uri='design:parts/global_variables.tpl' left_menu=true() left_nav_menu=true()}


    <div class="content-view-full">
    <div class="class-dmsfolder">
        {* contenuto in preparazione *}
        {if $node.object.state_id_array|contains('6')}
        <div class="wip rounded shadowmore">
            <p>{"Contenuto in preparazione non ancora visibile pubblicamente"|i18n('scuola/state')}</p>
        </div>
        {/if}
        <div class="attribute-header">
            <h1>{$node.name|wash}</h1>
        </div>
        {if $node.data_map.short_description.has_content}
                <div class="attribute-short">
                    {attribute_view_gui attribute=$node.data_map.short_description}
                </div>
        {/if}
        
       
        {if $node.object.data_map.show_children.data_int}

        {def $page_limit = 10
                 $classes = array('dmsfolder')
                 $children = array()
                 $files=array()
                 $children_count = ''
                 $files_count=''}
                 {set $files=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', array('file','image'),
                                                          'limit', $page_limit ) )
                      $files_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
                                                                      'class_filter_type', 'include',
                                                                      'class_filter_array',array('file','image') ) )}



            {set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $classes) )
                 $children_count=$children|count()}


           {if or(gt($children_count,0),gt($files_count,0))}
           
           <div class="content-view-children">
                {foreach $files as $file }
                  {node_view_gui view=line content_node=$file}
                {/foreach}
            </div>

            <div class="content-view-children">
              {foreach $children as $child }
                  {node_view_gui view=line content_node=$child}
                {/foreach}
            </div>

            {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     item_count=$files_count
                     node_id=$node.node_id
                     view_parameters=$view_parameters
                     item_limit=$page_limit}
            {/if}
        {/if}
    </div>
{include uri='design:parts/object_informations.tpl' style='full'}
    </div>



