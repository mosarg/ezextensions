{* Gallery - Line view *}
<div class="content-view-line">
    <div class="class-gallery">
   {if $node.data_map.gallery_image.has_content}
   <div class="gallery-icon">
     
       {def $gallery_relation=$node.data_map.gallery_image.content.relation_list[0]
             $gallery_image=fetch(content,object,hash(object_id,
             $gallery_relation.contentobject_id,object_version,$gallery_relation.contentobject_version))}
        <img alt="gallery_image" class="shadow" src={$gallery_image.data_map.image.content[folderthumbnail].url|ezroot} />
        
   </div>
   {/if}
    <div class="attribute-short">
      <h3><a href={$node.url_alias|ezurl}>{$node.name|wash()}</a></h3>
         {attribute_view_gui attribute=$node.data_map.short_description}
    </div>
    </div>

</div>
{undef}