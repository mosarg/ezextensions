{def $vnode = $block.valid_nodes[0]}


<div class="block-type-mainstory block-view-{$block.view}">
    <div class="attribute-link">
        <a href="{$vnode.url_alias|ezurl(no)}">{$vnode.name|wash()}</a>
    </div>
    <div class="attribute-image">
        {attribute_view_gui href=$vnode.url_alias|ezurl() attribute=$vnode.data_map.image image_class='mainstory1'}
    </div>

    

    
</div>



{undef $vnode}