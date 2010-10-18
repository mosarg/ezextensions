<div class="block">
    <label>Mostra in vista:</label>
    <input type="checkbox" name="ContentClass_talks_show_in_view_{$class_attribute.id}" value="1" {section show=eq($class_attribute.data_int1,1)}checked="checked"{/section} />
</div>
<div class="block">
    <label>Valore def da tradurre:</label>
    <input type="text" name="ContentClass_talks_default_value_{$class_attribute.id}" value="{$class_attribute.data_text1}" size="8" maxlength="20" />
    
</div>


<div class="block">
<fieldset>
<legend>{'Options'|i18n( 'design/standard/class/datatype' )}</legend>
{section show=$class_attribute.content.options}
<table class="list" cellspacing="0">
<tr>
    <th class="tight">&nbsp;</th>
    <th>{'Option'|i18n( 'design/standard/class/datatype' )}</th>
</tr>
{section name=Option loop=$class_attribute.content.options}
<tr>
    {* Remove. *}
    <td><input type="checkbox" name="ContentClass_talks_option_remove_array_{$class_attribute.id}[{$Option:item.id}]" value="1" title="{'Select option for removal.'|i18n( 'design/standard/class/datatype' )}" /></td>

    {* Option. *}
    <td><input class="box" type="text" name="ContentClass_talks_option_name_array_{$class_attribute.id}[{$Option:item.id}]" value="{$Option:item.name|wash}" /></td>
</tr>
{/section}
</table>
{section-else}
<p>{'There are no options.'|i18n( 'design/standard/class/datatype' )}</p>
{/section}

{* Buttons. *}
{section show=$class_attribute.content.options}
<input class="button" type="submit" name="ContentClass_talks_removeoption_button_{$class_attribute.id}" value="{'Remove selected'|i18n( 'design/standard/class/datatype' )}" title="{'Remove selected options.'|i18n( 'design/standard/class/datatype' )}" />
{section-else}
<input class="button-disabled" type="submit" name="ContentClass_talks_removeoption_button_{$class_attribute.id}" value="{'Remove selected'|i18n( 'design/standard/class/datatype' )}" disabled="disabled" />
{/section}

<input class="button" type="submit" name="ContentClass_talks_newoption_button_{$class_attribute.id}" value="{'New option'|i18n( 'design/standard/class/datatype' )}" title="{'Add a new option.'|i18n( 'design/standard/class/datatype' )}" />
</fieldset>
</div>