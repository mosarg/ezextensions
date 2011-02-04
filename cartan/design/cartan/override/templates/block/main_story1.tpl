{def $valid_node = $block.valid_nodes[0]}

<!-- BLOCK: START -->

<div class="block-type-mainstory mainstory1">
    <div class="attribute-image">
     {if $valid_node.object.class_identifier|eq('article')}
        {attribute_view_gui href=$valid_node.url_alias|ezurl() attribute=$valid_node.data_map.image  image_class='mainstory4'}
     {else}
        {attribute_view_gui href=$valid_node.url_alias|ezurl() attribute=$valid_node.data_map.icon   image_class='mainstory4'}
     {/if}
    </div>

    <div class="trans-background">&nbsp;</div>

    <div class="attribute-link">
        <a href="{$valid_node.url_alias|ezurl(no)}">{$valid_node.name|wash()}</a>
    </div>
</div>

<!-- BLOCK: END -->

{undef $valid_node}