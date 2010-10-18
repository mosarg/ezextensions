{* Article - Block view *}
<div class="class-article float-break block-element">
    <div class="left-column">
    <div class="attribute-header">
        <h2><a href={$node.url_alias|ezurl()}>{$node.name|wash()}</a></h2>
    </div>
    {if $node.data_map.intro.has_content}
    <div class="attribute-short">
        {$node.data_map.intro.data_text|strip_tags()|shorten(140)}
        
    </div>
    {/if}
    <a class="go_on" href={$node.url_alias|ezurl}>Continua...</a>
    </div>
    <div class="attribute-image">
            {attribute_view_gui attribute=$node.data_map.image  image_class=$image_class}
    </div>
    
</div>