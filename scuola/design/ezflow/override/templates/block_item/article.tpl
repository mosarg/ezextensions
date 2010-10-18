<div class="class-article float-break">

   {if is_set($front_style)}
    <div class="color_block">
        <div class="attribute-header">
            <h2 class="rounded"><a href={$node.url_alias|ezurl()}>{$node.name|wash()}</a></h2>
        </div>
       {if $node.data_map.intro.has_content}
        <div class="attribute-short">
            <div class="attribute-image">{attribute_view_gui attribute=$node.data_map.image image_class=$image_class}</div>
            {$node.data_map.intro.data_text|strip_tags()|shorten(140)}
        </div>
        {/if}
        </div>
    {else}
        <div class="attribute-header">
            <h2 class="rounded">
                <a href={$node.url_alias|ezurl()}>{$node.name|wash()}</a>
            </h2>
        </div>
        <div class="attribute-short">
            {if $node.data_map.image.has_content}
                <div class="attribute-image">{attribute_view_gui attribute=$node.data_map.image image_class=$image_class}</div>
            {/if}
            {attribute_view_gui attribute=$node.data_map.intro}
        </div>
        <div class="read-on">
        <a href={$node.url_alias|ezurl()}>{'Continua >>'|i18n('scuola/block/mainstory')}</a>
        </div>
    {/if}
</div>