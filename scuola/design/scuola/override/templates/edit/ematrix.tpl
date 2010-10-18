{* Override for matrix datatype. *} {* if the class-attribute-identifier contains the string: 'matrix_related_node_', the matrix will show a list of related obects in the node_id following the matrix_related_node_ Example:        For the class 'report' a property of type 'matrix' is added. The identifier of the first column is: mepper_matrix_related_node_156 The first clumn of the matrix will now show a pull-downmenu of the objects in node 156.
*}


{default attribute_base=ContentObjectAttribute}
{let matrix=$attribute.content}
{* dbcc *} {def $related_node_ids=array()}
{* Matrix. *}
{section show=$matrix.rows.sequential}
<table class="list" cellspacing="0">
<tr>
<th class="tight">&nbsp;</th>
{section var=ColumnNames loop=$matrix.columns.sequential}
{* dbcc *} {if $ColumnNames.item.identifier|contains( 'matrix_related_node_' ) }
{* dbcc *}   {def $nameExploded= $ColumnNames.item.identifier|explode('matrix_related_node_' )|reverse }
{* dbcc *}   {set $related_node_ids= $related_node_ids|append( $nameExploded[0]) }  
{* dbcc *}   {if $related_nodes}
{* dbcc *}     {set $related_nodes=$related_nodes|merge(hash($ColumnNames.item.index, fetch( content, node, hash( node_id, $nameExploded[0]) ) ) )}  
{* dbcc *}   {else}
{* dbcc *}     {def $related_nodes=hash($ColumnNames.item.index, fetch( content, node, hash( node_id, $nameExploded[0]) ) ) }  
{* dbcc *}   {/if}
{* dbcc *} {else}
{* dbcc *}   {set $related_node_ids= $related_node_ids|append( 0 ) }  
{* dbcc *} {/if}
<th>{$ColumnNames.item.name}</th>
{/section}
</tr>
{section var=Rows loop=$matrix.rows.sequential sequence=array( bglight, bgdark )}
<tr class="{$Rows.sequence}">
{* Remove. *}
<td><input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_remove_{$Rows.index}" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="checkbox" name="{$attribute_base}_data_matrix_remove_{$attribute.id}[]" value="{$Rows.index}" title="{'Select row for removal.'|i18n( 'design/standard/content/datatype' )}" /></td>
{* Custom columns. *}
{* dbcc *} {def $column_id=0}
{section var=Columns loop=$Rows.item.columns}
<td>      
{* dbcc *} {if gt($related_node_ids[$column_id] , 0 )}
{* dbcc *}   <select id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_matrix_cell_{$Rows.index}"      class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" name="{$attribute_base}_ezmatrix_cell_{$attribute.id}[]">
{* dbcc *}     {section show=$attribute.contentclass_attribute.is_required|not}
{* dbcc *}       <option value="" {section show=eq( $attribute.data_int, '' )}selected="selected"{/section}>{'No relation'|i18n( 'design/standard/content/datatype' )}</option>
{* dbcc *}     {/section}
{* dbcc *}     {section var=Nodes loop=fetch( content, list, hash( parent_node_id, $related_nodes[$column_id].node_id, sort_by, $related_nodes[$column_id].sort_array ) )}
{* dbcc *}       <option value="{$Nodes.item.contentobject_id}" {section show=eq( $Columns.item|wash( xhtml ), $Nodes.item.contentobject_id )}selected="selected"{/section}>{$Nodes.item.name|wash}</option>
{* dbcc *}     {/section}
{* dbcc *}   </select>
{* dbcc *} {else}
<input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_matrix_cell_{$Rows.index}" class="box ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="text" name="{$attribute_base}_ezmatrix_cell_{$attribute.id}[]" value="{$Columns.item|wash( xhtml )}" />
{* dbcc *} {/if}
</td>
{* dbcc *} {set $column_id=|inc($column_id)}
{/section}
</tr>
{/section}
</table>
{section-else}
<p>{'There are no rows in the matrix.'|i18n( 'design/standard/content/datatype' )}</p>
{/section}
{* Buttons. *}
{section show=$matrix.rows.sequential}
<input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_remove_selected" class="button ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="submit" name="CustomActionButton[{$attribute.id}_remove_selected]" value="{'Remove selected'|i18n( 'design/standard/content/datatype' )}" title="{'Remove selected rows from the matrix.'|i18n( 'design/standard/content/datatype' )}" />
{section-else}
<input class="button-disabled" type="submit" name="CustomActionButton[{$attribute.id}_remove_selected]" value="{'Remove selected'|i18n( 'design/standard/content/datatype' )}" disabled="disabled" />
{/section}
&nbsp;&nbsp;
{let row_count=sub( 40, count( $matrix.rows.sequential ) ) index_var=0}
{section show=$row_count|lt( 1 )}
{set row_count=0}
{/section}


<select id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_add_count" class="matrix_cell ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" name="{$attribute_base}_data_matrix_add_count_{$attribute.id}" title="{'Number of rows to add.'|i18n( 'design/standard/content/datatype' )}" >


<option value="1">1</option>
{section loop=$row_count}
{set index_var=$index_var|inc}
{delimiter modulo=5}
	<option value="{$index_var}">{$index_var}</option>
{/delimiter}
{/section}
</select>


<input id="ezcoa-{if ne( $attribute_base, 'ContentObjectAttribute' )}{$attribute_base}-{/if}{$attribute.contentclassattribute_id}_{$attribute.contentclass_attribute_identifier}_new_row" class="button ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="submit" name="CustomActionButton[{$attribute.id}_new_row]" value="{'Add rows'|i18n('design/standard/content/datatype')}" title="{'Add new rows to the matrix.'|i18n( 'design/standard/content/datatype' )}" />


{/let}


{/let}


{/default}
