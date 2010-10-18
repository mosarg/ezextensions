{* multirelationlist *}

{def $class_content=$attribute.class_content
     $can_create=true()
     $new_object_initial_node_placement=false()
     $browse_object_start_node=false()}


       {def $parent_node=$attribute.object.main_node_id
             $nodesList=cond( and( is_set( $class_content.class_constraint_list ), $class_content.class_constraint_list|count|ne( 0 ) ),
                         fetch( content, tree,
                                hash( parent_node_id, $parent_node,
                                      class_filter_type,'include',
                                      class_filter_array, $class_content.class_constraint_list,
                                      sort_by, array( 'name',true() ),
                                      main_node_only, false() ) ),
                         fetch( content, list,
                                hash( parent_node_id, $parent_node,
                                      sort_by, array( 'name', true() )
                                     ) )
                        )
        }
        
	    <div class="buttonblock">
            <input type="hidden" name="single_select_{$attribute.id}" value="1" />
            {if ne( count( $nodesList ), 0)}
            <select name="ContentObjectAttribute_data_object_relation_list_{$attribute.id}[]">
                    {if $attribute.contentclass_attribute.is_required|not}
                         <option value="no_relation" {if eq( $attribute.content.relation_list|count, 0 )} selected="selected"{/if}>{'Seleziona coordinatore'|i18n( 'design/standard/content/datatype' )}</option>
                    {/if}
                        {foreach $nodesList as $mynode}
                            <option value="{$mynode.contentobject_id}"
                              {if ne(count( $attribute.content.relation_list ), 0)}
                                {foreach $attribute.content.relation_list as $item}
                                       {if eq( $item.contentobject_id, $mynode.contentobject_id )}
                                            selected="selected"
                                            {break}
                                        {/if}
                                {/foreach}
                            {/if} >
                         {$mynode.name|wash}</option>
                    {/foreach}
            </select>
            {/if}
            </div>
        

    
{undef}

