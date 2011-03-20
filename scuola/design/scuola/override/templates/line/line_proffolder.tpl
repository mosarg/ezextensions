{* proffolder - Line view *}



<div class="content-view-line">
    <div class="class-proffolder">
      {def $prof_object=fetch( 'content', 'reverse_related_objects',
                     hash( 'object_id',$node.contentobject_id) )}
        <div class="attribute-image">
            {if $prof_object[0].data_map.image.has_content}
                {attribute_view_gui attribute=$prof_object[0].data_map.image image_css_class='shadow'  href=$node.url_alias|ezroot image_class=gallerythumbnailsquare}
          {else}
         <div class="user-icon"></div>
      {/if}
      </div>
      <div><h4><a href={$node.url_alias|ezurl}>{$node.name|wash()}</a></h4></div>
    
    {if $node.data_map.telefono.has_content}
      <div class="phone">
          {$node.data_map.telefono.content}
      </div>
     {else}<div></div>{/if} 
       
      {if $node.data_map.email.has_content}
       <div class="email">
          {$node.data_map.email.content}
         </div>
       {else}<div></div>{/if}
       
       {if $node.data_map.materie.has_content}  
        <div class="subject">
              {attribute_view_gui attribute=$node.data_map.materie}
         </div>
      {else}<div></div>{/if}
    </div>
</div>
