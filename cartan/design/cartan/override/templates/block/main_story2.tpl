{def $valid_node = $block.valid_nodes[0]}

<!-- BLOCK: START -->
<div class="block-type-mainstory mainstory2  oldborder1">
<div class="border-box">

<!-- BLOCK BORDER INSIDE: START -->

<div class="border-content">

<!-- BLOCK CONTENT: START -->

<div class="class-article">

     <div class="attribute-header">
        <h2><a href="{$valid_node.url_alias|ezurl(no)}">{$valid_node.name|wash()}</a></h2>
    </div>
    
    <div class="attribute-image">{attribute_view_gui attribute=$valid_node.data_map.image image_css_class=shadow image_class='mainstory2'}</div>

   

    <div class="attribute-short">
        {attribute_view_gui attribute=$valid_node.data_map.intro}
    </div>
    <a class="go_on" href="{$valid_node.url_alias|ezurl(no)}">Continua...</a>
</div>

<!-- BLOCK CONTENT: END -->

</div>
</div>
</div>

<!-- BLOCK BORDER INSIDE: END -->


{undef $valid_node}