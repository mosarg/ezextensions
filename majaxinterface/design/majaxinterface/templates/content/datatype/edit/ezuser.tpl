{def $attribute_base=ContentObjectAttribute}



<div class="block">

{* Username. *}
<div class="block">
    <h4 class="mandatory">{'Username'|i18n( 'design/standard/content/datatype' )}:</h4>
    {if $attribute.content.has_stored_login}
        <input type="text" name="{$attribute_base}_data_user_login_{$attribute.id}_stored_login" size="16" value="{$attribute.content.login}" disabled="disabled" />
        <input type="hidden" name="{$attribute_base}_data_user_login_{$attribute.id}" value="{$attribute.content.login}" />
    {else}
        <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_login" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="text" name="{$attribute_base}_data_user_login_{$attribute.id}" size="16" value="{$attribute.content.login}" />
    {/if}
</div>
 <div class="separator"></div>
{* Clear Password *}
<div class="block password_field_clear">
    <h4 class="mandatory">{'Password'|i18n( 'design/standard/content/datatype' )}:</h4>
    <input id="password_field_clear" class="clear_password" type="text" size="16"/>

    <div class="password_strength rounded">

</div>
</div>
 <div class="separator"></div>

{* Password #1. *}
<div class="element password_field">
    <label>{'Password'|i18n( 'design/standard/content/datatype' )}:</label>
    <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_password" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="password" name="{$attribute_base}_data_user_password_{$attribute.id}" size="16" value="{section show=$attribute.content.original_password}{$attribute.content.original_password}{section-else}{section show=$attribute.content.has_stored_login}_ezpassword{/section}{/section}" />
</div>

{* Password #2. *}
<div class="element password_field">
    <label>{'Confirm password'|i18n( 'design/standard/content/datatype' )}:</label>
    <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_password_confirm" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="password" name="{$attribute_base}_data_user_password_confirm_{$attribute.id}" size="16" value="{section show=$attribute.content.original_password_confirm}{$attribute.content.original_password_confirm}{section-else}{section show=$attribute.content.has_stored_login}_ezpassword{/section}{/section}" />
</div>

{* Email. *}
<div class="block">
    <h4 class="mandatory">{'Email'|i18n( 'design/standard/content/datatype' )}:</h4>
    <input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_email" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="text" name="{$attribute_base}_data_user_email_{$attribute.id}" size="28" value="{$attribute.content.email|wash( xhtml )}" />
</div>

<div class="break"></div><div class="break"></div>
</div>

{* Status *}
<div class="block">
<div class="element account_status">
    <label>{'Current account status:'|i18n( 'design/standard/content/datatype' )}
    {if $attribute.content.is_enabled}
	<span class="userstatus-enabled">{'enabled'|i18n( 'design/standard/content/datatype' )}</span>
    {else}
	<span class="userstatus-disabled"> {'disabled'|i18n( 'design/standard/content/datatype' )}</span>
    {/if}
    </label>
</div>

<div class="break"></div>
</div>

{undef $attribute_base}

