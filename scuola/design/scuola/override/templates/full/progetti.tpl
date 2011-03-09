{* Macroarea - Full view *}


{if $node.object.data_map.show_menu.data_int}
    {include uri='design:parts/global_variables.tpl' left_menu=true() left_nav_menu=true()}
{else}
    {include uri='design:parts/global_variables.tpl' left_menu=false() left_nav_menu=false()}
{/if}

<div class="content-view-full">
   
    <div class="class-macroarea">
      
        
      {if $node.data_map.show_children.data_int|not()}   
    <div class="attribute-header">
          <h1>{$node.data_map.name.content|wash()}</h1>
   </div>   
        
    <div class="title-separator"></div>
        <div class="separator"></div>     
        
   <div class="image-block">
              {if $node.data_map.logo.has_content}
                     <div class="attribute-image">
                        {attribute_view_gui image_css_class='shadow' link_class=ezimage_zoom image_class='gallerythumbnailsquare' href=$node.data_map.logo.content[original].url|ezroot attribute=$node.data_map.logo}
                     </div>
               {/if}
               {if $node.data_map.logo1.has_content}
                    <div class="attribute-image">
                        {attribute_view_gui image_css_class='shadow' link_class=ezimage_zoom image_class='gallerythumbnailsquare' href=$node.data_map.logo1.content[original].url|ezroot attribute=$node.data_map.logo1}
                    </div>
                {/if}
                {if $node.data_map.logo2.has_content}
                    <div class="attribute-image">
                        {attribute_view_gui image_css_class='shadow' link_class=ezimage_zoom image_class='gallerythumbnailsquare' href=$node.data_map.logo2.content[original].url|ezroot attribute=$node.data_map.logo2}
                    </div>
                {/if} 
   </div>     
        {/if}
    {if is_set($node.object.data_map.descrizione)}
        <div class="attribute-short">
            {attribute_view_gui attribute=$node.object.data_map.descrizione}
        </div>
    {/if}

       {if $node.data_map.page.has_content}
        <div class="attribute-page">
            {attribute_view_gui attribute=$node.object.data_map.page}
        </div>
       {/if}


    {def         $children = array()
                 $children_count = ''
                 $counter=0
                 $classes=array('progetto')}

    {set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $classes))
          $children_count=$children|count}





   {if gt($children_count,0)}
     {foreach $children as $child }
         <div class="content-view-children">
             {node_view_gui view=line content_node=$child style='empty'}
         </div>
    
     {/foreach}

 

    </div>
</div>
{undef}