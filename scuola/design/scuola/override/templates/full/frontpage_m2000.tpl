{* Frontpage m2000 - Full view *}

{if $node.object.data_map.show_menu.data_int}
    {scuolapagedata_set( 'extra_menu', false() )}
    {scuolapagedata_set( 'left_menu', true() )}
    {scuolapagedata_set( 'left_nav_menu', true() )}
{else}
    {scuolapagedata_set( 'extra_menu', false() )}
    {scuolapagedata_set( 'left_menu', false() )}
{/if}


<div class="content-view-full">
 <div class="class-m2000_front">

     {if $node.object.state_id_array|contains('6')}
        <div class="wip rounded shadowmore">
            <p>{"Contenuto in preparazione non ancora visibile pubblicamente"|i18n('scuola/state')}</p>
        </div>
        {/if}
     <div class="frontpage_header">
      
         {if is_set($node.data_map.logo)}
         <img class="shadowdark" src= {$node.object.data_map.logo.content[mainstory3].url|ezroot} alt="logo"/>
         {/if}
        <h1 class="section_header">{$node.data_map.name.content}</h1>
     </div>
     <div class="m2000_front_description">
        {attribute_view_gui attribute=$node.data_map.descrizione}
     </div>

   {if $node.data_map.page.has_content}
   <div class="attribute-page">
    {attribute_view_gui attribute=$node.data_map.page}
   </div>
   {/if}

     {if $node.data_map.show_children.data_int}

     {def $children=array() $classes=array('ufficio','article','folder','dipendenti')}

      {set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $classes))}
   
      {foreach $children as $child}
 
      {node_view_gui view='line' content_node=$child }

       {/foreach}
        <br class="break"/>
      {/if}
    {if is_set($node.data_map.footer)}
    <div class="m2000_front-footer">
        {attribute_view_gui attribute=$node.data_map.footer}
    </div>
    {/if}
 </div>
</div>