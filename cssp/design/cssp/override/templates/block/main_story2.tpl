{def $valid_node = $block.valid_nodes[0]}

<!-- BLOCK: START -->
<div class="block-type-mainstory">
<div class="border-box block-style4-box-outside">
<div class="border-content">

<!-- BLOCK BORDER INSIDE: START -->

<div class="border-content block-mainstory2">

<!-- BLOCK CONTENT: START -->

<div class="class-article">

    <div class="attribute-image">
      <div class="attribute-header">
                <h2><a href="{$valid_node.url_alias|ezurl(no)}">{$valid_node.name|wash()}</a></h2>
      </div>
        {attribute_view_gui attribute=$valid_node.data_map.image image_class='mainstory2'}

    </div>
    <div class="attribute-short">
        {attribute_view_gui attribute=$valid_node.data_map.intro}
    </div>
    <a href={$valid_node.url_alias|ezurl()} class="goon">Continua...</a>
</div>

<!-- BLOCK CONTENT: END -->

</div>
</div>

</div>

</div>



<!-- BLOCK: END -->

{undef $valid_node}