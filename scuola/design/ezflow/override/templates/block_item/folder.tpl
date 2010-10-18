    {* Folder - Block view *}

    <div class="class-folder">
        <div class="attribute-header">
            <h2 class="rounded"><a href={$node.url_alias|ezurl}>{$node.name|wash()}</a></h2>
        </div>
        {if $node.data_map.short_description.has_content}
                <div class="attribute-short">
                {if $node.data_map.icon.has_content}
                <div class="image">
                    <img alt="folder" src={$node.data_map.icon.content[$image_class].url|ezroot} />
                </div>
            {/if}

                    {$node.data_map.short_description.data_text|strip_tags()|shorten(140)}
                </div>
        {/if}




    </div>
