{def $valid_nodes = $block.valid_nodes}

<div class="block-type-3items block-view-{$block.view}">
  

{if $block.name|preg_match('/notitle/')|not()}
 <div class="attribute-header-block"><h2>{$block.name}</h2></div>
{/if}    

{foreach $valid_nodes as $node}
<div class="class-generic float-break">
 {include uri='design:parts/object_informations.tpl' style='block'}
  <h2 >
      <a href={$node.url_alias|ezurl()}>{$node.name|shorten(40)}</a>
  </h2>
  <div class="read-on">
      <a href={$node.url_alias|ezurl()}>></a>
  </div>
</div>

{/foreach}

</div>

{undef $valid_nodes}