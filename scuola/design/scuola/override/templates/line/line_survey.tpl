{* Survey - Line view *}

<div class="content-view-line">
    <div class="class-survey">

      <h2 class="rounded"><a href={$node.url_alias|ezurl}>{$node.name|wash()} ></a></h2>
        
        {if $node.data_map.descrizione.has_content}
            <div class="attribute-short">
                {if $node.data_map.logo.has_content}
                    <img alt="folder" src={$node.data_map.logo.content[colorblock].url|ezroot} />
                {/if}
                {attribute_view_gui attribute=$node.data_map.descrizione}
            </div>
        {/if}
        
    </div>
</div>
