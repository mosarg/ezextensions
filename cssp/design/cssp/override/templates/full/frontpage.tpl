{* Blog - Full view *}



{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}

<div class="content-view-full">
    <div class="class-frontpage">

    {if is_set($node.object.data_map.descrizione)}
        <div class="custom-content">
            {attribute_view_gui attribute=$node.object.data_map.descrizione}
        </div>
    {/if}

    <div class="attribute-page">
    {attribute_view_gui attribute=$node.object.data_map.page}

   </div>
   {if is_set($node.object.data_map.fondo)}
        <div class="custom-content">
            {attribute_view_gui attribute=$node.object.data_map.fondo}
        </div> 
    {/if}


   </div>
</div>