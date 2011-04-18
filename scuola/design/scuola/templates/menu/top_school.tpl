
    <!-- This menu is used to show school tabs -->
    <!-- School menu content: START -->
   
    {def $macroaree=array()
         $macroarea=' '}
    
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
         {if is_set($module_result.path[1])}
            {if and(is_set($module_result.path[1].node_id),eq($top_menu_item.node_id,$module_result.path[1].node_id) )}
                {def $current_node_in_path=$module_result.path[1].node_id}
                {set $selected_key=$key}
            {/if}
          {/if}
         {/foreach}
    {if $top_menu_items_count}

    {if is_set($current_node_in_path)}
      
        {def $current_item=$top_menu_items[$selected_key]}
        {set $top_menu_items=$top_menu_items|remove($selected_key)}
        {set $item_class=array("current","shadow")}
           {if eq( $current_item.class_identifier, 'macroarea')}
            
            <div  id="highlight_section" class="current">
                <a href={$current_item.url_alias|ezurl}>{$current_item.name|wash}</a>
            </div>
             
            {else}
            <div  id="current-school" {if $item_class} class="{$item_class|implode(" ")}"{/if}>
                 <a  href={$current_item.url_alias|ezurl}>
                      {if $current_item.data_map.logo.has_content}
                        <img src= {$current_item.data_map.logo.content[blockmenubig].url|ezroot}   alt="logo"/>
                     {/if}
                 </a>
                  <span>{$current_item.name|wash}</span>
            </div>
             
             {/if}
<div class="schoolmenu-design">            
 <ul class="top_school_big">             
        {foreach $top_menu_items as $key => $item}
            {set $item_class=array("micro_tabs")}
            
            {if $top_menu_items_count|eq( $key|inc )}
                {set $item_class = $item_class|append("lastli")}
            {/if}
            {if eq( $item.class_identifier, 'macroarea')}
                {set $macroaree=$macroaree|append($item)}
            {else}
            
                <li  id="node_id_{$item.node_id}"{if $item_class} class="{$item_class|implode(" ")}"{/if}><a class="" href={$item.url_alias|ezurl}>{$item.name|wash()}</a></li>
            {/if}
          {/foreach}
</ul>
     {else}
     <div class="schoolmenu-design"> 
     <ul>
     {foreach $top_menu_items as $key => $item}
          {set $item_class=''}
          {if eq( $item.class_identifier, 'macroarea')}
              {set $macroaree=$macroaree|append($item)}
           {else}
             <li  id="node_id_{$item.node_id}"{if $item_class} class="{$item_class|implode(" ")}"{/if}><a class="" href={$item.url_alias|ezurl}>{$item.name|wash()}</a></li>
             {/if}
          {/foreach}
      </ul>

     
   
     
     
     {/if}
    {/if}
   
    <!-- School menu content END -->
</div>
{foreach $macroaree as $current_macroarea}     

<div  class="macro-slide" id="{$current_macroarea.name}" {if $item_class} class="{$item_class|implode(" ")}"{/if}><a href={$current_macroarea.url_alias|ezurl}>{$current_macroarea.name|wash()}</a></div>
{/foreach}
{undef}