{* Object Relations multi location  *}
{def $linkedEl=''}

{if is_set($attribute.content.relation_list)}
    {foreach $attribute.content.relation_list as $relation}
        {if $relation.in_trash|not()}
            {set $linkedEl=fetch( content, object, hash( object_id, $relation.contentobject_id ))}
          <a href={concat($path,'/Docenti/',$linkedEl.name|preg_replace('/ /','-'))|ezurl}>{$linkedEl.name}</a>
         {/if}
    {/foreach}
{else}
    {'There are no related objects.'|i18n( 'design/standard/content/datatype' )}
{/if}