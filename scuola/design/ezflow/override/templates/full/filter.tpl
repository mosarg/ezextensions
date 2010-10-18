{* Folder - Full view *}

<div class="border-box">

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


	<form action={"content/action"|ezurl} method="post">
	
		<legend>by Date</legend>
		<label for="Day" for="filter_subject" class="hide">Dia</label>
			<select name="(subject)" id="filter_subject" title="{'Day'|i18n( 'design/.../node/view/full' )|wash()}">
				<option value="matematica">Matematica</option>
				<option value="fisica">Fisica</option>
			</select>
	<input type="hidden" name="DestinationURL" value="{$node.url_alias}" />
	<input type="submit" value="filter">

	
	</form>
	<h1>Risultato</h1>
	{if $view_parameters|count|gt(0)}
	{$view_parameters.subject}
	{/if}
	
	

	{def $users=fetch( 'content', 'list',
        	hash( 'parent_node_id', 144,
              'depth', 1 ) )}
	
 
	{foreach $users as $node}
    		{$node.data_map.occupazione.content.relation_browse|attribute(show,2)} <br />
	{/foreach}

	{def $testobject=fetch('content','object',hash(object_id,150))}
	{$testobject|attribute(show,2)}

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
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'exclude',
                                                          'class_filter_array', $classes,
                                                          'limit', $page_limit ) )
                 $children_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
                                                                      'class_filter_type', 'exclude',
                                                                      'class_filter_array', $classes ) )}

            <div class="content-view-children">
                {foreach $children as $child }
                    {node_view_gui view='line' content_node=$child}
                {/foreach}
            </div>

            {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     item_count=$children_count
                     view_parameters=$view_parameters
                     item_limit=$page_limit}

        {/if}
    </div>
</div>

</div>