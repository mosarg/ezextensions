{def $valid_node = $block.valid_nodes[0]}

<!-- BLOCK: START -->

<div class="block-type-mainstory mainstory1">
    <div class="attribute-image">
     {switch match=$valid_node.object.class_identifier}
        {case match='article'}
            {attribute_view_gui href=$valid_node.url_alias|ezurl() attribute=$valid_node.data_map.image image_css_class=shadow image_class='mainstory1'}
        {/case}
        {case match='gallery'}
          {def $gallery_image=fetch( 'content', 'related_objects',hash( 'object_id', $valid_node.object.id,
      'all_relations', true() ) )}
            {attribute_view_gui href=$valid_node.url_alias|ezurl() attribute=$gallery_image[0].data_map.image image_css_class=shadow image_class='mainstory1'}
        {/case}
        {case}
            {attribute_view_gui href=$valid_node.url_alias|ezurl() attribute=$valid_node.data_map.icon image_css_class=shadow image_class='mainstory1'}
        {/case}
     {/switch}
    </div>

    <div class="trans-background">&nbsp;</div>

    <div class="attribute-link">
        <a href="{$valid_node.url_alias|ezurl(no)}">{$valid_node.name|wash()}</a>
    </div>
</div>

<!-- BLOCK: END -->

{undef $valid_node}