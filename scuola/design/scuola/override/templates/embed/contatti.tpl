{* contatti - embed view *}

{if is_set($style)|not()}
    {def $style='full'}
{/if}
    

{include uri='design:parts/global_variables.tpl' left_menu=false() left_nav_menu=false() extra_menu=false()}

<div class="content-view-embed">
    <div class="class-contatti">
        <table class="list" cellspacing="0">
            {if $node.data_map.contatti_esterni.has_content}
            {attribute_view_gui attribute=$node.data_map.contatti_esterni subview=table_less}
            {/if}
            {if $node.data_map.contatti_interni.has_content}
            {attribute_view_gui attribute=$node.data_map.contatti_interni subview=agenda_list}

            {/if}
        </table>
    </div>


</div>