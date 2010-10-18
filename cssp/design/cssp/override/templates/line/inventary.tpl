{* inventary - Line view *}
 <div class="inventary-line">
        <a href={$node.url_alias|ezurl} >
            {attribute_view_gui attribute=$node.data_map.icon image_class='square'}
            <span>{$node.name}</span>
        </a>
        
 </div>

