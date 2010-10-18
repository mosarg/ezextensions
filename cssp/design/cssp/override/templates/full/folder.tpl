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

     {def   $cont_classes = array('folder','blog')
                 $cont_children = array()
                 $cont_count = ''
                 $style=''}

           {set $cont_children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $cont_classes) )
                      $cont_count=$cont_children|count()}
   {if gt($cont_count,0)}
        {set $style='content-view-rightbar'}
   {else}
        {set $style='content-view-full'}
   {/if}

   <div class="{$style}">
    <div class="class-folder">
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
        
        {if $node.data_map.description.has_content}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        {/if}


         



        {if $node.object.data_map.show_children.data_int}

        {def $page_limit = 10
                 $classes = ezini( 'MenuContentSettings', 'ExtraIdentifierList', 'menu.ini' )
                 $children = array()
                 $articles = array()
                 $children_count = ''
                 $articles_count=''}


         {set $articles=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', array('progetto','article','article_mainpage','article_subpage'),
                                                          'limit', $page_limit ) )
                      $articles_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
                                                                      'class_filter_type', 'include',
                                                                      'class_filter_array',array('progetto','article','article_mainpage','article_subpage') ) )}
                  

        {set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'exclude',
                                                          'class_filter_array', $classes,
                                                          'limit', $page_limit ) )
                 $children_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
                                                                      'class_filter_type', 'exclude',
                                                                      'class_filter_array',$classes) )}






           {if or(gt($children_count,0),gt($articles_count,0))}

            <div class="content-view-children">
                {foreach $articles as $article }
                  {node_view_gui view=line content_node=$article}
                {/foreach}
            </div>

           {if gt($children_count,0)}
           <div class="content-view-children">
                      
                {foreach $children as $child }
                  {node_view_gui view=line content_node=$child}
                {/foreach}
            </div>

            {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     item_count=sum($children_count,$articles_count)
                     view_parameters=$view_parameters
                     item_limit=$page_limit}
                     {/if}
            {/if}
        {/if}
    </div>
</div>

   {if gt($cont_count,0)}
   <div class="rightbar">
            <div class="content-view-children">
               {foreach $cont_children as $child }
                  {node_view_gui view=line content_node=$child}
                {/foreach}
            </div>
   </div>
   {/if}


</div>

