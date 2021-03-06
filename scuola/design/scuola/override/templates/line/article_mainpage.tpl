{* Article (main-page) - Line view *}
<div class="content-view-line">
    <div class="class-article-mainpage">

    <h2 class="rounded line-header-common"><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash}</a></h2>


    {include uri='design:parts/line/common_line_header.tpl'}


    {if $node.data_map.image.has_content}
        <div class="attribute-image">
            {attribute_view_gui image_class=articlethumbnail href=$node.url_alias|ezurl attribute=$node.data_map.image}
        </div>
    {/if}

    {if $node.data_map.intro.content.is_empty|not}
    <div class="attribute-short">
        {attribute_view_gui attribute=$node.data_map.intro}
    </div>
    {/if}
    {include uri=concat("design:parts/article/article_index_blocchi_line.tpl") used_node=$node}
    </div>
</div>