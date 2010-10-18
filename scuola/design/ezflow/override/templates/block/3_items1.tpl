{def $valid_nodes = $block.valid_nodes}

<div class="block-type-3items block-view-{$block.view}">

{if is_set($block.name)}
<div class="attribute-header-block"><h2>{$block.name}</h2></div>
{/if}

{foreach $valid_nodes as $valid_node}

{node_view_gui view='block_item' image_class='articlethumbnail' content_node=$valid_node}

{delimiter}
<div class="separator"></div>
{/delimiter}

{/foreach}

</div>

{undef $valid_nodes}