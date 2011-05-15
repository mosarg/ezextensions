{* Frontpage - Full view *}


{run-once}
 {ezscript_require( array('classes/equalize_blocks.js','init_equalize_blocks.js'))}
{/run-once}


{include uri='design:parts/global_variables.tpl' left_menu=false() left_nav_menu=false()}

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