{def $valid_nodes = $block.valid_nodes}

<div class="block-type-3items block-view-{$block.view}">

{foreach $valid_nodes as $valid_node}

{node_view_gui view='block_item' image_class='colorblock' content_node=$valid_node front_style=thumbnail}

{/foreach}

</div>

{undef $valid_nodes}