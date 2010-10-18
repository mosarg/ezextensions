{* Folder - Line view *}

<div class="content-view-line">
    <div class="class-dmsfolder">

        <h2 class="rounded"><a href={$node.url_alias|ezurl}>{$node.name|wash()} ></a></h2>

       {if $node.data_map.short_description.has_content}
        <div class="attribute-short">
        {attribute_view_gui attribute=$node.data_map.short_description}
        </div>
       {/if}
        {if $node.data_map.icon.has_content}
        <img alt="folder" src={$node.data_map.icon.content[colorblock].url|ezroot} />
         {/if}
    </div>
</div>
