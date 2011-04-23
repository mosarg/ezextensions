{* Folder - Full media view *}
{run-once}
 {ezscript_require( array('classes/navigator.js','init_navigator.js'))}
{/run-once}
{include uri='design:parts/global_variables.tpl' left_menu=true() left_nav_menu=true() extra_menu=false()}

  <div class="content-view-full">
    <div class="class-folder">
         <div class="attribute-header">
            <h1>{$node.name|wash}</h1>
        </div>
     
       

        {def $page_limit = 15
                  $children = array()
                 $articles = array()
                 $children_count = ''
                 $articles_count=''}
                         
              {set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'limit', $page_limit ) )
                   $children_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id) )}





           {if gt($children_count,0)}
           <div class="content-view-children">
     
                {foreach $children as $child }
                  {node_view_gui view=line content_node=$child}
                {/foreach}
            </div>

            {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     item_count=$children_count
                     view_parameters=$view_parameters
                     item_limit=$page_limit
                     node_id=$node.node_id}
            {/if}
        
        
    </div>
</div>


