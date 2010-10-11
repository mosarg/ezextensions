{def $valid_nodes = $block.valid_nodes}
<!-- BLOCK: START -->
<div class="block-type-gallery">
<div class="border-content">
<div class="block">
    <div class="left">
        <h2>{$block.name|wash()}</h2>
    </div>
    <div class="right">
    {*
        <input type="image" src={"input-img-prev.png"|ezimage()} />
        <input type="image" src={"input-img-next.png"|ezimage()} />
    *}
    </div>
    <div class="break"></div>
</div>
<!-- BLOCK BORDER INSIDE: START -->

<div class="border-content">

<!-- BLOCK CONTENT: START -->

<div class="columns-two">
<div class="col-1-2">
<div class="col-1">
<div class="col-content">

{node_view_gui view='block_item' image_class='blockgallery1' content_node=$valid_nodes[0]}

</div>
</div>
<div class="col-2">
<div class="col-content">

{node_view_gui view='block_item' image_class='blockgallery2' content_node=$valid_nodes[1]}

{if $valid_nodes[2]}
    {node_view_gui view='block_item' image_class='blockgallery2' content_node=$valid_nodes[2]}
{/if}
</div>
</div>
</div>

</div>

<!-- BLOCK CONTENT: END -->

</div>
<!-- BLOCK BORDER INSIDE: END -->
</div>
</div>
<!-- BLOCK: END -->

{undef $valid_nodes}