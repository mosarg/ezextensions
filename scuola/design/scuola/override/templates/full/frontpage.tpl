{* Frontpage - Full view *}
{scuolapagedata_set( 'left_menu', false() )}
{scuolapagedata_set( 'extra_menu', false() )}


<div class="content-view-full">
    <div class="class-frontpage">
{if $node.object.state_id_array|contains('6')}
        <div class="wip rounded shadowmore">
            <p>{"Contenuto in preparazione non ancora visibile pubblicamente"|i18n('scuola/state')}</p>
        </div>
        {/if}
{if is_set($node.object.data_map.fondo)}
<div class="custom-content">
{attribute_view_gui attribute=$node.object.data_map.fondo}
</div> 
{/if}
    <div class="attribute-page">
    {attribute_view_gui attribute=$node.object.data_map.page}
   </div>

    </div>
</div>