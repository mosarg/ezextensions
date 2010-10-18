{def $valid_nodes = $block.valid_nodes}
<!-- BLOCK: START -->
<div class="block-type-gallery">
<div class="border-content">
<div class="block">
    <div class="left">
        <h2>{$block.name|wash()}</h2>
    </div>
    <div class="break"></div>
</div>
<!-- BLOCK BORDER INSIDE: START -->
<div class="border-content">
<!-- BLOCK CONTENT: START -->
<div class="columns-three">
{foreach $valid_nodes as $valid_node}
    {def $children=fetch_alias( children, hash( parent_node_id, $valid_node.node_id, limit, 5 ) ) }
    {foreach $children as $media_file}
        {node_view_gui view=galleryline  content_node=$media_file}
    {/foreach}
 {/foreach}
</div>
<!-- BLOCK CONTENT: END -->
</div>
<!-- BLOCK BORDER INSIDE: END -->
</div>
</div>
<!-- BLOCK: END -->

{undef $valid_nodes}