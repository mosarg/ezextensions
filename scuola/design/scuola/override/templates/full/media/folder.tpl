{* Folder - Full view *}


{scuolapagedata_set( 'left_menu', true() )}
{scuolapagedata_set( 'left_nav_menu', true() )}
{scuolapagedata_set( 'extra_menu', false() )}
<div class="border-box">
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
             
                 <div class="sortbuttons" >
                    <h4>Ordine:</h4>
                    <a id="sortbuttonup"  class="rounded">Alfabetico ascendente</a>
                    <a id="sortbuttondown"  class="rounded">Alfabetico discendente</a>
                    <a id="timesortup" class="rounded">Temporale crescente</a>
                    <a id="timesortdown" class="rounded">Temporale decrescente</a>
                 </div>
                {foreach $children as $child }
                  {node_view_gui view=line content_node=$child}
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
<script type="text/javascript" src={'javascript/tinysort.js'|ezdesign} ></script>
<script type="text/javascript" src={'javascript/listsort.js'|ezdesign} ></script>
