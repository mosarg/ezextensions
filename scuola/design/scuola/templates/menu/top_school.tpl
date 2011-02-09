<div class="schoolmenu-design">
    <!-- This menu is used to show school tabs -->
    <!-- School menu content: START -->
   
    {if is_set($pagerootdepth)}
        {def $my_pagerootdepth=$pagerootdepth}
    {else}
        {def $my_pagerootdepth=0}
    {/if}
    {def $root_node=$indexpage
         $top_menu_items=fetch( 'content', 'list', hash( 'parent_node_id', $root_node,
                                                          'sort_by',array('priority',true()),
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', array('school_front','macroarea') ) )
         $top_menu_items_count = $top_menu_items|count()
         $item_class = array()
         $selected_key=''}
       {def $top_menu_items_node_ids=array()}
         {foreach $top_menu_items as $key=>$top_menu_item}
            {if and(is_set($module_result.path[1]),eq($top_menu_item.node_id,$module_result.path[1].node_id) )}
                {def $current_node_in_path=$module_result.path[1].node_id}
                {set $selected_key=$key}
            {/if}
         {/foreach}
    {if $top_menu_items_count}

    {if is_set($current_node_in_path)}
       <ul class="top_school_big">
        {def $current_item=$top_menu_items[$selected_key]}
        {set $top_menu_items=$top_menu_items|remove($selected_key)}
        {set $item_class=array("firstli","current")}
            {if eq( $current_item.class_identifier, 'macroarea')}
            
            <li  id="node_id_{$current_item.node_id}"{if $item_class} class="{$item_class|implode(" ")}"{/if}><a class="macro_button_big squareshadow"
                     href={$current_item.url_alias|ezurl}>
                     {if $current_item.data_map.logo.has_content}
                        <img src={$current_item.data_map.logo.content[blockmenubig].url|ezroot}   alt="logo"/>
                     {/if}
                 </a>
                <div class="subtree_title"><p>{$current_item.name|wash}</p></div>
            </li>
             
            {else}
             <li  id="node_id_{$current_item.node_id}"{if $item_class} class="{$item_class|implode(" ")}"{/if}><a class="sch_button_big squareshadow"
                       href={$current_item.url_alias|ezurl}>
                      {if $current_item.data_map.logo.has_content}
                        <img src= {$current_item.data_map.logo.content[blockmenubig].url|ezroot}   alt="logo"/>
                     {/if}
                 </a>
            <div class="subtree_title"><p>{$current_item.name|wash}</p></div>
            </li>
             
             {/if}
        {foreach $top_menu_items as $key => $item}
            {set $item_class=array("micro_tabs")}
            {if $top_menu_items_count|eq( $key|inc )}
                {set $item_class = $item_class|append("lastli")}
            {/if}
              <li  id="node_id_{$item.node_id}"{if $item_class} class="{$item_class|implode(" ")}"{/if}><a class="button_small" href={$item.url_alias|ezurl}><span class="micro_name">{$item.name|wash()}</span></a></li>
          {/foreach}
</ul>
     {else}
     <ul>
     {foreach $top_menu_items as $key => $item}
          {set $item_class=''}
          {if eq( $item.class_identifier, 'macroarea')}
             <li  id="node_id_{$item.node_id}"{if $item_class} class="{$item_class|implode(" ")}"{/if}><a class="macro_button" href={$item.url_alias|ezurl}>{$item.name|wash()}</a></li>
            {else}
             <li  id="node_id_{$item.node_id}"{if $item_class} class="{$item_class|implode(" ")}"{/if}><a class="sch_button" href={$item.url_alias|ezurl}>{$item.name|wash()}</a></li>
             {/if}
          {/foreach}
              </ul>

     {/if}
    {/if}
    {undef}
    <!-- School menu content END -->
</div>