{def $valid_nodes = $block.valid_nodes}


<div class="block-type-3items  block-type-dynamic3items">

<div class="attribute-header-block">
    <h2>{"Ultimi aggiornamenti"|i18n("design/scuola/blocks")}</h2>
</div>


<div class="border-content">


{foreach $valid_nodes as $valid_node}

{node_view_gui view='block_item' image_class='block2items1' content_node=$valid_node}

{delimiter}
<div class="separator"></div>
{/delimiter}

{/foreach}

</div>

</div>


{undef $valid_nodes}