{scuolapagedata_set( 'left_menu', $left_menu )}
{scuolapagedata_set( 'left_nav_menu', $left_nav_menu )}

{if is_set($no_class_menu)}
    {scuolapagedata_set( 'no_class_menu', $no_class_menu)}
{/if}

{if is_set($extra_menu)|not()}

    {def $global_layout_class=fetch('content','list_count',hash(parent_node_id,$node.node_id,
                                    class_filter_type, "include",
                                    class_filter_array, array('infobox','global_layout')))}
    {if gt($global_layout_class,0)}
        {scuolapagedata_set( 'extra_menu', true() )}
    {else}
        {scuolapagedata_set( 'extra_menu', false() )}
    {/if}
{else}
    {scuolapagedata_set( 'extra_menu', $extra_menu)}
{/if}