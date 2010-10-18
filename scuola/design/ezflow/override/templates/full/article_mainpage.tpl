{* Article (main-page) - Full view *}
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
    <div class="class-article-mainpage">
        {if $node.object.state_id_array|contains('6')}
        <div class="wip rounded shadowmore">
            <p>{"Contenuto in preparazione non ancora visibile pubblicamente"|i18n('scuola/state')}</p>
        </div>
        {/if}
        <div class="attribute-header">
            <h1>{$node.data_map.title.content|wash()}</h1>
        </div>
        <div class="attribute-byline">
        {if $node.data_map.author.content.is_empty|not()}
        <p class="author">
             {attribute_view_gui attribute=$node.data_map.author}
        </p>
        {/if}
        <p class="date">
            {'Pubblicato il: '|i18n('scuola/dates')}{$node.object.published|l10n(shortdatetime)}
             {'Ultima modifica: '|i18n('scuola/dates')}{$node.object.modified|l10n(shortdatetime)}
             {'Versione Corrente: '|i18n('scuola/dates')}{$node.object.current_version}
        </p>
        </div>
        
        {include uri=concat("design:parts/article/article_index_", $node.data_map.index_style.class_content.options[$node.data_map.index_style.value[0]].name|downcase(), ".tpl") used_node=$node}
        {if $node.data_map.body.content.is_empty|not}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.body}
            </div>
        {/if}

        {include uri='design:parts/article/page_navigator.tpl' used_node=$node subpage=false()}

        {include uri='design:parts/article/comments.tpl' used_node=$node}

        {def $tipafriend_access=fetch( 'user', 'has_access_to', hash( 'module', 'content',
                                                                      'function', 'tipafriend' ) )}
        {if and( ezmodule( 'content/tipafriend' ), $tipafriend_access )}
        <div class="attribute-tipafriend">
            <p><a href={concat( "/content/tipafriend/", $node.node_id )|ezurl} title="{'Tip a friend'|i18n( 'design/ezwebin/full/article_mainpage' )}">{'Tip a friend'|i18n( 'design/ezwebin/full/article_mainpage' )}</a></p>
        </div>
        {/if}

        </div>
    </div>


</div>