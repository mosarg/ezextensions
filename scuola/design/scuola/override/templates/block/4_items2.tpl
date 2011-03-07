{def $valid_nodes = $block.valid_nodes}

<!-- BLOCK: START -->
<div class="block-type-4items block-view-{$block.view}">

<div class="columns-two">
<div class="col-1">
<div class="col-content">

<div class="border-content">

{node_view_gui view='block_item' image_class='articlethumbnail' content_node=$valid_nodes[0] style='empty'}

</div>



</div>
</div>
<div class="col-2">
<div class="col-content">

<div class="border-content">

<!-- BLOCK CONTENT: START -->

{node_view_gui view='block_item' image_class='articlethumbnail' content_node=$valid_nodes[1] style='empty'}

<!-- BLOCK CONTENT: END -->

</div>


</div>
</div>
</div>

<br />

<div class="columns-two">
<div class="col-1">
<div class="col-content">




<div class="border-content">

<!-- BLOCK CONTENT: START -->

{node_view_gui view='block_item' image_class='articlethumbnail' content_node=$valid_nodes[2] style='empty'}

<!-- BLOCK CONTENT: END -->


</div>



</div>
</div>
<div class="col-2">
<div class="col-content">

<div class="border-content">

<!-- BLOCK CONTENT: START -->

{node_view_gui view='block_item' image_class='articlethumbnail' content_node=$valid_nodes[3] style='empty'}

<!-- BLOCK CONTENT: END -->

</div>


</div>
</div>
</div>

</div>
<!-- BLOCK: END -->

{undef $valid_nodes}