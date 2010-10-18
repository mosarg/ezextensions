{* proffolder - Line view *}

<div class="content-view-line">
    <div class="class-proffolder">
      {def $prof_object=fetch( 'content', 'reverse_related_objects',
                     hash( 'object_id',$node.contentobject_id) )}

        <div class="prof_picture">

      {if $prof_object[0].data_map.image.has_content}
      <img alt="prof-avatar" src={$prof_object[0].data_map.image.content[colorblock].url|ezurl}/>
      {else}
      <div class="prof-icon"></div>

      {/if}
      </div>
      <h4><a href={$node.url_alias|ezurl}>{$node.name|wash()}</a></h4>

      <div class="attribute-short telefono">
        {if $node.data_map.telefono.has_content}
        <span>  {$node.data_map.telefono.content}</span>
        {/if}
       </div>
       <div class="attribute-short email">
         {if $node.data_map.email.has_content}
         <span>{$node.data_map.email.content}</span>
             {/if}
       </div>
       <div class="attribute-short ruolo">
       {if $node.data_map.ruolo.has_content}
       <span>{$node.data_map.ruolo.content}</span>
       {/if}
       </div>
    </div>
</div>
