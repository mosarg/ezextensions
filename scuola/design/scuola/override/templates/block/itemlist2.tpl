{def $valid_nodes = $block.valid_nodes}

<div class="block-type-itemlist">

{if $block.name|preg_match('/notitle/')|not()}
 <div class="attribute-header-block"><h2>{$block.name}</h2></div>
{/if}

<div class="two-columns">
<div class="col-1">

    <ul>
    {foreach $valid_nodes as $valid_node max 6}
       <li><a href={$valid_node.url_alias|ezurl()}>{$valid_node.name|wash()}</a></li>
    {/foreach}
    </ul>


</div>
<div class="col-2">


    <ul>
    {foreach $valid_nodes as $valid_node offset 6}
       <li><a href={$valid_node.url_alias|ezurl()}>{$valid_node.name|wash()}</a></li>
    {/foreach}
    </ul>

</div>
</div>



</div>

<!-- BLOCK: END -->

{undef $valid_nodes}