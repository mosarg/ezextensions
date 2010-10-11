<div class="border-box">
{def $left_menu_depth = $pagedata.current_menu|eq('LeftOnly')|choose( 1, 0 )}
    {def $menu_node=array()
     $menu_levels=hash('0','first','1','second','2','third','3','fourth','4','fifth')
     $menu_style=''}

{def $menu_elements=treemenu($module_result.path,,
    ezini( 'MenuContentSettings', 'LeftIdentifierList', 'menu.ini' ),1,3, ,2)}

{if ge($menu_elements|count,1)}
    {cache-block keys=array($menu_elements)}
    <h4>{"Contenuti"|i18n('scuola/professori')}</h4>

    {def $depth=1 $last=0 $lastlevel=0}
    <ul class="menu-list">
        <li>
             <a class="parent-menu"
              href={$pagedata.path_array[$left_menu_depth].url_alias|ezurl}>{$pagedata.path_array[$left_menu_depth].text}
            </a>
        </li>
     {foreach $menu_elements as $menu}
            {if is_set($last.level)}
                {set $lastlevel=$last.level}
            {else}
                {set $lastlevel=0}
            {/if}
            {while and($lastlevel|ne(0), $lastlevel|gt($menu.level))}
                </ul></li>
                {set $lastlevel=$lastlevel|sub(1)}
            {/while}

            {if and($last | ne(0), $last.level|lt($menu.level))}
                <li> <ul class="{gt($depth,1)|choose("submenu-list","menu-list")}">
            {/if}
            <li>
                 <div class="{concat($menu_levels[$menu.level],'_level_menu')}" ><!--first concat start-->
                     {if and($menu.is_selected,eq($menu.id,$current_node_id))}
                        {set $menu_style='class="selected current"'}
                     {elseif $menu.is_selected}
                        {set $menu_style='class="selected"'}
                     {else}
                        {set $menu_style=''}
                     {/if}
                   
                     {if eq( $menu.class_name, 'Link')}
                        <a {$menu_style} href={$menu.data_map.location.content}>{$menu.text|shorten(18)}</a>
                     {else}
                        <a {$menu_style} href={$menu.url_alias|ezurl}>{$menu.text|shorten(18)}</a>
                     {/if}
               </div><!--first concat end-->
            </li>

            {set $last=$menu}
        {/foreach}
        {set $depth=$last.level}
        
        {while $depth |gt(0)}
                </ul></li>
                {set $depth=$depth|sub(1)}
        {/while}
 </ul>
 {/cache-block}
 {else}
    <ul class="menu-list">
        <li>
            <a class="parent-menu"
              href={$pagedata.path_array[$left_menu_depth].url_alias|ezurl}>{$pagedata.path_array[$left_menu_depth].text} ^
            </a>
        </li>
    </ul>
  {/if}


</div>
