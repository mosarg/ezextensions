{* Scuola - Line view *}
    <div class="content-view-line">

        <div class="class-scuola">

     
        <div class="attribute-header">
            <h2><a href={$node.url_alias|ezurl()}>{$node.data_map.denom_istituzione.content|wash()}</a></h2>
        </div>
       
        <div class="meccanografico">
               {$node.data_map.meccanografico_scuola.content}
        </div>

        </div>
    
    </div>


