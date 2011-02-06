{* Folder - Full view *}

{include uri='design:parts/global_variables.tpl' left_menu=false() left_nav_menu=false()}

{def        $cont_classes = array('folder','dmsfolder')
            $cont_classes_fetch=$cont_classes|append('event_calendar')
            $cont_children = array()
            $cont_count = ''
            $style=''
            $page_limit = 10
            $classes = ezini( 'MenuContentSettings', 'ExtraIdentifierList', 'menu.ini' )
            $children = array()
            $main_elements = array()
            $main_elements_classes=array('progetto','article','article_mainpage','article_subpage')
            $children_count = ''
            $main_elements_count=''}

{set $cont_children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'sort_by', array('class_identifier','published'),
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $cont_classes_fetch) )
     $cont_count=$cont_children|count()
     $main_elements=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $main_elements_classes,
                                                          'limit', $page_limit ) )
     $main_elements_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
                                                                      'class_filter_type', 'include',
                                                                      'class_filter_array',$main_elements_classes ) )
     $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', array('class_identifier','published'),
                                                          'class_filter_type', 'exclude',
                                                          'class_filter_array', $classes,
                                                          'limit', $page_limit ) )
     $children_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
                                                                      'class_filter_type', 'exclude',
                                                                      'class_filter_array',$classes) )}


{if $main_elements_count|gt(0)}
   {include uri='design:parts/folder/layout1.tpl'}
{else}
   {include uri='design:parts/folder/layout2.tpl'}
{/if}


