{* Flash player - galleryline  view *}

<div class="content-view-galleryline">
    <div class="class-flash">

     <a href={$node.url_alias|ezurl}><img class="shadowmore thumbnail" alt="thumb"  src={$node.data_map.file.content.filepath|flvpreview('150','150','200')|ezroot}/></a>

    <div class="attribute-name">
        <p>{$node.name|shorten(14)|wash}</p>
    </div>
  
   </div>
</div>

