{* Folder - Line view *}

<div class="content-view-line">
    <div class="class-folder">
        <h2><a href={$node.url_alias|ezurl}>{$node.name|wash()}</a></h2>
       {if $node.data_map.short_description.has_content}
        <div class="attribute-short">
        {* attribute_view_gui attribute=$node.data_map.short_description *}
        </div>
       {/if}
        {if $node.data_map.icon.has_content}
        <a href={$node.url_alias|ezurl}>
        <img class="shadow" alt="folder" src={$node.data_map.icon.content[folderthumbnail].url|ezroot} />
        </a>
         {/if}
    </div>
</div>
