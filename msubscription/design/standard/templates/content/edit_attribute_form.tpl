{foreach  $content_attributes as $key=>$attribute}

{if $attribute.is_information_collector|not()}

<div class="block ezcca-edit-datatype-{$attribute.data_type_string} ezcca-edit-{$attribute.contentclass_attribute_identifier}">
    {* Show view GUI if we can't edit, oterwise: show edit GUI. *}
{if and( eq( $attribute.can_translate, 0 ), ne( $object.initial_language_code, $attribute.language_code ) )}
    <label>{$attribute.contentclass_attribute_name|wash}{if $attribute.can_translate|not} <span class="nontranslatable">({'Not translatable'|i18n( 'design/ezwebin/content/edit_attribute' )})</span>{/if}:</label>
    {if $is_translating_content}
        <div class="original">
        {attribute_view_gui attribute_base=$attribute_base attribute=$attribute}
        <input type="hidden" name="ContentObjectAttribute_id[]" value="{$attribute.id}" />
        </div>
    {else}
        {attribute_view_gui attribute_base=$attribute_base attribute=$attribute}
        <input type="hidden" name="ContentObjectAttribute_id[]" value="{$attribute.id}" />
    {/if}
{else}
    {if $is_translating_content}
        <label{if $attribute.has_validation_error} class="message-error"{/if}>{$attribute.contentclass_attribute_name|wash}{if $attribute.is_required} <span class="required">({'Required'|i18n( 'design/ezwebin/content/edit_attribute' )})</span>{/if}:</label>
        <div class="original">
        {attribute_view_gui attribute_base=$attribute_base attribute=$from_content_attributes[$key]}
        </div>
        <div class="translation">
        
            {attribute_edit_gui attribute_base=$attribute_base attribute=$attribute}
            <input type="hidden" name="ContentObjectAttribute_id[]" value="{$attribute.id}" />
         </div>
    {else}
        <label{if $attribute.has_validation_error} class="message-error"{/if}>{$attribute.contentclass_attribute_name|wash}{if $attribute.is_required} <span class="required">({'Required'|i18n( 'design/ezwebin/content/edit_attribute' )})</span>{/if}:</label>
        {attribute_edit_gui attribute_base=$attribute_base attribute=$attribute}
        <input type="hidden" name="ContentObjectAttribute_id[]" value="{$attribute.id}" />
    {/if}
{/if}
</div>
{/if}
{/foreach}
