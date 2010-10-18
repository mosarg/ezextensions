{* Article index *}
{def $article_subpages=fetch( content, list, hash( parent_node_id, $used_node.node_id,
                                                               class_filter_type, include,
                                                              class_filter_array, array( 'article_subpage' ),
                                                              sort_by, $used_node.sort_array ) )}
{if $article_subpages|count}
        <div class="attribute-article-index-blocchi-line">
           
             <ol>
                          
            {foreach $article_subpages as $article_subpage}
                {if eq( $node.node_id, $article_subpage.node_id )}
                    <li class="rounded shadow current">
                    {if $article_subpage.data_map.index_title.has_content}
                    <span>{attribute_view_gui attribute=$article_subpage.data_map.index_title}</span>
                    {else}
                    <span>{$article_subpage.name|wash}</span>
                    {/if}
                    </li>
                {else}
                    <li class="rounded shadow"><a href={$article_subpage.url_alias|ezurl}>
                    {if $article_subpage.data_map.index_title.has_content}
                        {attribute_view_gui attribute=$article_subpage.data_map.index_title}
                    {else}
                        {$article_subpage.name|wash}
                    {/if}
                    </a></li>
                {/if}
            {/foreach}
            </ol>
      
        </div>
{/if}