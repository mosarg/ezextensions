<script type="text/javascript">
{literal}    
        $(function () {
            $("#prof_selector").live("change", function () {
               //alert($(this).val());
               if ($(this).val()!=""){
                $("#prof_form").submit();
               }
            });
        });
{/literal}        
</script>

<div class="border-box">
    {def $left_menu_depth = $pagedata.current_menu|eq('LeftOnly')|choose( 1, 0 )}
    {def $docenti_node=''
    $menu_node=array()
    $menu_levels=hash('0','first','1','second','2','third','3','fourth','4','fifth')
    $menu_style=''
    $root_depth=0}

    {foreach $module_result.path as $index=>$path_element}
    
    {if $path_element|contains('Macroaree')}
    {set $root_depth=$index}
    {set $docenti_node=$path_element.node_id}
    {set $menu_node=$path_element}
    {break}
    {/if}
    {/foreach}

    
    {def $menu_elements=treemenu($module_result.path, ,ezini( 'MenuContentSettings', 'LeftIdentifierList', 'menu.ini' ),2,4, ,2)}

    {cache-block keys=array($menu_elements)}

    {if ge($menu_elements|count,1)}
  
    {def $depth=1 $last=0 $lastlevel=0}
    <ul class="menu-list">
        <li>
      <a class="parent-menu"
                   href={$module_result.path[sum($root_depth,1)].url_alias|ezurl}>
          {$module_result.path[sum($root_depth,1)].text|wash}
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
                    <a {$menu_style} href={$menu.url_alias|ezurl}>{$menu.text|shorten(16)}</a>
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

<ul class="menu-list">
  <li>
     <a class="parent-menu"
                   href={$module_result.path[sum($root_depth,1)].url_alias|ezurl}>
          {$module_result.path[sum($root_depth,1)].text|wash}
       </a>
  </li>
</ul>
{/if}

    {/cache-block}


  {def $altre_macroaree=fetch_alias( 'children', hash( 'parent_node_id', $docenti_node,
    'class_filter_type', 'include',
    'class_filter_array', array('macroarea')))}


  {cache-block keys=array($altre_macroaree)}
    <div class="prof-choice">
      <form id="prof_form" action={"content/action"|ezurl} method="post">
        <select id="prof_selector" name="URL" title="Insegnante" class="select_prof">
          <option value="" selected="selected">{"Cambia macroarea"|i18n("design/m2000/full/helper_prof")}</option> 
            {foreach $altre_macroaree as $altra_macroarea}
              <option  value={$altra_macroarea.url|ezurl}>{$altra_macroarea.name}</option>
            {/foreach}
        </select>
     <input name="ContentObjectID" type="hidden" value="{$docenti_node}" />
     <input name="RedirectTo" type="hidden" value="Via" />
    </form>
    </div>
    {/cache-block}
</div><!--close border-box--><!--end menu sezione prof-->