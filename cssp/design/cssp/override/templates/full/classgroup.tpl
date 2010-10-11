{* Folder - Full view *}
<div class="border-box">
<div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
<div class="border-ml"><div class="border-mr"><div class="border-mc float-break">

<div class="content-view-full">
    <div class="class-folder">

        <div class="attribute-header">
            <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>
        </div>
        
        {if eq( ezini( 'folder', 'SummaryInFullView', 'content.ini' ), 'enabled' )}
            {if $node.object.data_map.short_description.has_content}
                <div class="attribute-short">
                    {attribute_view_gui attribute=$node.data_map.short_description}
                </div>
            {/if}
        {/if}

        {if $node.object.data_map.description.has_content}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        {/if}
        {if $node.object.data_map.show_children.data_int}
            {def $page_limit = 10
                 $classes = array( 'infobox' )
                 $children = array()
                 $children_count = ''}
                 
            {if le( $node.depth, '3')}
                {set $classes=array( 'infobox', 'folder' )}
            {/if}

            {set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', array(array('attribute',false(),'classe/indirizzo'),
							  array('attribute',true(),'classe/sezione')),
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', array('classe'),
                                                          'limit', $page_limit ) )
		$children_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
                                                                      'class_filter_type', 'include',
                                                                      'class_filter_array', array('class') ) )}

            <div class="content-view-children">
		{def $indirizzo="empty" $local="empty" $stack=0}
                {foreach $children as $child }
		    
		    
		    {set $local=$child.object.data_map.indirizzo.sort_key_string}
		    {if ne($local,$indirizzo)}
			{if eq($stack,0)}
			    {set $stack=1}
			{else}
			    </ul>
			{/if}
		    <ul>
			<li class="list_header">
			    <h2>{attribute_view_gui attribute=$child.object.data_map.indirizzo}</h2>
			</li>
		    {/if}
		    {set $indirizzo=$local}
		    <li>
			{node_view_gui view='line' content_node=$child}
		    </li>
                {/foreach}
		    </ul>
            </div>
	    {undef $indirizzo $local}
            {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     item_count=$children_count
                     view_parameters=$view_parameters
                     item_limit=$page_limit}

        {/if}
    </div>
</div>

</div></div></div>
<div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
</div>