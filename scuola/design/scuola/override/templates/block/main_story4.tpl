    {def $node = $block.valid_nodes[0]}
<!-- BLOCK: START -->
<div class="block-type-mainstory block-view-{$block.view}">
            <div class="columns-two">
                <div class="col-1">
                    <div class="col-content">
                       <div class="border-content">
                                <div class="attribute-image">{attribute_view_gui attribute=$node.data_map.image image_class='mainstory3'}</div>
                        </div>
                 
                    </div>
                </div>
                <div class="col-2">
                    <div class="col-content">

                        <div class="attribute-header">
                            <h2><a href="{$node.url_alias|ezurl(no)}">{$node.name|wash()}</a></h2>
                        </div>

                        <div class="attribute-short">
                            {$node.data_map.intro.content.output.output_text||smartshort(500,'...')}
                        </div>
                        <div class="read-on">
                             <a href={$node.url_alias|ezurl()}>{'Continua'|i18n('scuola/block/mainstory')}...</a>
                        </div>
                    </div>
                </div>
            </div>
  {include uri='design:parts/object_informations.tpl'} 
</div>
<!-- BLOCK: END -->

{undef $node}