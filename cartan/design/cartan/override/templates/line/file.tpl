{* File - Line view *}


{if is_set($size)|not()}
     {def $size='simple'}
{/if}

<div  style="clear:both;" class="content-view-line" title="{$node.name}">
 <div class="class-file">
    

    <div class="attribute-file">
          <a href={$node.url_alias|ezurl}>
              <img alt="zoom" src={concat('images/icons/zoom_',$size,'.png')|ezdesign}/>
           </a>
           <p>{attribute_view_gui attribute=$node.data_map.file  file_name=$node.name }</p>
           {if $size|eq('simple')}
           <p title="time_{$node.object.modified}" class="time">
              {'Modificato il: '|i18n('scuola/design/files')}{$node.object.modified|datetime('custom','%h:%m %a %d %F %Y')}
           </p>
           {/if}
           
    </div>
        
    </div>
</div>
