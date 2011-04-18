{* Folder - Line view *}

<div class="content-view-line">
    <div class="class-dmsfolder">
       <h2><a href={$node.url_alias|ezurl}>{$node.name|wash()} |</a></h2>
       {if $node.data_map.short_description.has_content}
        <div class="attribute-short">
        {$node.data_map.short_description.content.output.output_text|strip_tags()|shorten(50)}
        </div>
       {/if}
        {if $node.data_map.icon.has_content}
        <img alt="folder" src={$node.data_map.icon.content[colorblock].url|ezroot} />
         {/if}
    </div>
    
</div>
