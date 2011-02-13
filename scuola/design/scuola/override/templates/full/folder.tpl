{* Folder - Full view *}


{include uri='design:parts/global_variables.tpl' left_menu=true() left_nav_menu=true()}

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
            {if $node.data_map.icon.has_content}
                <div class="attribute-image">
                 
                    <div class="shadow" >{attribute_view_gui attribute=$node.data_map.icon link_class=ezimage_zoom href=$node.data_map.icon.content[original].url|ezroot image_class=gallerythumbnailsquare}</div>
                 
                </div>
            {/if}
            <h1>{$node.data_map.name.content|wash()}</h1>
        </div>
        
        <div class="title-separator"></div>
        <div class="separator"></div>
        
       
        
        
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
                <h4>{"Elementi correlati"|i18n('scuola/folder/line')}</h4>
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
{include uri='design:parts/object_informations.tpl' style='full'}
<script type="text/javascript" src={'javascript/tinysort.js'|ezdesign} ></script>
<script type="text/javascript" src={'javascript/listsort.js'|ezdesign} ></script>
