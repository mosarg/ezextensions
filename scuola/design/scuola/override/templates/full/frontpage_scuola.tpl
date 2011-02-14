{* Frontpage scuola - Full view *}

{include uri='design:parts/global_variables.tpl' left_menu=false() left_nav_menu=false()}


<div class="content-view-full">
 <div class="class-frontpage_scuola">
     {if $node.object.state_id_array|contains('6')}
        <div class="wip rounded shadowmore">
            <p>{"Contenuto in preparazione non ancora visibile pubblicamente"|i18n('scuola/state')}</p>
        </div>
        {/if}
     {if $node.data_map.title.has_content}
        <div class="attribute-header">
            <h1>{$node.data_map.title.content|wash()}</h1>
        </div>
        {/if}
        <div class="informations">
        {if is_set($node.data_map.coordinatore)}
        <div class="responsabile">
         <h3>{"Coordinatore di sede"|i18n('scuola/frontpage')}</h3>
         {attribute_view_gui attribute=$node.data_map.coordinatore path=$node.url_alias}
        </div>
        {/if}
        {if $node.data_map.codice_meccanografico.has_content}
            <div class="meccanografico">
                <h3>Codice Meccanografico</h3>
                {$node.data_map.codice_meccanografico.content}
            </div>
        {/if}
        </div>
        
         <div class="attribute-image">
        <div class="shadow" >{attribute_view_gui attribute=$node.data_map.foto_scuola link_class=ezimage_zoom href=$node.data_map.foto_scuola.content[original].url|ezroot image_class=large}</div>
         </div>
        <div class="attribute-short">
          <div>{attribute_view_gui attribute=$node.data_map.descrizione}</div>
     </div>
        
   




{if is_set($node.object.data_map.page)}
    <div class="attribute-page">
        {attribute_view_gui attribute=$node.object.data_map.page}
    </div>
{/if}

{if is_set($node.object.data_map.fondo)}
    <div class="frontpage-footer">
         {attribute_view_gui attribute=$node.object.data_map.fondo}
    </div>
{/if}

 </div>
</div>