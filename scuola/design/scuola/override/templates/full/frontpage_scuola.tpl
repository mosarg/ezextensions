{* Frontpage scuola - Full view *}

{include uri='design:parts/global_variables.tpl' left_menu=false() left_nav_menu=false()}





<div class="content-view-full">
 <div class="class-frontpage_scuola">
     {if $node.object.state_id_array|contains('6')}
        <div class="wip rounded shadowmore">
            <p>{"Contenuto in preparazione non ancora visibile pubblicamente"|i18n('scuola/state')}</p>
        </div>
        {/if}
     <div class="frontpage_header">
         <div class="foto">
         <img class="shadowmore" src= {$node.object.data_map.foto_scuola.content[scuola].url|ezroot} alt="foto_scuola"/>
         </div>
         <div>{$node.data_map.descrizione.content.output.output_text}</div>
     </div>
{if is_set($node.data_map.coordinatore)}
      <div class="responsabile rounded">
         <h3>{"Coordinatore di sede: "|i18n('scuola/frontpage')}</h3>
         <p>{attribute_view_gui attribute=$node.data_map.coordinatore path=$node.url_alias}</p>
         </div>
{/if}

{if $node.data_map.codice_meccanografico.has_content}
<div class="meccanografico">
    <h3>Codice Meccanografico: </h3> 
    <p>{$node.data_map.codice_meccanografico.content}</p>
        
    
</div>
{/if}

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