{if gt($attribute.content.relation_browse|count(),0)}
{def $my_relation_object=""}
{foreach $attribute.content.relation_browse as $Relation}
            {set $my_relation_object=fetch(content,object,hash(object_id,$Relation.contentobject_id,object_version,$Relation.contentobject_version))}
            {content_view_gui view=embed content_object=$my_relation_object }
{/foreach}
{else}
{'There are no related objects.'|i18n( 'design/standard/content/datatype' )}

{/if}





