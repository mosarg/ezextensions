{def $valid_nodes = $block.valid_nodes}

<!-- BLOCK: START -->
<div class="block-type-latest-content">

<div class="border-box block-style1-box-outside">

<div class="border-content">

<!-- BLOCK BORDER INSIDE: START -->

<div class="border-box block-style1-box-inside">

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
</div></div></div>

</div>

<!-- BLOCK BORDER INSIDE: END -->




{undef $valid_nodes}