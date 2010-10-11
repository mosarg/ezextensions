<div class="border-box shadowmore">
    {def $left_menu_depth = $pagedata.current_menu|eq('LeftOnly')|choose( 1, 0 )}
    {def $docenti_node=''
    $menu_node=array()
    $menu_levels=hash('0','first','1','second','2','third','3','fourth','4','fifth')
    $menu_style=''}


    {foreach $module_result.path as $path_element}
    {if $path_element|contains('Docenti')}
    {set $docenti_node=$path_element.node_id}
    {set $menu_node=$path_element}
    {break}
    {/if}
    {/foreach}

    
    {def $menu_elements=treemenu($module_result.path, ,ezini( 'MenuContentSettings', 'LeftIdentifierList', 'menu.ini' ),3,4, ,2)}


    {cache-block keys=array($menu_elements)}

    {if ge($menu_elements|count,1)}
    <h4>{"Contenuti"|i18n('scuola/professori')}</h4>

    {def $depth=1 $last=0 $lastlevel=0}
    <ul class="menu-list">
        <li>
      <a class="parent-menu"
                   href={$module_result.path[sub($module_result.content_info.node_depth,2)].url_alias|ezurl}>
          {$module_result.path[sub($module_result.content_info.node_depth,2)].text|wash} ^
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
                <li><ul class="{gt($depth,1)|choose("submenu-list","menu-list")}">
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
                    <a {$menu_style} href={$menu.url_alias|ezurl}>{$menu.text|shorten(16)}<span> ></span></a>
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

    {else}

<h4>{"Contenuti"|i18n('scuola/menu')}</h4>
<ul class="menu-list">
  <li>
      <a class="parent-menu"

          href={$module_result.path[sub($module_result.content_info.node_depth,2)].url_alias|ezurl}>
          {$module_result.path[sub($module_result.content_info.node_depth,2)].text|wash} ^
       </a>
  </li>
</ul>
{/if}

    {/cache-block}


    {def $altri_prof=fetch_alias( 'children', hash( 'parent_node_id', $docenti_node,
    'class_filter_type', 'include',
    'class_filter_array', array('proffolder')))}


    {cache-block keys=array($altri_prof)}
    <div class="prof-choice">
    <h4>{"Selezione docente: "|i18n('scuola/professori')}</h4>
    <form action={"content/action"|ezurl} method="post">
          

        <select name="URL" title="Insegnante" class="select_prof">
            {foreach $altri_prof as $altro_prof}
            <option  value={$altro_prof.url|ezurl}>{$altro_prof.name}</option>
            {/foreach}
        </select>

        <input type="submit" name="RedirectTo" value="{"Vai"|i18n('scuola/professori')}"/>
               <input name="ContentObjectID" type="hidden" value="{$docenti_node}" />
    </form>
    </div>
    {/cache-block}
</div><!--close border-box--><!--end menu sezione prof-->