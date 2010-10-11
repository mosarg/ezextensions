{* Folder - Block view *}
<div class="class-article block-element">
    <div class="attribute-header">
        <h2><a href={$node.url_alias|ezurl}>{$node.name|wash()}</a></h2>
    </div>
    {if $node.data_map.short_description.has_content}
    <div class="attribute-short">
        {if $node.data_map.icon.has_content}
        <div class="attribute-image">
            {attribute_view_gui attribute=$node.data_map.icon image_css_class=shadow image_class=$image_class}
        </div>
        {/if}

        {$node.data_map.short_description.data_text|strip_tags()|shorten(140)}
        <a class="go_on" href={$node.url_alias|ezurl}>Continua...</a>
    </div>
    {/if}
</div>
