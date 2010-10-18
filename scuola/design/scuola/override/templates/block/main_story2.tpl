{def $valid_node = $block.valid_nodes[0]}

<!-- BLOCK: START -->
<div class="block-type-mainstory">
<div class="border-box block-style4-box-outside">
<!-- BLOCK BORDER INSIDE: START -->
<div class="border-content">
<!-- BLOCK CONTENT: START -->
<div class="class-article">

    <div class="attribute-header">
        <h1><a href="{$valid_node.url_alias|ezurl(no)}">{$valid_node.name|wash()}</a></h1>
    </div>
    <hr />
    <div class="attribute-image">{attribute_view_gui attribute=$valid_node.data_map.image image_class='mainstory2'}</div>
    
    <div class="attribute-short">
        {attribute_view_gui attribute=$valid_node.data_map.intro}
    </div>

    <div class="read-on">
        <a href={$valid_node.url_alias|ezurl()}>{'Continua >>'|i18n('scuola/block/mainstory')}</a>
    </div>
</div>
<!-- BLOCK CONTENT: END -->
</div>
<!-- BLOCK BORDER INSIDE: END -->
</div>
</div>
<!-- BLOCK: END -->
{undef $valid_node}