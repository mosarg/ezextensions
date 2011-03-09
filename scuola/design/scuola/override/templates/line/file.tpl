{* File - Line view *}

<div  style="clear:both;" class="content-view-line" title="{$node.name}">
   <div class="class-file">
       
        

    <div class="attribute-file">
           <a href={$node.url_alias|ezurl}>
              <img alt="zoom" src={'images/icons/zoom.png'|ezdesign}/>
           </a>
           <p>{attribute_view_gui attribute=$node.data_map.file file_name=$node.name icon_title=$node.name|shorten(10)}</p>
          
           <p class="time">
              {'Modificato il: '|i18n('scuola/design/files')}{$node.object.modified|datetime('custom','%h:%m %a %d %F %Y')}
           </p>
           {if is_set($extra_info)}
            <p class="extra_info">{$node.parent.name}</p>
          {/if}
          {if $node.data_map.description.has_content}
          <div class="attribute-description">
                {attribute_view_gui attribute=$node.data_map.description}
           </div>
          {/if}    
    </div>
        
    </div>
</div>
