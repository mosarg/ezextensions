{* progetto block view *}

<div class="progetto-class">
    <div class="attribute-header">
            <h2 class="rounded"><a href={$node.url_alias|ezurl}>
             {$node.data_map.title.content|wash}</a></h2>
    </div>
    
    {if $node.data_map.intro.has_content}
        <div class="attribute-short">
            {if $node.data_map.logo.has_content}
            <img alt="logo_progetto" src={$node.data_map.logo.content[$image_class].url|ezroot} />
            {/if}
            {$node.data_map.intro.data_text|strip_tags()|shorten(140)}
        </div>
     {/if}
    <span class="small_subtitle">{"Codice progetto: "|i18n("design/m2000/full/progetto")}{$node.data_map.codice_progetto.content|wash}</span>

</div>
{undef}