{def $vnode = $block.valid_nodes[0]}


<div class="block-type-mainstory block-view-{$block.view}">
    <div class="attribute-link">
       <a href="{$vnode.url_alias|ezurl(no)}">{$vnode.name|wash()}</a>
       {if $vnode.data_map.intro.has_content}
       <div class="attribute-short">{$vnode.data_map.intro.content.output.output_text||smartshort(250,'...')}</div>
            
       {/if}
        <div class="read-on">
                             <a href={$vnode.url_alias|ezurl()}>{'Continua'|i18n('scuola/block/mainstory')}...</a>
        </div>
    </div>
    <div class="attribute-image">
        {attribute_view_gui href=$vnode.url_alias|ezurl() attribute=$vnode.data_map.image image_class='mainstory1'}
    </div>

    

    
</div>



{undef $vnode}