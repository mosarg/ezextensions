{def $attachments=fetch( 'content', 'tree', hash( 'parent_node_id', $node.node_id, 
              'class_filter_type',  'include',
              'class_filter_array', array( 'ticket_attachment' ),
              'limitation', array(),
              'sort_by', array( array( 'published', true() ) )) )}

{if $attachments}

{def $item_type=ezpreference( 'admin_list_limit' )
	      $number_of_items=min( $item_type, 3)|choose( 10, 10, 25, 50 )
	      $can_remove=false()
	      $can_edit=false()
	      $can_create=false()
	      $can_copy=false()
	      $children_count=$node.children_count
	      $children=fetch( content, list, hash( parent_node_id, $node.node_id,
                                                   sort_by, $node.sort_array,
                                                   limit, $number_of_items,
                                                   offset, $view_parameters.offset ) )}
<div class="content-view-children">
    
       <h2 class="context-title">Allegati</h2>
 
                          

	<table class="list" cellspacing="0">
	    <tr>
		<th> Nome			</th>
		<th> File			</th>
        	<th> Data		    </th>
                <th class="tight"> Azione			</th>
            </tr>
	    
            {def $node_name=$node.name}
            {foreach $attachments  as $attachment sequence array( bglight, bgdark) as $style}
	    {def $child_name=$attachment.name|wash}
	     <tr class="{$style}">
                    <td> {$attachment.name}</td>
                    <td> {attribute_view_gui attribute=$attachment.data_map.file}</td>
                    <td> {$attachment.object.published|l10n( 'shortdatetime' )}</td>
                    <td>
                        <form enctype="multipart/form-data" method="post" action={"content/action/"|ezurl}>
                            <input type="hidden" name="TopLevelNode" value="{$node.main_node_id}" />
                            <input type="hidden" name="ContentNodeID" value="{$attachment.main_node_id}" />
                            <input type="hidden" name="ContentObjectID" value="{$attachment.contentobject_id}" />
                        {if $attachment.can_remove}
                            <input class="button" style="width:60px;" type="submit" name="ActionRemove" value="Elimina"/>
                        {else}
                            <input class="button-disabled" style="width:60px;" type="submit" name="ActionRemove"value="Elimina" disabled="disabled" />
                        {/if}
                        </form>
                    </td>
                </tr>
            {undef}
	   {/foreach}
	</table>
	
</div>	
{/if}