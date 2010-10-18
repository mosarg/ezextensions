
{def $tickets=fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                'attribute_filter',array(array( 'owner','=',$user.contentobject_id )),
                                                'limit', $number_of_items))}
{if $tickets|count()|gt(0)}
        <div class="content-navigation-childlist">
            <table class="list" cellspacing="0">
                <tr>
                    <th> ID             	</th>
                    <th> Nome richiesta		</th>
                    <th> Priorità               </th>
                    <th> Data			</th>
                    <th> Stato			</th>
                    <th> Assegnatario	</th>
                    <th> Progetto		</th>
                    <th> Azione                 </th>
                </tr>

              {def $child_name=''
                   $node_name=$node.name}
              {foreach  $tickets as $ticket sequence array( bglight, bgdark ) as $style}

              {set $child_name=$ticket.name|wash}

                <tr class="{$style}">
                    <td>{$ticket.main_node_id}</td>
                    <td width="30%">{node_view_gui view=line content_node=$ticket}</td>
                    <td width="10%"> {attribute_view_gui attribute=$ticket.data_map.priority}							 	  	 </td>
                    <td width="10%"> {$ticket.object.published|l10n( 'shortdate' )}													 </td>
                    <td width="10%"> {attribute_view_gui attribute=$ticket.data_map.state}									 </td>
                    <td width="10%"> {attribute_view_gui attribute=$ticket.data_map.assigned} 							  	 </td>
                    <td width="10%"> {attribute_view_gui attribute=$ticket.data_map.project}								 	 </td>
                    <td width="10%">
                        <form enctype="multipart/form-data" method="post" action={"content/action/"|ezurl}>
                            <input type="hidden" name="TopLevelNode" value="{$node.main_node_id}" />
                            <input type="hidden" name="ContentNodeID" value="{$ticket.main_node_id}" />
                            <input type="hidden" name="ContentObjectID" value="{$ticket.contentobject_id}" />
                            <input type="hidden" name="ContentObjectLanguageCode" value="{ezini( 'RegionalSettings','ContentObjectLocale' )}" />

		  {if $ticket.can_remove}
                            <input class="button"  type="submit" name="ActionRemove" value="Elimina"/>
	          {else}
                            <input class="button-disabled"  type="submit" name="ActionRemove"value="Elimina" disabled="disabled" />
		  {/if}

		  {if $ticket.can_edit}
                            <input class="button"  type="submit" name="EditButton" value="Modifica"/>
		  {else}
                            <input class="button-disabled"  type="submit" name="EditButton" value="Modifica" disabled="disabled"/>
		  {/if}

                            <input class="button"  name="UpdatePriorityButton" type="submit" value="Visualizza"/>
                        </form>
                    </td>
                </tr>
            {/foreach}
            </table>
        </div>
        <div class="context-toolbar">
					{include name=navigator
					         uri='design:navigator/google.tpl'
					         page_uri=$node.url_alias
					         item_count=$children_count
					         view_parameters=$view_parameters
					         item_limit=$number_of_items}
        </div>
{else}
        <div class="context-toolbar">
           <div class="block">
               <p>{'Nessun Ticket di intervento presente'|i18n( 'design/admin/node/view/full' )}</p>
           </div>
        </div>

{/if}


 <div class="controlbar">
          <div class="block">
              <div class="left">
        	{def $class=fetch( 'content', 'class', hash( 'class_id', 'ticket' ) )}
               <form method="post" action={"content/action/"|ezurl}>
		       <input type="hidden" name="ContentLanguageCode" value="ita-IT" />
                       <input class="button" type="submit" name="NewButton" value="Aggiungi nuova richiesta" />
                       <input type="hidden" name="ClassID" value={$class.id} />
                       <input type="hidden" name="NodeID" value="{$node.node_id}" />
                    </form>
	         {undef $class}
             </div>
         <div class="break"></div>
     </div>
</div> 