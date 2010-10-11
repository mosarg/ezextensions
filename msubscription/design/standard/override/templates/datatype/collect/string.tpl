{def $attribute_base='ContentObjectAttribute'
     $html_class='full'}
{def $data_text=cond( is_set( $#collection_attributes[$attribute.id] ), $#collection_attributes[$attribute.id].data_text, $attribute.content )}
<input id="{$attribute.contentclass_attribute.identifier}" class="{eq( $html_class, 'half' )|choose( 'box', 'halfbox' )}" type="text" size="70" name="{$attribute_base}_ezstring_data_text_{$attribute.id}" value="{$data_text|wash( xhtml )}" />

{undef}