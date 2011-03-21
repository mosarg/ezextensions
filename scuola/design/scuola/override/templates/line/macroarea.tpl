{* macroarea - Line view *}

<div class="content-view-line">
<div class="class-macroarea">
    <h2 class="line-header-common"><a href={$node.url_alias|ezurl}>{$node.data_map.name.content|wash}</a></h2>
  
      <div class="image-block">  
     {if $node.data_map.logo.has_content}
        <div class="attribute-image">
            {attribute_view_gui image_class='gallerythumbnailsquare' href=$node.url_alias|ezurl attribute=$node.data_map.logo}
        </div>
     {/if}
     {if $node.data_map.logo1.has_content}
        <div class="attribute-image">
            {attribute_view_gui image_class='gallerythumbnailsquare' href=$node.url_alias|ezurl attribute=$node.data_map.logo1}
        </div>
     {/if}
     {if $node.data_map.logo2.has_content}
        <div class="attribute-image">
            {attribute_view_gui image_class='gallerythumbnailsquare' href=$node.url_alias|ezurl attribute=$node.data_map.logo2}
        </div>
     {/if}
      </div>
    {if $node.data_map.descrizione.content.is_empty|not}
    <div class="attribute-short">
       {$node.data_map.descrizione.content.output.output_text|smartshort(150,'...')}
    </div>
    {/if}
    <span class="small_subtitle"> {"Referente macroarea"|i18n("design/m2000/full/progetto")}: {attribute_view_gui attribute=$node.data_map.referente}</span> 
    {include uri='design:parts/object_informations.tpl'}
     <div class="read-on">
        <a href={$node.url_alias|ezurl()}>{'Continua'|i18n('scuola/block/mainstory')}...</a>
    </div>
    </div>
    
</div>