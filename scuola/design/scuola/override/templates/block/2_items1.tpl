{def $valid_nodes = $block.valid_nodes}

<div class="block-type-2items">


{if $block.name|preg_match('/notitle/')|not()}
 <div class="attribute-header-block"><h2>{$block.name}</h2></div>
{/if}


    <div class="border-content">
        {foreach $valid_nodes as $valid_node}
            {node_view_gui view='block_item' image_class='block2items1' content_node=$valid_node style='ultracompact'}
                {delimiter}
                    <div class="separator"></div>
                {/delimiter}
        {/foreach}
    </div>



</div>


{undef $valid_nodes}