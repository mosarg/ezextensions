{* progetto block view *}
{if is_set($style)|not()}
    {def $style='compact'}
{/if}
<div class="class-progetto">
    <div class="attribute-header">
            <h2><a href={$node.url_alias|ezurl}>
             {$node.data_map.title.content|wash}</a></h2>
    </div>
    <div class="attribute-image">
         {if $node.data_map.image.has_content}
            <img alt="logo_progetto" src={$node.data_map.image.content[$image_class].url|ezroot} />
            {/if}
    </div>
    {if $node.data_map.intro.has_content}
        <div class="attribute-short">
           {$node.data_map.intro.content.output.output_text|smartshort(180,'...')}
            
        </div>
     {/if}
    <span class="small_subtitle">{"Codice progetto: "|i18n("design/m2000/full/progetto")}{$node.data_map.codice_progetto.content|wash}</span>
 <div class="read-on">
        <a href={$node.url_alias|ezurl()}>{'Continua'|i18n('scuola/block/mainstory')}...</a>
    </div>
    {include uri='design:parts/object_informations.tpl' style=$style}
</div>
{undef}