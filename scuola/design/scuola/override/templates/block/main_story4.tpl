    {def $node = $block.valid_nodes[0]}
<!-- BLOCK: START -->
<div class="block-type-mainstory block-view-{$block.view}">
     <h2><a href="{$node.url_alias|ezurl(no)}">{$node.name|wash()|shorten(40)}</a></h2>
                 <div class="attribute-image">{attribute_view_gui attribute=$node.data_map.image image_class='mainstory4'}</div>
                   
              
                            {$node.data_map.intro.content.output.output_text||smartshort(100,'...')}
                
                        <div class="read-on">
                             <a href={$node.url_alias|ezurl()}>{'Continua'|i18n('scuola/block/mainstory')}...</a>
                        </div>
                    </div>

<!-- BLOCK: END -->

{undef $node}