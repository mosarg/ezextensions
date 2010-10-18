{def $global_layout_class=fetch('content','list',hash(parent_node_id,$module_result.node_id,
                                    class_filter_type, "include",
                                    class_filter_array, array('infobox','global_layout')))}

{if gt($global_layout_class|count,0)}

<div class="border-box">

{foreach $global_layout_class as $info_col}
<div id="sepinfo" class="infosep">
{if eq($info_col.class_identifier,'infobox')}
    <div class="border-content column-info">
    {node_view_gui content_node=$info_col view='infobox'}
    </div>
{else}
    <div class="border-content global-info">
        {attribute_view_gui attribute=$info_col.data_map.page}
    </div>
{/if}


</div>
{/foreach}
</div>

{if or( $info_col.can_edit, $info_col.can_remove )}
    <div class="controls">
        <form action={"/content/action"|ezurl} method="post">
        {if $info_col.can_edit}
            <input type="image" name="EditButton" src={"icons/pencil_small.png"|ezimage} alt="Edit" />
            <input type="hidden" name="ContentObjectLanguageCode" value="{$info_col.object.current_language}" />
        {/if}
        {if $info_col.can_remove}
            <input type="image" name="ActionRemove" src={"icons/trash_small.png"|ezimage} alt="Remove" />
        {/if}
            <input type="hidden" name="ContentObjectID" value="{$info_col.contentobject_id}" />
            <input type="hidden" name="NodeID" value="{$info_col.node_id}" />
            <input type="hidden" name="ContentNodeID" value="{$info_col.node_id}" />
        </form>
    </div>
{/if}
{/if}

