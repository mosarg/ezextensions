{* Article - block item view *}

{if is_set($style)|not()}
    {def $style='compact'}
{/if}

<div class="class-article">
   <div class="attribute-header">
      <h2 >
         <a href={$node.url_alias|ezurl()}>{$node.name|wash()}</a>
      </h2>
   </div>
     {if $node.data_map.image.has_content}
            <div class="attribute-image">
                {attribute_view_gui attribute=$node.data_map.image image_class=$image_class}
            </div>
     {/if}
    <div class="attribute-short">
        
    {$node.data_map.intro.content.output.output_text|smartshort(100,'...')|pad(100,' ')}
    
    
        </div>
    <div class="read-on">
        <a href={$node.url_alias|ezurl()}>{'Continua'|i18n('scuola/block/mainstory')}...</a>
    </div>
{include uri='design:parts/object_informations.tpl' style=$style}
</div>