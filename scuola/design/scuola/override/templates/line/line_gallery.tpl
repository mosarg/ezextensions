{* Folder - Line view *}

{if is_set($imagesize)|not()}
    {def $imagesize='large'}
{/if}
<div class="content-view-line">

{if and(is_set($style),eq($style,'big'))}
    <div class="class-gallery">

   {if $node.data_map.gallery_image.has_content}
   <div class="gallery-icon">
        {def $gallery_relation=$node.data_map.gallery_image.content.relation_list[0]
         $gallery_image=fetch(content,object,hash(object_id,
         $gallery_relation.contentobject_id,object_version,$gallery_relation.contentobject_version))}
        <img alt="gallery_image" class="shadow" src={$gallery_image.data_map.image.content[blockmenubig].url|ezroot} />
    </div>
{/if}
    <div class="attribute-short">
        <h2><a href={$node.url_alias|ezurl}>{$node.name|wash()}</a></h2>
    
         {attribute_view_gui attribute=$node.data_map.short_description}
    </div>


    </div>
{else}
<div class="content-view-line">
 <div class="class-gallery">
   <h2 class="line-header-common"><a href={$node.url_alias|ezurl}>{$node.data_map.name.content|wash}</a></h2>
     <div class="attribute-image">
      {if $node.data_map.icon.has_content}
         <img alt="folder" src={$node.data_map.icon.content[$imagesize].url|ezroot} />
      {/if}
     </div>
    <div class="attribute-short">
       {$node.data_map.short_description.content.output.output_text|smartshort(150,'...')}
    </div>
    </div>
     <div class="read-on">
        <a href={$node.url_alias|ezurl()}>{'Continua'|i18n('scuola/block/mainstory')}...</a>
    </div>
        
    {include uri='design:parts/object_informations.tpl' style=$style}
</div>
{/if}
</div>
{undef}