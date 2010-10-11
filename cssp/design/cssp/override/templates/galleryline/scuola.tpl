{* Scuola - GalleryLineview *}
    <div class="content-view-line">

    <div class="class-scuola">

     <div class="upper_block">
          <h2><a href={$node.url_alias|ezurl}>{$node.data_map.denom_istituzione.content|wash}</a></h2>


        {if $node.data_map.image.has_content}
                <div class="immagine_scuola">
                    {attribute_view_gui attribute=$node.data_map.image image_class=medium}
                </div>
        {/if}

        <div class="meccanografico">
                <h2> Codice meccanografico: {$node.data_map.meccanografico_scuola.content}</h2>
        </div>
            
        <div class="tipologia">
                <h2>Tipologia: {attribute_view_gui attribute=$node.data_map.tipo}</h2>
        </div>

         
        </div>
       

 

       {if $node.data_map.body.content.is_empty|not}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.body}
            </div>
       {/if}

        
        </div>
    </div>


