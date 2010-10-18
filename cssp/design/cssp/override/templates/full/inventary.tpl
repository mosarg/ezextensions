{* Folder - Full view *}
{mpagedata_set( 'left_menu', true() )}
{mpagedata_set( 'left_nav_menu', false() )}
{mpagedata_set( 'extra_menu', false() )}


{def $calendars=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', array('event_calendar')
                                                          ))}


<div class="content-view-full">
     <div class="inventary">
        <div class="attribute-header">
            <h1>{$node.name}</h1>
            {if $calendars|count()|gt(0)}
            <a href={$calendars[0].url_alias|ezurl()}><img title="{$calendars[0].name}" src={'icons/calendar_icon.png'|ezimage()} alt="{$calendars[0].name}"/> </a>
            {/if}
        </div>
     

        {if $node.object.data_map.description.has_content}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
                 
            </div>
        {/if}

      
       {def $page_limit = 10
                $classes=array('inv_item')
                $children = array()
                $children_count = ''}
                 


       {set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'sort_by', $node.sort_array,
                                                           class_filter_type,'include',
                                                           class_filter_array,$classes,
                                                          'limit', $page_limit ) )
            $children_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
                                                                      'class_filter_type', 'include',
                                                                      'class_filter_array', $classes ) )}



            <div class="content-view-children">
		
                {if $children_count|gt(0)}
                {foreach $children as $child }
                    {node_view_gui view='line' content_node=$child}
		{/foreach}
                {/if}
		
            </div>




            {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     item_count=$children_count
                     view_parameters=$view_parameters
                     item_limit=$page_limit}

        
    </div>
</div>


