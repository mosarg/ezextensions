{def $valid_nodes = $block.valid_nodes}

<div class="block-type-3items block-view-{$block.view} block-item">

<div class="attribute-header"><h2>{$block.name}</h2></div>

{foreach $valid_nodes as $valid_node}

{node_view_gui view='block_item' image_class='articlethumbnailwide' style='compact' content_node=$valid_node}

{delimiter}
<div class="infotools"></div>
    {/delimiter}

{/foreach}

</div>

{undef $valid_nodes}