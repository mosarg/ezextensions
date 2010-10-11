{* Article index *}
{def $article_subpages=fetch( content, list, hash( parent_node_id, $used_node.node_id,
                                                               class_filter_type, include,
                                                              class_filter_array, array( 'article_subpage' ),
                                                              sort_by, $used_node.sort_array ) )}
{if $article_subpages|count}
        <div class="attribute-article-index-frontpage">
            <div class="border-box">
            <ol>
            {foreach $article_subpages as $article_subpage}
                  <li class="rounded shadow">
                    <a href={$article_subpage.url_alias|ezurl}>
                        {if $article_subpage.data_map.index_title.has_content}
                            {attribute_view_gui attribute=$article_subpage.data_map.index_title}
                        {else}
                            {$article_subpage.name|wash}
                        {/if}
                    </a>
                  </li>
               {/foreach}
            </ol>
         </div>
        </div>
{/if}