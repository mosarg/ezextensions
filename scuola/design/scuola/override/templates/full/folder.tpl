{* Folder - Full view *}


{* choose wheather to show left menu or not *}

{if $node.data_map.show_extrainfo.data_int}
    {def $left_menu_visibility=false()}
{else}
    {def $left_menu_visibility=true()}
{/if}

{include uri='design:parts/global_variables.tpl' left_menu=$left_menu_visibility left_nav_menu=$left_menu_visibility}

{def     $structure_classes = array('folder','blog','classe')
         $structure_elements = array()
         $structure_count = ''
         $style=''}

{if $left_menu_visibility|not()}         
         
{set $structure_elements=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $structure_classes) )
     $structure_count=$structure_elements|count()}
 {/if}    

{if $node.data_map.show_children.data_int}

        {def     $page_limit = 10
                 $static_elements_classes =array('file','image','dmsfolder')
                 $semantic_elements_classes=array('gallery','course','laboratory','feedback_form','progetto','article','article_mainpage')
                 $semantic_elements = array()
                 $static_elements = array()
                 $static_count = ''
                 $semantic_count=''}


         {set $semantic_elements=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array',$semantic_elements_classes,
                                                          'limit', $page_limit ) )
               $semantic_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
                                                                      'class_filter_type', 'include',
                                                                      'class_filter_array',$semantic_elements_classes ) )}
                  

         {set $static_elements=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                             'sort_by', $node.sort_array,
                                                             'class_filter_type', 'include',
                                                             'class_filter_array', $static_elements_classes,
                                                             'limit', $page_limit ) )
              $static_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
                                                                      'class_filter_type', 'include',
                                                                      'class_filter_array',$static_elements_classes) )}
  {/if}                                                                    
                      
                 
 
  
   {if $left_menu_visibility}
        {include uri='design:parts/folder/layout_left_menu.tpl'}
        {set $style='content-view-rightbar'}
   {else}
        {include uri='design:parts/folder/layout_noleft_menu.tpl'}
        {set $style='content-view-full'}
   {/if}


