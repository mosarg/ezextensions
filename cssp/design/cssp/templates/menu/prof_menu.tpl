{set-block scope=root variable=cache_ttl}0{/set-block}
{cache-block keys=$node.url}
<h1>{'Professori'|i18n('m2000/scuola/didattica')}</h1>
{$node.url}

{def $objects=fetch( 'content', 'reverse_related_objects',
                     hash( 'object_id',$node.contentobject_id,'attribute_identifier','professore/teachwhere') )}
 
{foreach $objects as $object}
    		<a href={$object.related_contentobject_array[0].main_node.url_alias|ezurl}>{$object.name|wash}</a><br />
{/foreach}
{/cache-block}
