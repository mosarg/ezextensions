{* gallery image select *}
{def $class_content=$attribute.class_content
     $class_list=fetch( class, list, hash( class_filter, $class_content.class_constraint_list ) )
     $can_create=true()
     $new_object_initial_node_placement=false()
     $browse_object_start_node=true()
     $object=''}

	{* Standard mode is browsing *}
       
    {set $browse_object_start_node=$attribute.object.main_node_id}
       
        {* Optional controls. *}
        {if ge($attribute.content.relation_list|count,1)}

                <table class="list" cellspacing="0">
                <tr>
                    <th class="tight"><img src={'toggle-button-16x16.gif'|ezimage} alt="{'Invert selection.'|i18n( 'design/standard/content/datatype' )}" onclick="ezjs_toggleCheckboxes( document.editform, '{$attribute_base}_selection[{$attribute.id}][]' ); return false;" title="{'Invert selection.'|i18n( 'design/standard/content/datatype' )}" /></th>
                    <th>{'Name'|i18n( 'design/standard/content/datatype' )}</th>
                    <th>{'Type'|i18n( 'design/standard/content/datatype' )}</th>
                    <th>{'Section'|i18n( 'design/standard/content/datatype' )}</th>
                    <th>{'Published'|i18n( 'design/standard/content/datatype' )}</th>
                    <th class="tight">{'Order'|i18n( 'design/standard/content/datatype' )}</th>
                </tr>
               
                {foreach $attribute.content.relation_list as $Objects sequence array( bglight, bgdark ) as $style}
                    {set $object=fetch( content, object, hash( object_id, $Objects.contentobject_id ) )}

                    <tr class="{$style}">
                    {* Remove. *}
                    <td><input type="checkbox" name="{$attribute_base}_selection[{$attribute.id}][]" value="{$Objects.contentobject_id}" /></td>

                    {* Name *}
                    <td>{$object.name|wash()}</td>

                    {* Type *}
                    <td>{$object.class_name|wash()}</td>

                    {* Section *}
                    <td>{fetch( section, object, hash( section_id, $object.section_id ) ).name|wash()}</td>
                     <td>{if $Objects.in_trash|not() }
                            {'Yes'|i18n( 'design/standard/content/datatype' )}
                             {else}
                            {'No'|i18n( 'design/standard/content/datatype' )}
                        {/if}
                    </td>
                     {* Order. *}
                    <td><input size="2" type="text" name="{$attribute_base}_priority[{$attribute.id}][]" value="{$Objects.priority}" /></td>

                    </tr>

                {/foreach}
                </table>

         {else}
                <p>{'There are no related objects.'|i18n( 'design/standard/content/datatype' )}</p>
         {/if}
                {if  ge($attribute.content.relation_list|count,1)}
                    <input class="button" type="submit" name="CustomActionButton[{$attribute.id}_remove_objects]" value="{'Remove selected'|i18n( 'design/standard/content/datatype' )}" />&nbsp;
                {else}
                    <input class="button-disabled" type="submit" name="CustomActionButton[{$attribute.id}_remove_objects]" value="{'Remove selected'|i18n( 'design/standard/content/datatype' )}" disabled="disabled" />&nbsp;
                {/if}
                {if $browse_object_start_node}
                    <input type="hidden" name="{$attribute_base}_browse_for_object_start_node[{$attribute.id}]" value="{$browse_object_start_node|wash}" />
                {/if}
                <input class="button" type="submit" name="CustomActionButton[{$attribute.id}_browse_objects]" value="{'Add objects'|i18n( 'design/standard/content/datatype' )}" />

       

{undef}





