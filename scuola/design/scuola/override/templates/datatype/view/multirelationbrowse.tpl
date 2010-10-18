{foreach $attribute.content.relation_browse as $relation}
{* content_view_gui view=embed content_object=fetch(content,object,hash(object_id,$relation.contentobject_id,object_version,$relation.contentobject_version)) *}<br />
         
{/foreach}
