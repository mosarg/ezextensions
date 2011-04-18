{def $valid_nodes = $block.valid_nodes}

<div class="block-type-3items block-view-{$block.view}">

{if $block.name|preg_match('/notitle/')|not()}
 <div class="attribute-header-block"><h2>{$block.name}</h2></div>
{/if}
    
{foreach $valid_nodes as $valid_node}

{node_view_gui view='block_item' image_class='articlethumbnail' content_node=$valid_node style='ultracompact'}

{/foreach}

</div>

{undef $valid_nodes}