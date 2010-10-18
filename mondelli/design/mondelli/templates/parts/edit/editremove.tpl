{if and($current_user.is_logged_in,$current_node_id|ne(0))}

{if $current_user.groups|contains(ezini( 'EditGroupSettings', 'EditGroup', 'mondelli.ini' ))}
{def $present_node = fetch( 'content', 'node', hash( 'node_id', $current_node_id ) )}

{def $av_classes   = fetch( 'content', 'can_instantiate_class_list',hash('parent_node',$current_node_id) )}



 <div class="control-bar rounded-more">
{if $present_node.can_edit}
        <div class="rounded element insert_button">
        <form action={"/content/action"|ezurl} method="post">
           <input type="submit" name="EditButton" class="tools_button edit_button_edit" value="" />
            <input type="hidden" name="ContentObjectLanguageCode" value="{$present_node.object.current_language}" />
            <input type="hidden" name="ContentObjectID" value="{$present_node.contentobject_id}" />
            <input type="hidden" name="NodeID" value="{$current_node_id}" />
            <input type="hidden" name="ContentNodeID" value="{$current_node_id}" />
        </form>
                <span>Modifica</span>
        </div>
{/if}
{if $present_node.can_remove}
        <div class="rounded element insert_button">
        <form action={"/content/action"|ezurl} method="post">
            <input type="submit" name="ActionRemove" value="" class="tools_button edit_button_remove" />
            <input type="hidden" name="ContentObjectID" value="{$present_node.contentobject_id}" />
            <input type="hidden" name="NodeID" value="{$current_node_id}" />
            <input type="hidden" name="ContentNodeID" value="{$current_node_id}" />
        </form>
                <span>Elimina</span>
        </div>
{/if}


{foreach $av_classes as $class}
<div class="rounded element insert_button {concat('insert_button_',$class.identifier|downcase())}">
	<form enctype="multipart/form-data" method="post" action={"content/action/"|ezurl}>
              <input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings','ContentObjectLocale' )}" />
              <input type="hidden" name="ContentObjectID" value="{$present_node.contentobject_id}" />
              <input type="hidden" name="ClassID" value="{$class.id}" />
	      <input type="hidden" name="NodeID" value="{$current_node_id}" />
	      <input class="tools_button {concat('insert_button_',$class.identifier|downcase())}" type="submit" name="NewButton" value="" />
        </form>
    <span>{$class.name}</span>
</div>
{/foreach}

{if ezini( 'MultiUploadSettings', 'AvailableClasses', 'ezmultiupload.ini' )|contains( $present_node.class_identifier )}
      <div class="rounded element insert_button">
         <a href={concat("/ezmultiupload/upload/",$present_node.node_id)|ezurl} title="{'Multiupload'|i18n('extension/ezmultiupload')}"><img src={"props/upload.png"|ezimage} alt="{'Multiupload'|i18n('extension/ezmultiupload')}" /></a>
         <span>Carica</span>
      </div>
    {/if}

</div>

{undef $av_classes}

{/if}
{/if}

