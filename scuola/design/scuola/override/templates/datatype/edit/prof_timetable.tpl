{default attribute_base=ContentObjectAttribute}
{let matrix=$attribute.content}
{* Matrix. *}

{section show=$matrix.rows.sequential}
<table class="list" cellspacing="0">

<tr>
    <th class="tight">{'Hours'|i18n( 'design/standard/content/datatype' )}</th>
    {section var=ColumnNames loop=$matrix.columns.sequential}<th>{$ColumnNames.item.name}</th>{/section}
</tr>

{section var=Rows loop=$matrix.rows.sequential sequence=array( bglight, bgdark )}
<tr class="{$Rows.sequence}">



{* Remove. *}

<td><input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_remove_{$Rows.index}" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="checkbox" name="{$attribute_base}_data_matrix_remove_{$attribute.id}[]" value="{$Rows.index}" title="{'Select row for removal.'|i18n( 'design/standard/content/datatype' )}" />{$Rows.index|inc}°</td>

{* Custom columns. *}



{section var=Columns loop=$Rows.item.columns}
<td><input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_matrix_cell_{$Rows.index}" class="box ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="text" name="{$attribute_base}_ezmatrix_cell_{$attribute.id}[]" value="{$Columns.item|wash( xhtml )}" /></td>
{/section}

</tr>
{/section}
</table>
{section-else}
<p>{'There are no rows in the matrix.'|i18n( 'design/standard/content/datatype' )}</p>
{/section}


<p>{'Inserisci il nome della classe nell\'ora corrispondente oppure R per ricevimento D per disposizione'|i18n('m2000/messages/ore')}</p>


{* Buttons. *}
{section show=$matrix.rows.sequential}
<input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_remove_selected" class="button ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="submit" name="CustomActionButton[{$attribute.id}_remove_selected]" value="{'Remove selected'|i18n( 'design/standard/content/datatype' )}" title="{'Remove selected rows from the matrix.'|i18n( 'design/standard/content/datatype' )}" />
{section-else}
<input class="button-disabled" type="submit" name="CustomActionButton[{$attribute.id}_remove_selected]" value="{'Remove selected'|i18n( 'design/standard/content/datatype' )}" disabled="disabled" />
{/section}
&nbsp;&nbsp;

{let row_count=sub( 40, count( $matrix.rows.sequential ) ) index_var=0}


<input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_new_row" class="button ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="submit" name="CustomActionButton[{$attribute.id}_new_row]" value="{'Aggiungi ora'|i18n('design/standard/content/datatype')}" title="{'Add new rows to the matrix.'|i18n( 'design/standard/content/datatype' )}" />
{/let}


{/let}
{/default}
