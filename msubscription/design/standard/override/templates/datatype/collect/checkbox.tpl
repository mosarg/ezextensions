{def $attribute_base='ContentObjectAttribute'}
{def $data_int=cond( is_set( $#collection_attributes[$attribute.id]), $#collection_attributes[$attribute.id].data_int, $attribute.data_int )}
<input id="{$attribute.contentclass_attribute.identifier}" type="checkbox" name="{$attribute_base}_data_boolean_{$attribute.id}" {$data_int|choose( '', 'checked="checked"' )} />

{undef}