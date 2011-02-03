{* Dmsfolder - Line view *}

<div class="content-view-line">
    <div class="class-dmsfolder">
        <a href={$node.url_alias|ezurl}>
        <!--<img alt="folder" src={'icons/folder_pelle_smaller.png'|ezimage()}/>-->
        {$node.name|wash()}
        </a>
     
      {if $node.data_map.short_description.has_content}
        <div class="attribute-short">
        {attribute_view_gui attribute=$node.data_map.short_description}
        </div>
       {/if}
    </div>


</div>
