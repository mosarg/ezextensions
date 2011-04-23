{def $valid_nodes = $block.valid_nodes}

<!-- BLOCK: START -->

<div class="block-type-itemlist">
{if $block.name|preg_match('/notitle/')|not()}
 <div class="attribute-header-block"><h2>{$block.name}</h2></div>
{/if}

<div class="block-content">
    <ul>
    {foreach $valid_nodes as $valid_node}
       <li><a href={$valid_node.url_alias|ezurl()}>{$valid_node.name|shorten(40)}</a></li>
    {/foreach}
    </ul>
</div>

</div>

<!-- BLOCK: END -->

{undef $valid_nodes}