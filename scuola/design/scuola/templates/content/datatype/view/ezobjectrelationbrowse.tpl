{if is_set($subview)}
    {foreach $attribute.content.relation_browse as $relation sequence array('light','dark') as $style}
            {content_view_gui view=$subview style=$style content_object=fetch(content,object,hash(object_id,$relation.contentobject_id,object_version,$relation.contentobject_version))}
    {/foreach}
{else}
    {foreach $attribute.content.relation_browse as $relation}
            {content_view_gui view=embed content_object=fetch(content,object,hash(object_id,$relation.contentobject_id,object_version,$relation.contentobject_version))}
    {/foreach}
{/if}