{* ufficio icon- embed view *}
<div class="circolari_icon rounded shadowmore">
      <a href={$node.url_alias|ezurl}>
          <h2>{"Circolari "|i18n("design/m2000/full/circolari")} {$node.name}</h2>
    {if is_set($node.data_map.logo)}
      <img src={$node.data_map.logo.content[blockmenubig].url|ezroot} /></a>
    {/if}
</div>

{undef}