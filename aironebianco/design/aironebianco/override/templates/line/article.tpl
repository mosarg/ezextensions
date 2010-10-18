{* Article - Line view *}
<div class="content-view-line">
<div class="class-article">
    <h2 class="rounded attribute-header"><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash}</a></h2>
    
    {include uri='design:parts/line/common_line_header.tpl'}

    {if $node.data_map.image.has_content}
        <div class="attribute-image">
            {attribute_view_gui attribute=$node.data_map.image href=$node.url_alias|ezurl image_class=large}
        </div>
    {/if}

    {if $node.data_map.intro.content.is_empty|not}
    <div class="attribute-short">
        {attribute_view_gui attribute=$node.data_map.intro}
    </div>
    {/if}
      <a class="goon" href={$node.url_alias|ezurl}>Continua...</a>
    </div>
</div>