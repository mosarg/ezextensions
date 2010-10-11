{* Flash player - block  view *}

{def $filters = ezini( $image_class, 'Filters', 'image.ini' )}

                {foreach $filters as $filter}
                   {if or($filter|contains( "geometry/scale" ), $filter|contains( "geometry/scaledownonly" ), $filter|contains( "geometry/crop" ) )}
                      {def $image_style = $filter|explode("=").1
                          $width = $image_style|explode(";").0
                          $height = $image_style|explode(";").1}
                      {break}
                   {/if}
                {/foreach}
<div class="content-view-galleryline">
    <div class="class-flash">

     <a href={$node.url_alias|ezurl}><img class="shadowmore thumbnail" alt="thumb"  src={$node.data_map.file.content.filepath|flvpreview($width,$height,'200')|ezroot}/></a>

    <div class="attribute-name">
        <p>{$node.name|shorten(14)|wash}</p>
    </div>
  
   </div>
</div>

