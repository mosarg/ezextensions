<h1>{'Materiali'|i18n('m2000/scuola/didattica')}</h1>


{def $classes=array('folder','folder_corsi','article','corso')
                 $children = array()}
{set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $classes))}

 
{foreach $children as $child}
    		<a href={$child.url_alias|ezurl}>{$child.name|wash}</a><br />
{/foreach}

