{def $valid_nodes = $block.valid_nodes}

<div class="block-type-4items  block-view-{$block.view}">

<div class="two-columns">
<div class="column-1 grey_back1 shadow">
<div class="column-content">


<a href={$valid_nodes[0].url_alias|ezurl()}>{$valid_nodes[0].name}</a>
</div>
</div>
<div class="column-2 orange_back1 shadow">
<div class="column-content">




<a href={$valid_nodes[1].url_alias|ezurl()}>{$valid_nodes[1].name}</a>





</div>
</div>
</div>

<br />

<div class="two-columns">
<div class="column-1 grey_back2 shadow">
<div class="column-content">


<a href={$valid_nodes[2].url_alias|ezurl()}>{$valid_nodes[2].name}</a>




</div>
</div>
<div class="column-2 red_back1 shadow">
<div class="column-content">

<a href={$valid_nodes[3].url_alias|ezurl()}>{$valid_nodes[3].name}</a>

</div>
</div>
</div>

</div>

{undef $valid_nodes}