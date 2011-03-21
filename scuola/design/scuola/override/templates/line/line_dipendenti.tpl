{* Dipendenti - Line view *}

<div class="content-view-line">
    <div class="class-dipendenti">

        <h2 class="rounded"><a href={$node.url_alias|ezurl}>{$node.name|wash()}</a></h2>
        {if $node.data_map.logo.has_content}
        <div class="logo">
            <img alt="dipendenti" src={$node.data_map.logo.content[gallerythumbnail].url|ezurl}/>
        </div>
        {/if}
        {if $node.data_map.short_description.has_content}
            <div class="attribute-short">
                {attribute_view_gui attribute=$node.data_map.short_description}
            </div>
       {/if}

    </div>
     <div class="read-on">
        <a href={$node.url_alias|ezurl()}>{'Continua'|i18n('scuola/block/mainstory')}...</a>
    </div>
</div>
