{* Progetto - Full view *}

{scuolapagedata_set( 'left_menu', true() )}
{scuolapagedata_set( 'left_nav_menu', true() )}
{def $global_layout_class=fetch('content','list_count',hash(parent_node_id,$node.node_id,
                                    class_filter_type, "include",
                                    class_filter_array, array('infobox','global_layout')))}
{if gt($global_layout_class,0)}
    {scuolapagedata_set( 'extra_menu', true() )}
{else}
    {scuolapagedata_set( 'extra_menu', false() )}
{/if}


<div class="border-box">

    <div class="content-view-full">
        <div class="class-progetto">

        <div class="attribute-header">
            <h1>{$node.data_map.title.content|wash()}</h1>
            <h3>{$node.data_map.codice_progetto.content|wash()}</h3>
        </div>

        <div class="attribute-byline">
        {if $node.data_map.author.has_content}
        <p class="author">
             {attribute_view_gui attribute=$node.data_map.author}
        </p>
        {/if}
        <p class="date">
             {'Pubblicato il: '|i18n('scuola/dates')}{$node.object.published|l10n(shortdatetime)}
             {'Ultima modifica: '|i18n('scuola/dates')}{$node.object.modified|l10n(shortdatetime)}
             {'Versione Corrente: '|i18n('scuola/dates')}{$node.object.current_version}
        </p>
        {if $node.data_map.responsabili.has_content}
        <h4> {'Docenti responsabili: '|i18n('scuola/teach')}</h4>
        <p class="responsabili">
            {attribute_view_gui attribute=$node.data_map.responsabili}
        </p>
        {/if}

        </div>
        
            {if $node.data_map.logo.has_content}
                <div class="attribute-image">
                    {attribute_view_gui attribute=$node.data_map.logo image_class=medium}
               </div>
            {/if}
          <div class="attribute-long">
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
                  {node_view_gui view=line content_node=$article}
                {/foreach}
            </div>

            <div class="content-view-children">
                <h4>{"Elementi correlati"|i18n('scuola/folder/line')}</h4>
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
        {/if}
        
        

        </div>
    </div>


</div>