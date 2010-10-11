{ezpagedata_set( 'left_menu', $left_menu )}
{ezpagedata_set( 'left_nav_menu', $left_nav_menu )}

{def $global_layout_class=fetch('content','list_count',hash(parent_node_id,$node.node_id,
                                    class_filter_type, "include",
                                    class_filter_array, array('infobox','global_layout')))}
{if gt($global_layout_class,0)}
    {ezpagedata_set( 'extra_menu', true() )}
{else}
    {ezpagedata_set( 'extra_menu', false() )}
{/if}