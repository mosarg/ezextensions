{* matrice alunni edit*}

{def $attribute_base=ContentObjectAttribute
     $matrix=$attribute.content
     $columns=array()}
{if $matrix.rows.sequential}



<table class="list" cellspacing="0">

<tr>
  <th class="tight">{'Seleziona'|i18n( 'design/msubscription/rules' )}</th>
    {foreach $matrix.columns.sequential as $ColumnNames}
        <th class="tight">{$ColumnNames.name}</th>
  {/foreach}
</tr>

{foreach $matrix.rows.sequential as $index=>$Rows sequence array( bglight, bgdark ) as $style}
<tr class="{$style}">
{* Remove. *}
<td><input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_remove_{$index}"
           class="ezcc-{$attribute.object.content_class.identifier}
           ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}"
           type="checkbox" name="{$attribute_base}_data_matrix_remove_{$attribute.id}[]" value="{$index}"
           title="{'Select row for removal.'|i18n( 'design/standard/content/datatype' )}" /></td>

<td><input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_matrix_cell_{$index}_0" class="box ezcc-{$attribute.object.content_class.identifier}
           ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}"
           type="text" name="{$attribute_base}_ezmatrix_cell_{$attribute.id}[]" value="{$Rows.columns[0]|wash( xhtml )}" />

{set $columns=$Rows.columns|remove(0)}
{foreach $columns as $col_key=>$cell}
<td>
   <select id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_matrix_cell_{$index}_{$col_key|inc}" class="box ezcc-{$attribute.object.content_class.identifier}
           ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}"
           type="select" name="{$attribute_base}_ezmatrix_cell_{$attribute.id}[]">
<option value="yes"
    {if eq($Rows.columns[$col_key|inc],'yes')} selected="selected"{/if}>Si</option>
<option value="no"
    {if eq($Rows.columns[$col_key|inc],'no')} selected="selected"{/if}>No</option>
    </select>
</td>
{/foreach}

</tr>
{/foreach}
</table>
{else}
<p>{'There are no rows in the matrix.'|i18n( 'design/standard/content/datatype' )}</p>
{/if}


{* Buttons. *}
{if $matrix.rows.sequential}
<input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_remove_selected" class="button ezcc-{$attribute.object.content_class.identifier}
        ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}"
        type="submit" name="CustomActionButton[{$attribute.id}_remove_selected]"
        value="{'Remove selected'|i18n( 'design/standard/content/datatype' )}"
        title="{'Remove selected rows from the matrix.'|i18n( 'design/standard/content/datatype' )}" />
{else}
<input class="button-disabled" type="submit" name="CustomActionButton[{$attribute.id}_remove_selected]" value="{'Remove selected'|i18n( 'design/standard/content/datatype' )}" disabled="disabled" />
{/if}
&nbsp;&nbsp;

{def $row_count=sub( 40, count( $matrix.rows.sequential ) )
     $index_var=0}


<input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_new_row"
                class="button ezcc-{$attribute.object.content_class.identifier} ezcca-
                {$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}"
                type="submit" name="CustomActionButton[{$attribute.id}_new_row]"
                value="{'Aggiungi regola'|i18n( 'design/msubscription/rules' )}"
                title="{'Add new rows to the matrix.'|i18n( 'design/msubscription/rules' )}" />
{undef}
