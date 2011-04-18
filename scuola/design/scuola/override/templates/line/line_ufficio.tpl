{* ufficio icon- embed view *}

<div class="content-view-line">
<div class="class-ufficio">
   <h2 class="line-header-common"><a href={$node.url_alias|ezurl}>{$node.data_map.name.content}
    {if $node.data_map.logo.has_content}
      <img alt="logoufficio" src={$node.data_map.logo.content[blockgallery1].url|ezroot} />
    {/if}
   </a></h2>
<div class="title-separator"></div>
    
    {if $node.object.data_map.resp_.has_content}
    <div class="resp_ufficio rounded">
       {"Responsabile ufficio:"|i18n("design/scuola/full/ufficio")}
       {attribute_view_gui attribute=$node.data_map.resp_uff}
    </div>
    {/if}
  
{if $node.object.data_map.description.has_content}
            <div class="attribute-short">
                {$node.data_map.description.content.output.output_text|smartshort(150,'...')}
            </div>
        {/if}
 <div class="read-on">
        <a href={$node.url_alias|ezurl()}>{'Continua'|i18n('scuola/block/mainstory')}...</a>
    </div>   
</div>
      

</div>
{undef}