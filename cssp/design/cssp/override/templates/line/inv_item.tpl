{* inventary - Line view *}
 <div class="inv_item-line">
     <div class="attribute-image">
        <a href={$node.url_alias|ezurl} >
            {attribute_view_gui attribute=$node.data_map.image image_class='square'}
        </a>
     </div>
     <div class="attribute-group">
         <div class="attribute-short">
             <a href={$node.url_alias|ezurl()}>{$node.name}</a>
         </div>
         <div class="attribute-long">
             {attribute_view_gui attribute=$node.data_map.description}
         </div>
     </div>


        
 </div>

