{* Dmsfolder - Line view *}

<div class="content-view-line">
    <div class="class-dmsfolder" alt="{$node.data_map.short_description.content}">
        <a href={$node.url_alias|ezurl} >
        <img alt="folder" src={'icons/folder_smallest.png'|ezimage()}/>
        {$node.name|wash()}
        </a>
 
    </div>


</div>
