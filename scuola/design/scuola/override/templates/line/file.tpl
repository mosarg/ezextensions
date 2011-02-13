{* File - Line view *}

<div  style="clear:both;" class="content-view-line" title="{$node.name}">
    <div class="class-file">
        <div class="attribute-description">
            {if $node.data_map.description.has_content}
            <h2 ><a href={$node.url_alias|ezurl}>{$node.name}</a></h2>
                {attribute_view_gui attribute=$node.data_map.description}
            {/if}
        </div>

    <div class="attribute-file">
           <a href={$node.url_alias|ezurl}>
              <img alt="zoom" src={'images/icons/zoom.png'|ezdesign}/>
           </a>
           <p>{attribute_view_gui attribute=$node.data_map.file icon_size='small' file_name=$node.name icon_title=$node.name icon='yes'}</p>
           <p title="time_{$node.object.modified}" class="time">
              {'Modificato il: '|i18n('scuola/design/files')}{$node.object.modified|datetime('custom','%h:%m %a %d %F %Y')}
           </p>
          
    </div>
        
    </div>
</div>
