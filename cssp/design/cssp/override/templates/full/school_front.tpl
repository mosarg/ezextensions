{*school_front full frontpage-scuole*}
{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}

<div class="content-view-full">
   

    {if is_set($node.object.data_map.descrizione)}
        <div class="custom-content">
            {attribute_view_gui attribute=$node.object.data_map.descrizione}
        </div>
    {/if}

     
   
    {def $page_limit = 10
                 $classes = array( 'scatola_scuole' )
                 $children = array()
                 $children_count = ''}
                 
    {set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $classes,
                                                          'limit', $page_limit ) )
                }

<div class="scelta_ordine">

        {foreach $children as $child }
                <div class="sch_block">
                    <a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $child.node_id)|ezurl}{else}{$child.url_alias|ezurl}{/if}{if eq( $ui_context, 'edit' )} onclick="return false;"{/if}>
                    <img src= {$child.data_map.logo.content[original].url|ezroot}   alt="logo"/></a>
                    {node_view_gui view='line' content_node=$child}
                </div>
                {/foreach}
</div>

  
</div>