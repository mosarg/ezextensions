{* Helper prof - Full view *}
<div class="border-box">

<div class="helper_prof content_view_full">
    <div class="class-folder">

        <div class="attribute-header">
{if or( $node.object.can_edit, $node.object.can_remove )}
    <div class="controls">
        <form action={"/content/action"|ezurl} method="post">
        {if $node.object.can_edit}
            <input type="image" name="EditButton" src={"edit-infobox-ico.gif"|ezimage} alt="Edit" />
            <input type="hidden" name="ContentObjectLanguageCode" value="{$node.object.current_language}" />
        {/if}
        {if $node.object.can_remove}
            <input type="image" name="ActionRemove" src={"trash-infobox-ico.gif"|ezimage} alt="Remove" />
        {/if}
            <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
            <input type="hidden" name="NodeID" value="{$node.node_id}" />
            <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
        </form>
    </div>
{/if}
        </div>
       
       {if $node.object.data_map.parlorhour.has_content}
        <div class="attribute-byline">
            <h3>{"Ricevimento"|i18n("design/m2000/full/helper_prof")}:</h3>
           {attribute_view_gui attribute=$node.data_map.parlorday}  {attribute_view_gui attribute=$node.data_map.parlorhour}
          </div>
        {/if} 
        {if $node.object.data_map.parlornote.has_content}
         <div class="attribute-byline">
                <h3>{"Note:"|i18n("design/m2000/full/helper_prof")}</h1>
                {attribute_view_gui attribute=$node.data_map.parlornote}
         </div>
       {/if}
        <div class="attribute-byline">
            {if $node.object.data_map.orario.has_content}
                <div>
                    {attribute_view_gui attribute=$node.data_map.orario}
                </div>
             {/if}
        </div>
      
    </div>
</div>


</div>