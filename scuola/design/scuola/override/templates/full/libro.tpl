{* libro - Full view *}

{include uri='design:parts/global_variables.tpl' left_menu=true() left_nav_menu=true() extra_menu=false()}


<div class="border-box">
<div class="content-view-full">
    <div class="class-libro">

        <div class="attribute-header">
            <h1>{$node.name|wash}</h1>
        </div>
        {if $node.data_map.autori.has_content}
            <div class="attribute-autori">
                {attribute_view_gui attribute=$node.data_map.autori}
            </div>
        {/if}
        {if $node.data_map.editore.has_content}
            <div class="attribute-editore">
                {attribute_view_gui attribute=$node.data_map.editore}
            </div>
        {/if}

        {if $node.data_map.copertina.has_content}
            <div class="attribute-copertina">
                {attribute_view_gui attribute=$node.data_map.copertina}
            </div>
        {/if}

       {if $node.data_map.descrizione.has_content}
            <div class="attribute-descrizione">
                {attribute_view_gui attribute=$node.data_map.descrizione}
            </div>
        {/if}

        {if $node.data_map.isbn.has_content}
        <div class="attribute-isbn">
            {attribute_view_gui attribute=$node.data_map.isbn}
        </div>
        {/if}

    </div>
</div>
</div>