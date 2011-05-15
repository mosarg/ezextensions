{* Contenitore classi - Full view *}

{include uri='design:parts/global_variables.tpl' left_menu=true() left_nav_menu=true() no_class_menu=false()}


{def $calendarForum=fetch('content','list',hash( 'parent_node_id', $node.node_id,
                                                          'sort_by','class_identifier',
                                                          'offset', $view_parameters.offset,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array',array('event_calendar','forums','forum','multicalendar') ) )}

<div class="content-view-full">
    <div class="class-classgroup">
        <div class="attribute-header">
            <h1>{$node.name|wash}</h1>
            <h3 class="header_link">
                {foreach $calendarForum as $CF}
                    <a href={$CF.url_alias|ezurl}>{$CF.name}</a>
                        {delimiter}
                        ::
                        {/delimiter}
                {/foreach}
            </h3>
        </div>
           
        <div class="title-separator"></div>
        <div class="separator"></div>
         {if $node.object.data_map.short_description.has_content}
                <div class="attribute-short">
                    {attribute_view_gui attribute=$node.data_map.short_description}
                </div>
            {/if}
        {if $node.object.data_map.description.has_content}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        {/if}
       
         {def $children = array()
                 $children_count = ''}
         {set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', array(array('attribute',false(),'classe/indirizzo'),
							  array('attribute',true(),'classe/sezione')),
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', array('classe') ) )}

            <div class="content-view-children">
		{def $indirizzo="empty" $local="empty" $stack=0}
                {foreach $children as $child }
		     {set $local=$child.data_map.indirizzo.sort_key_string}
		    {if ne($local,$indirizzo)}
			{if eq($stack,0)}
			    {set $stack=1}
			{else}
			    </ul>
			{/if}
		    <ul class="corso_blocco">
			<li class="list_header">
			    <h2>{attribute_view_gui attribute=$child.data_map.indirizzo}</h2>
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
           {include uri='design:parts/object_informations.tpl' style='full'}
        
    </div>
</div>


