{def $valid_nodes = $block.valid_nodes}

<!-- BLOCK: START -->
<div class="block-type-2items-big">
   
        <div class="border-content">
            <!-- BLOCK BORDER INSIDE: START -->
                           
                <div class="border-content">
                    <!-- BLOCK CONTENT: START -->
                    {foreach $valid_nodes as $valid_node}
                    <h2><a href={$valid_node.url_alias|ezurl()}>{$valid_node.name}</a></h2>
                    <div class="bigbody">
                    {attribute_view_gui attribute=$valid_node.data_map.image image_class='square'}
                    {attribute_view_gui attribute=$valid_node.data_map.intro}
                    </div>
                           {delimiter}
                    <div class="separator"></div>



                    {/delimiter}

                    {/foreach}

                    <!-- BLOCK CONTENT: END -->
                </div>
            </div>
</div>

{undef $valid_nodes}