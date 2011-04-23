{* Progetto - Full view *}


{include uri='design:parts/global_variables.tpl' left_menu=true() left_nav_menu=true()}


    <div class="content-view-full">
        <div class="class-progetto">
    {if $node.object.state_id_array|contains('6')}
         <div class="wip">
                <p>{"Contenuto in preparazione non ancora visibile pubblicamente"|i18n('scuola/state')}</p>
         </div>
        {/if}
            
    
      <div class="attribute-header">
            {if $node.data_map.logo.has_content}
                <div class="attribute-image">
                 
                   {attribute_view_gui attribute=$node.data_map.logo image_css_class='shadow' link_class=ezimage_zoom href=$node.data_map.logo.content[original].url|ezroot image_class=gallerythumbnailsquare}
                 
                </div>
            {/if}
            <h1>{$node.data_map.title.content|wash()}</h1>
       </div>
       
      <div class="title-separator"><h3>{$node.data_map.codice_progetto.content|wash()}</h3></div>
      
      <div class="separator"></div>
        
        
          <div class="attribute-short">
                {attribute_view_gui attribute=$node.data_map.intro}
            </div>
        {if $node.data_map.body.content.is_empty|not}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.body}
            </div>
        {/if}

        
{if $node.object.data_map.show_children.data_int}

        {def $page_limit = 10
                 $classes = array('folder','dmsfolder','gallery','event_calendar')
                 $children = array()
                 $articles =array()
                 $children_count = ''
                 $articles_count=''}

            {set $articles=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', array('article','article_mainpage','article_subpage'),
                                                          'limit', $page_limit ) )
                  $articles_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
                                                                      'class_filter_type', 'include',
                                                                      'class_filter_array',array('progetto','article','article_mainpage','article_subpage') ) )}


            

            {set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $classes,
                                                          'limit', $page_limit ) )
                 $children_count=$children|count()}




             {if or(gt($children_count,0),gt($articles_count,0))}

             <div class="content-view-children">
                {foreach $articles as $article }
                  {node_view_gui view=line content_node=$article imagesize='articlethumbnail'}
                {/foreach}
            </div>

            <div class="content-view-children">
                <h4>{"Elementi correlati"|i18n('scuola/folder/line')}</h4>
                {foreach $children as $child }
                  {node_view_gui view='line' content_node=$child imagesize='articlethumbnail'}
                {/foreach}
            </div>

            {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     item_count=$children_count
                     view_parameters=$view_parameters
                     item_limit=$page_limit}
            {/if}
        {/if}
        
        

        </div>
        {include uri='design:parts/object_informations.tpl' style='full'}
    </div>

