{mpagedata_set( 'left_menu', true() )}
{mpagedata_set( 'left_nav_menu', false() )}
{mpagedata_set( 'extra_menu', false() )}

{def $user=fetch(user, current_user)}
<div class="content-view-full">
    <div class="class-ticket">
	<div class="box-header">
            <h1 class="context-title"> {$node.object.name} </h1>
        </div>
		<div class="context-information">
			<p class="modified">Last modified:{$node.object.modified|l10n( 'datetime' )}, Creator: {$node.creator.name}</p>					
		 </div>
		 <div class="mainobject-window">
    		      <table class="list" >
                             <tr>
                                 <th> {$node.object.data_map.category.contentclass_attribute.name}:</th>
                                 <td> {attribute_view_gui attribute=$node.object.data_map.category} </td>
                             </tr>
                             <tr>
                                 <th>{$node.object.data_map.type.contentclass_attribute.name}: </th>
                                 <td>  {attribute_view_gui attribute=$node.object.data_map.type}  </td>
                             </tr>
                             <tr>
                                 <th>{$node.object.data_map.project.contentclass_attribute.name}: </th>
                                 <td> {attribute_view_gui attribute=$node.object.data_map.project} </td>
                             </tr>
                             <tr>
                                 <th>{$node.object.data_map.assigned.contentclass_attribute.name}: </th>
                                 <td>   {attribute_view_gui attribute=$node.object.data_map.assigned} </td>
                             </tr>
                             <tr>
                                 <th>{$node.object.data_map.priority.contentclass_attribute.name}: </th>
                                 <td>{attribute_view_gui attribute=$node.object.data_map.priority}     </td>
                             </tr>
                             <tr>
                                 <th>{$node.object.data_map.state.contentclass_attribute.name}: </th>
                                 <td>{attribute_view_gui attribute=$node.object.data_map.state}    </td>
                             </tr>
                             <tr>
                                 <th>{$node.object.data_map.deadline.contentclass_attribute.name}:</th>
                                 <td>
					    {if $node.object.data_map.deadline.has_content|not}
                                     <p>none</p>
					    {else}
					      {attribute_view_gui attribute=$node.object.data_map.deadline}
					    {/if}
                                 </td>
                             </tr>
                         </table>
                     <div class="attributes-block">
                         <div class="attribute-short">
                             <h3>{$node.data_map.name.contentclass_attribute.name}:</h3> {$node.name}
                         </div>
                         <div class="attribute-short">
                             <h3>{$node.data_map.description.contentclass_attribute.name}:</h3>
                         </div>
                         <div class="attribute-long">
                            {attribute_view_gui attribute=$node.data_map.description}
                         </div>
                     </div>
        </div>
	</div>
         <div class="controlbar">
             
		 <div class="element">
		  {def $class=fetch( 'content', 'class', hash( 'class_id', 'ticket_comment' ) )}															 
		  <form enctype="multipart/form-data" method="post" action={"content/action/"|ezurl}>	
		   <input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings','ContentObjectLocale' )}" />
		   <input type="hidden" name="ContentObjectID" value="{$node.contentobject_id}" />
		   <input type="hidden" name="ClassID" value="{$class.id}" />
		   <input type="hidden" name="NodeID" value="{$node.node_id}" />
		   <input class="button" type="submit" name="NewButton" value="Aggiungi nuovo commento" />
		 </form>
		</div>
		<div class="element">
		{set $class=fetch( 'content', 'class', hash( 'class_id', 'ticket_attachment' ) )}
		  <form enctype="multipart/form-data" method="post" action={"content/action/"|ezurl}>	
		   <input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings','ContentObjectLocale' )}" />
		   <input type="hidden" name="ContentObjectID" value="{$node.contentobject_id}" />
		   <input type="hidden" name="ClassID" value="{$class.id}" />
		   <input type="hidden" name="NodeID" value="{$node.node_id}" />
		   <input class="button" type="submit" name="NewButton" value="Aggiungi nuovo allegato" />
		 </form>
    
	      </div>
	     {if $node.can_edit}
             <div class="element">
		{set $class=fetch( 'content', 'class', hash( 'class_id', 'ticket' ) )}
		<form enctype="multipart/form-data" method="post" action={"content/action/"|ezurl}>	
		   <input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings','ContentObjectLocale' )}" />												
		   <input type="hidden" name="ContentObjectID" value="{$node.contentobject_id}" />
		   <input type="hidden" name="ClassID" value="{$class.id}" />
		   <input type="hidden" name="NodeID" value="{$node.node_id}" />
		   <input class="button" type="submit" name="EditButton" value="Modifica" />
		</form>	
		{undef $class}
		</div>
		{/if}
             <div class="element">
                    <form action={$node.parent.url_alias|ezurl}>
                        <input class="button" type="submit" value="Ritorna alla gestione ticket" />
                    </form>
		</div>
</div>  							 
				

			
            {include uri='design:ticketsystem/ticket_attachments.tpl'}

            {include uri='design:ticketsystem/ticket_comments.tpl'}

	
	</div>

