{def $valid_nodes = $block.valid_nodes}
<div class="block-type-4items">
{if $block.name|preg_match('/notitle/')|not()}
 <div class="attribute-header-block"><h2>{$block.name}</h2></div>
{/if}
    <div class="border-content">
        <div class="two-columns">
            <div class="col-1">
                <div class="col-content">
                   <div class="content-view-inblock">
                        {node_view_gui view='block_item' image_class='gallerythumbnailsquare' style='ultracompact' content_node=$valid_nodes[0]}
                     </div>
                </div>
            </div>
            <div class="col-2">
                <div class="col-content">
                    <div class="content-view-inblock">
                            {node_view_gui view='block_item' image_class='gallerythumbnailsquare' style='ultracompact' content_node=$valid_nodes[1]}
                    </div>
                </div>
               </div>
            </div>

<!-- COLUMNS TWO: END -->

<div class="separator"></div>

<!-- COLUMNS TWO: START -->

<div class="two-columns">
<div class="col-1">
    <div class="col-content">
        <div class="content-view-inblock">
            {node_view_gui view='block_item' image_class='gallerythumbnailsquare' style='ultracompact' content_node=$valid_nodes[2]}
        </div>

    </div>
</div>
<div class="col-2">
    <div class="col-content">
        <div class="content-view-inblock">
            {node_view_gui view='block_item' image_class='gallerythumbnailsquare' style='ultracompact' content_node=$valid_nodes[3]}
        </div>
    </div>
</div>
</div>
</div>
</div>
{undef $valid_nodes}