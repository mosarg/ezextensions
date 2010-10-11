{* laboratory line- embed view *}
<div class="laboratory_line">
    <h2 class="titleimage"><a href={$node.url_alias|ezurl}>
    {if $node.data_map.logo.has_content}
      <img alt="logo_laboratorio" class="shadowmore" src={$node.data_map.logo.content[blockmenu].url|ezroot} />
    {/if}
     </a>
     </h2>
    {if $node.data_map.intro.has_content}
    <div class="attribute-short">
       <h2> <a href={$node.url_alias|ezurl}>{"Laboratorio"|i18n("design/m2000/full/progetto")} {$node.data_map.title.content|wash}</a></h2> <br/>
        {attribute_view_gui attribute=$node.data_map.intro}</div>
    {/if}
 </div>
