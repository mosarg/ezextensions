{def $node = $block.valid_nodes[0]}

<!-- BLOCK: START -->
<div class="block-type-mainstory">

<!-- BLOCK BORDER INSIDE: START -->
<div class="border-content">
<!-- BLOCK CONTENT: START -->
<div class="class-article">

    <div class="attribute-header">
        <h1><a href="{$node.url_alias|ezurl(no)}">{$node.name|wash()}</a></h1>
    </div>
  
    <div class="attribute-image">{attribute_view_gui attribute=$node.data_map.image image_class='mainstory2'}</div>
    
    <div class="attribute-short">
        
        {$node.data_map.intro.content.output.output_text|smartshort(300,'...')}
        
    </div>

    <div class="read-on">
        <a href={$node.url_alias|ezurl()}>{'Continua'|i18n('scuola/block/mainstory')}...</a>
    </div>
</div>
<!-- BLOCK CONTENT: END -->
</div>
<!-- BLOCK BORDER INSIDE: END -->
</div>
    {include uri='design:parts/object_informations.tpl'}

<!-- BLOCK: END -->
{undef $node}