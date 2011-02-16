{* ufficio icon- embed view *}

<div class="content-view-line">
<div class="class-ufficio">
   <h2 class="line-header-common"><a href={$node.url_alias|ezurl}>{$node.data_map.name.content}
    {if $node.data_map.logo.has_content}
      <img alt="logoufficio" src={$node.data_map.logo.content[blockgallery1].url|ezroot} />
    {/if}
   </a></h2>

</div>
    <div class="title-separator"></div>
</div>
{undef}