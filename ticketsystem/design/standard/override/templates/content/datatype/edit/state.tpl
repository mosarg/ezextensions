{def $user=fetch(user, current_user)
     $user_roles=array()}

{def $roles=fetch( 'user', 'member_of', hash( 'id', $user.contentobject_id))}

{foreach $roles as $role}
    {set $user_roles=$user_roles|append($role.name)} <br />
{/foreach}


{def $attribute_base=ContentObjectAttribute
     $selected_id_array=$attribute.content}

{if $user_roles|contains('Help Desk')}

<div class="original">
    <input type="hidden" name="{$attribute_base}_ezselect_selected_array_{$attribute.id}" value="" />
    <select id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" name="{$attribute_base}_ezselect_selected_array_{$attribute.id}[]" {section show=$attribute.class_content.is_multiselect}multiple{/section}>
    {foreach $attribute.class_content.options as $index=>$option}
        <option value="{$index}" {if $selected_id_array|contains( $index )}selected="selected"{/if}>{$option.name|wash( xhtml )}</option>
    {/foreach}
    </select>
</div>
{else}
   {if or( eq($attribute.data_text, '7'),eq($attribute.data_text, '8') )}
        <input type="hidden" name="{$attribute_base}_ezselect_selected_array_{$attribute.id}" value="">
            <select id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" name="{$attribute_base}_ezselect_selected_array_{$attribute.id}[]" {section show=$attribute.class_content.is_multiselect}multiple{/section}>
	    {foreach $attribute.class_content.options as $index => $object}
		{if or( eq($attribute.object.name, 'Reopened'), eq($attribute.object.name, 'Invalid') )}
		<option value="{$index}" {section show=$selected_id_array|contains( $index )}selected="selected"{/section}> {$attribute.object.name}</option>
		{elseif or( eq($attribute.object.name, 'Reopened'), eq($attribute.object.name, 'Closed') )}
		<option value="{$index}" {section show=$selected_id_array|contains( $index )}selected="selected"{/section}> {$attribute.object.name}</option>
		{/if}
	    {/foreach}
	    </select>
    {else}
       {if or( $access, eq($attribute.object.status, '0'))}

         <input type="hidden" name="{$attribute_base}_ezselect_selected_array_{$attribute.id}" value="" />
    <select id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" name="{$attribute_base}_ezselect_selected_array_{$attribute.id}[]" {section show=$attribute.class_content.is_multiselect}multiple{/section}>
            <option value="0">Nuovo</option>
        </select>
        {elseif eq($attribute.object.status, '1')}
            {attribute_view_gui attribute_base=$attribute_base attribute=$attribute}
        {/if}
    {/if}
{/if}
{undef}
