{* prof list left menu *}
<div class="border-box">
{def $left_menu_depth = $pagedata.current_menu|eq('LeftOnly')|choose( 1, 0 )}
{def $regexp=ezini( 'Regexp', 'classi', 'scuola.ini' )}
{def $prof_nodes=array()
     $menu_node=''
     $menu_levels=hash('0','first','1','second','2','third','3','fourth','4','fifth')
     $menu_style=''}
{def $scuola=$pagedata.path_array[1].text|downcase}
{foreach $module_result.path as $path_element}
       {if $path_element.text|preg_match($regexp[0])}
                    {set $menu_node=$path_element}
              {break}
       {/if}
 {/foreach}
{def $menu_elements=treemenu($module_result.path, ,ezini( 'MenuContentSettings', 'LeftIdentifierList', 'menu.ini' ),3,4, ,2)}
{cache-block keys=array($menu_elements)}


{if ge($menu_elements|count,1)}
<h4>{"Contenuti"|i18n('scuola/menu')}</h4>
{def $depth=1 $last=0 $lastlevel=0}


<ul class="menu-list">
  <li>
      <a class="parent-menu"
         
          href={$module_result.path[sub($module_result.content_info.node_depth,2)].url_alias|ezurl}>
          {$module_result.path[sub($module_result.content_info.node_depth,2)].text|wash}
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
        <div class="{concat($menu_levels[$menu.level],"_level_menu")}">
        {if and($menu.is_selected,eq($menu.id,$current_node_id))}
           {set $menu_style='class="selected current"'}
        {elseif $menu.is_selected}
        {set $menu_style='class="selected"'}
        {else}
        {set $menu_style=''}
           {/if}

         <a {$menu_style} href={$menu.url_alias|ezurl}>{$menu.text}</a>
        </div>
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

{cache-block keys=array($menu_node)}
    {if $menu_node }
         {def $classe=fetch('content','node',hash('node_id',$menu_node.node_id))}
            {if eq($classe.class_identifier,'classe')}
              <h4>{'Insegnanti '|i18n('scuola/classe/menu')}{$menu_node.text}</h4>
                {def $objects=fetch( 'content', 'reverse_related_objects',
                     hash( 'object_id',$classe.contentobject_id,'attribute_identifier','professore/teachwhere') )}

              {if gt($objects|count,0)}
              <ul class="menu-list">
                {foreach $objects as $object}
                 {set $prof_nodes=$object.related_contentobject_array[0].assigned_nodes}
                    {foreach $prof_nodes as $url_node}
                        {if $url_node.url_alias|downcase|contains($scuola|downcase) }
                        <li>
                            <div class="first_level_menu" >
                            <a href={$url_node.url_alias|ezurl}>{$object.name|wash}<span>> </span></a>
                            </div>
                            </li>
                        {/if}
                    {/foreach}
                {/foreach}
                </ul>
              {else}
                    <span>{"Nessun insegnante assegnato a questa classe"|i18n('scuola/classe/menu')}</span>
                {/if}
            {/if}
    {/if}
{/cache-block}
{undef}
</div><!--end prof menu ext-->