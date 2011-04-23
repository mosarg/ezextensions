{ezcss_require( array('edit/browselist.css'))}
{def         $class_content= $attribute.class_content
	     $new_object_initial_node_placement=false()
	     $related_items= array()
	     $browse_object_start_node	= $class_content.default_selection.node_id
	     $browse_object_browse_type	= $class_content.selection_type
	     $allow_edit= $class_content.allow_edit
	     $depth= $class_content.depth
             $attribute_base=ContentObjectAttribute}
              {foreach $attribute.content.relation_browse as $relation}
			{set $related_items=$related_items|append($relation.contentobject_id)}
	      {/foreach}
		<input type="hidden" name="SelectionType_{$attribute.id}" value="4" />
		<input type="hidden" name="{$attribute_base}_id[]" value="{$attribute.id}" />
		
		{def $parent_node=fetch( content, node, hash( node_id, $browse_object_start_node ) )}
                <ul class="selection-class">
                {foreach fetch( content, tree,
			          hash( parent_node_id, $parent_node.node_id,
					depth, $depth,
					'class_filter_type',  'include','limitation',array(),'class_filter_array', $class_content.class_constraint_list,
					 sort_by,array( array(  'path_string', true(), 'priority', true() ) ) ) ) as $rnode}
				{if ne($rnode.object.class_identifier,"school_front")}
                                <li class="node">
                                <div class="class-element">
                                <label >{$rnode.name|wash}</label>
                                <input type="checkbox"  name="SelectedObjectIDArray_{$attribute.id}[]" value="{$rnode.contentobject_id}" {$related_items|contains($rnode.contentobject_id)|choose( '', 'checked="checked"' )} />
                                </div>
                                </li>
                                {else}
                                <li class="node-school-name">
                                    {$rnode.name|wash}
                                </li>
				{/if}
			{/foreach}
                </ul>
{undef}
