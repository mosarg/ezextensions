{if gt($attribute.content.relation_browse|count(),0)}
    
    {*check weather we want to sort related objects in some way*}
    
    {def $my_relation_object=""}
    {if is_set($sort)}
        {*fetch schools*}
    <table class="related_class">      
     {foreach $attribute.content.relation_browse as $Relation}
           {set $my_relation_object=fetch('content','object',
         hash('object_id',$Relation.contentobject_id,'object_version',
         $Relation.contentobject_version))}
         
    <tr>
        <td>
        {content_view_gui view=$context content_object=$my_relation_object }
       </td><td>
        {$my_relation_object.main_node.url|explode('/')[0]}
        </td>
       </tr>
    {/foreach}
   </table>  
        
    {else}
        {foreach $attribute.content.relation_browse as $Relation}
            {set $my_relation_object=fetch(content,object,hash(object_id,$Relation.contentobject_id,object_version,$Relation.contentobject_version))}
            {content_view_gui content_object=$my_relation_object }
           
        {/foreach}
     {/if}
{else}
    {'There are no related objects.'|i18n( 'design/standard/content/datatype' )}
 {undef $my_relation_object}
{/if}
