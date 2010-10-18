{def $valid_nodes = $block.valid_nodes}

<!-- BLOCK: START -->
<div class="block-type-2items block-item">
<!-- BLOCK BORDER INSIDE: START -->
<div class="attribute-header"><h2>{$block.name}</h2></div>

<div class="border-box">
<div class="border-content">
<!-- BLOCK CONTENT: START -->
{foreach $valid_nodes as $valid_node}
{node_view_gui view='block_item' image_class='block2items1' content_node=$valid_node}
{delimiter}
<div class="separator"></div>
{/delimiter}
{/foreach}
<!-- BLOCK CONTENT: END -->
</div>
</div>

</div>

{undef $valid_nodes}