{* top menu drop drown *}

{run-once}
{ezscript_require( array('classes/megamenu.js',
'init_menu.js'))}
{/run-once}





{if $module_result.uri|downcase|
preg_match('/pendinglist|draft|notification\/settings|user\/edit|collaboration/')}
<div class="menu">
    <ul>
        <li><a href="/">Home</a></li>
        <li><a href={concat("/user2/edit/",$current_user.contentobject_id,"/",
               $current_user.contentobject.class_name)|ezurl}">Profilo </a></li>
        <li><a href={"content/draft"|ezurl}>{"Bozze"|i18n("design/ezwebin/user/edit")}</a></li>
        <li><a href={"/content/pendinglist"|ezurl}>{"In attesa"|i18n("design/ezwebin/user/edit")}</a></li>
        <li><a href={"notification/settings"|ezurl}>{"Imposta Notifiche"|i18n("design/ezwebin/user/edit")}</a></li>
        <li><a href={"collaboration/view/summary"|ezurl}>{"Collaborazione"|i18n("design/scuola/profilo")}</a></li>
    </ul>
</div>
{else}
{def $goleft=ezini( 'TopDrop', 'goleft', 'design.ini')
     $child_check=''
     $child_check_first=''
     $child_check_second=''
     $child_check_third=''}
{def $used_node=2}
<div class="menu">
    <ul > {def $base=fetch( 'content', 'node', hash( 'node_id', 2 ) )}
        
        {* FIRST LEVEL *}
        {def $i=0}
       
       {def $node_parent=2}
       {def $menu_content=ezini( 'DropDownMenuContentSettings', 'TopList', 'dropdownmenu.ini' )}
       {def $menu_content_restricted=ezini( 'DropDownMenuContentSettings', 'TopListRestricted', 'dropdownmenu.ini' )}

        {foreach fetch('content','list',hash('parent_node_id',$node_parent,
        'class_filter_type', "include", 'class_filter_array', $menu_content,sort_by,$base.sort_array))
        as $menu_item_first sequence array('moveup','movedown') as $style}

        {set $child_check=fetch(content,list_count,
                   hash('parent_node_id',$menu_item_first.node_id, 'class_filter_type',
                   "include", 'class_filter_array', $menu_content,sort_by,$base.sort_array))
                    $i=inc( $i )}<!--start foreach first level-->

        
                {if eq( $menu_item_first.class_identifier, 'link')}
                    <li class="{$style}"><img alt="teiera" src={$menu_item_first.data_map.icon.content[menublock].url|ezroot} />{$menu_item_first.name}
                {else}
                    <li class="{$style}"><img alt="teiera" src={$menu_item_first.data_map.icon.content[menublock].url|ezroot} /><a class="{concat('menu_',$i)} body_font root_menu roundedtop roundedbottom" href={$menu_item_first.url_alias|ezurl}>{$menu_item_first.name}
                {/if}


         {if $child_check|gt(0)}
                   <!--second level-->
                   </a>
                   {if $i|gt( $goleft )}
                        <ul class="sub softshadow endstop roundedbottom ">
                   {else}
                        <ul class="sub softshadow  roundedbottom">
                   {/if}

                    <!--RootMenu icon -->
                    <li class="root_icon rounded">
                        
                        <span> <img  alt="megadrop_0" class="shadow"src={$menu_item_first.data_map.menu_icon.content[gallerythumbnailsquare].url|ezroot}/> {$menu_item_first.data_map.menu_description.content|shorten(120)}</span>
                    </li>

                   {foreach
                         fetch('content','list',hash('parent_node_id',$menu_item_first.node_id, 'class_filter_type',
                         "include", 'class_filter_array',$menu_content ,'sort_by',$menu_item_first.sort_array))
                         as $menu_item_second}<!--start foreach second level-->
       


                        {set $child_check_first=fetch('content','list_count',hash('parent_node_id',
                             $menu_item_second.node_id, 'class_filter_type', "include",'class_filter_array',
                             $menu_content_restricted,sort_by,$menu_item_second.sort_array))}
	        
                        <li class="second-level">
                      
                        <a class="drop rounded"
                        href={$menu_item_second.url_alias|ezurl}>
                            <img  alt="megadrop_0" class=""src={$menu_item_second.data_map.icon.content[megadropsmall].url|ezroot}/>
                            {$menu_item_second.name}
                        {if $child_check_first|gt(0)}
                                <!--third level-->
                                </a>
                               {if $i|gt( $goleft )}
                             <ul class="sub1  left rounded-more"><!--stard third level ul-->
                                {else}
                             <ul class="sub1 rounded-more"><!--stard third level ul-->
                                {/if}
                                {foreach fetch(content,list,
                                        hash(parent_node_id,$menu_item_second.node_id, class_filter_type, "include",
                                        class_filter_array, $menu_content_restricted,sort_by,$menu_item_second.sort_array))
                                        as $menu_item_third}<!--start foreach third level-->
                                        {set $child_check_second=fetch(content,list_count,
                                            hash(parent_node_id,$menu_item_third.node_id,
                                            class_filter_type, "include",
                                            class_filter_array,$menu_content_restricted,sort_by,
                                            $menu_item_third.sort_array))}
                                        <li class="third-level">
                                            <a class="drop" href={$menu_item_third.url_alias|ezurl}>{$menu_item_third.name}
                                                    {if $child_check_second|gt(0)}
                                                        <!--fourth level-->
                                                            </a>
                                                           {if $i|gt( $goleft )}
                                                                <ul class=" sub2 left rounded-more">
                                                            {else}
                                                                <ul class="sub2 rounded-more">
                                                            {/if}
                                                            {foreach fetch(content,list,
                                                                     hash(parent_node_id,$menu_item_third.node_id, class_filter_type,
                                                                     "include", class_filter_array, $menu_content_restricted,sort_by,
                                                                     $menu_item_third.sort_array)) as $menu_item_fourth}<!--start foreach fourth level-->
                                                                    <li class="fourth-level">
                                                                        <a  href={$menu_item_fourth.url_alias|ezurl}>{$menu_item_fourth.name}</a>
                                                                    </li>
                                                            {/foreach}<!--end fourth level foreach-->
                                                                </ul>
                                                    {else}
                                            </a>
                                                    {/if}
                                        </li>
                                {/foreach}<!--end third level foreach-->
                              </ul><!--end third level ul-->
                                                            
                        {else}<!--end third level if-->
                       
                        </a>
                   
                        {/if}
                        </li><!--end second level li-->
                   {/foreach}<!--end second level foreach-->
                   </ul><!--end second level ul-->
                                
                
     {else}<!--end if first level-->
       </a><!--cc3-->
    {/if}
    </li>
   {/foreach}<!--end first level foreach-->
   </ul>
  </div>
{undef}
{/if}
