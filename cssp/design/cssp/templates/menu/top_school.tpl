<div class="schoolmenu-design">
    <!-- This menu is used to show school tabs -->
    <!-- School menu content: START -->
    <ul>
    
    {def $root_node=fetch( 'content', 'node', hash( 'node_id', $indexpage ) )
         $top_menu_items=fetch( 'content', 'list', hash( 'parent_node_id', 2,
                                                         'sort_by', array( 'priority', true() ),
                                                         'class_filter_type', 'include',
                                                         'class_filter_array', array('frontpage_corsi','school_front') ) )
         $top_menu_items_count = $top_menu_items|count()
         $item_class = array()}


   {if is_set($pagerootdepth)}
   {def $current_node_in_path = cond(and($current_node_id, gt($module_result.path|count, $pagerootdepth)), $module_result.path[$pagerootdepth].node_id, 0  )}
   {else}
   {def $current_node_in_path = $current_node_id}
   {/if}


    {if $top_menu_items_count}
       {foreach $top_menu_items as $key => $item}
            {set $item_class = cond($current_node_in_path|eq($item.node_id), array("selected"), array())}
            {if $key|eq(0)}
                {set $item_class = $item_class|append("firstli")}
            {/if}
            {if $top_menu_items_count|eq( $key|inc )}
                {set $item_class = $item_class|append("lastli")}
            {/if}
            {if $item.node_id|eq( $current_node_id )}
                {set $item_class = $item_class|append("current")}
            {/if}
	    	

            {if eq( $item.class_identifier, 'school_front')}
                    <li  id="node_id_{$item.node_id}"{if $item_class} class="{$item_class|implode(" ")}"{/if}><a class="sch_button alternative" href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item.node_id)|ezurl}{else}{$item.url_alias|ezurl}{/if}{if eq( $ui_context, 'edit' )} onclick="return false;"{/if}><span>{$item.name|wash()}</span></a></li>
            {else}
                    <li  id="node_id_{$item.node_id}"{if $item_class} class="{$item_class|implode(" ")}"{/if}><a class="sch_button" href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item.node_id)|ezurl}{else}{$item.url_alias|ezurl}{/if}{if eq( $ui_context, 'edit' )} onclick="return false;"{/if}><span>{$item.name|wash()}</span></a></li>
            {/if}
          {/foreach}
    {/if}
    {undef  $top_menu_items $item_class $top_menu_items_count $current_node_in_path}
    </ul>
    <!-- School menu content END -->
</div>