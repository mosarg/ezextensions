{def $tickets=fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                              'offset', $view_parameters.offset,
                                              'attribute_filter', $attribute_filter,
                                              'limit', $number_of_items,
                                              'sort_by', $selected_sort_by,
                                              'extended_attribute_filter', array()))}

<div class="content-navigation">
       <div class="box-header">
         <h1 class="context-title">Lista richieste intervento</h1>
      </div>
</div>
        <div class="context-toolbar">
            <div class="block">
                <div class="left">
                    <p> Elementi per pagina:
                        {switch match=$number_of_items}
                          {case match=25}
                            <a href={'/user/preferences/set/admin_list_limit/1'|ezurl} title="{'Show 10 items per page.'|i18n( 'design/admin/node/view/full' )}">10</a>
                            <span class="current">25</span>
                            <a href={'/user/preferences/set/admin_list_limit/3'|ezurl} title="{'Show 50 items per page.'|i18n( 'design/admin/node/view/full' )}">50</a>
		          {/case}
			  {case match=50}
                            <a href={'/user/preferences/set/admin_list_limit/1'|ezurl} title="{'Show 10 items per page.'|i18n( 'design/admin/node/view/full' )}">10</a>
                            <a href={'/user/preferences/set/admin_list_limit/2'|ezurl} title="{'Show 25 items per page.'|i18n( 'design/admin/node/view/full' )}">25</a>
                            <span class="current">50</span>
			  {/case}
			 {case}
                            <span class="current">10</span>
                            <a href={'/user/preferences/set/admin_list_limit/2'|ezurl} title="{'Show 25 items per page.'|i18n( 'design/admin/node/view/full' )}">25</a>
                            <a href={'/user/preferences/set/admin_list_limit/3'|ezurl} title="{'Show 50 items per page.'|i18n( 'design/admin/node/view/full' )}">50</a>
			 {/case}
		      {/switch}
                    </p>
                </div>
                <div class="break"></div>
            </div>
        </div>
        <div class="context-toolbar">
            <div class="block">
                <form id="selector" name="selector" enctype="multipart/form-data" method="get" action="{$node.url_alias|ezurl}">
                    <input name="url" type="hidden" value={$node.url_alias|ezurl} />
                    {def $classes=fetch( 'class', 'list', hash( 'class_filter', array( 'ticket' ) ) )}
                    <div class="element">
                        <label for="state">Stato</label><div class="break"></div>
                        <select name="state" multiple size="{$classes.0.data_map.state.content.options|count}">
                            {foreach $classes.0.data_map.state.content.options as $options}
                            <option value="{$options.id}" {if $selected_states|contains($options.id)} selected{/if}>{$options.name}</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="element">
                        {def $users = fetch( 'content', 'tree', hash( 'parent_node_id',   5,
                                             'main_node_only', true(),
                                             'class_filter_type',  'include',
                                              'class_filter_array', array( 'user' ) ) )}
                        <label for="creator">Creatore</label><div class="break"></div>
                        <select name="creator" multiple size="8">
                            <option value="0" {if $selected_creator|contains(0)} selected{/if}>Any</option>
                            {foreach $users as $system_user}
                            <option value="{$system_user.contentobject_id}" {if $selected_creator|contains($system_user.contentobject_id)} selected{/if}>{$system_user.name}</option>
                            {/foreach}
                        </select>
                    </div>


                    <div class="element">
                        <label for="sort_by">Ordina</label><div class="break"></div>
                        <select name="sort_by">
                            <option value="published" {if $view_parameters.sort_by|eq('published')} selected{/if}>Data</option>
                            <option value="priority" {if $view_parameters.sort_by|eq('priority')} selected{/if}>Priorità</option>
                            <option value="name" {if $view_parameters.sort_by|eq('name')} selected{/if}>Nome</option>
                            <option value="owner" {if $view_parameters.sort_by|eq('owner')} selected{/if}>Creatore</option>
                            <option value="project" {if $view_parameters.sort_by|eq('project')} selected{/if}>Progetto</option>
                            <option value="state" {if $view_parameters.sort_by|eq('state')} selected{/if}>Stato</option>
                        </select>
                        <div class="break"></div>
                        <label for="sort_direction">Ordinamento</label><div class="break"></div>
                        <select name="sort_direction">
                            <option value="0" {if $view_parameters.sort_direction|eq('0')} selected{/if}>Discendente</option>
                            <option value="1" {if $view_parameters.sort_direction|eq('1')} selected{/if}>Ascendente</option>
                        </select>
                    </div>
                    <div class="element">
                        {literal}
                        <input name="Select" value="Seleziona" onclick="var url = document.selector.url.value;
    if ( document.selector.state.value )
    {
        url += '/(state)/';
        for (var i=0; i < document.selector.state.options.length; i++ )
        {
            if ( document.selector.state.options[i].selected == true )
            {
                url += document.selector.state.options[i].value + ',';
            }
        }
    }
    if ( document.selector.creator.value )
    {
        url += '/(creator)/';
        for (var i=0; i < document.selector.creator.options.length; i++ )
        {
            if ( document.selector.creator.options[i].selected == true )
            {
                url += document.selector.creator.options[i].value + ',';
            }
        }
    }
    if ( document.selector.sort_by.value )
    {
        url += '/(sort_by)/';
        for (var i=0; i < document.selector.sort_by.options.length; i++ )
        {
            if ( document.selector.sort_by.options[i].selected == true )
            {
                url += document.selector.sort_by.options[i].value;
            }
        }
    }
    if ( document.selector.sort_direction.value )
    {
        url += '/(sort_direction)/';
        for (var i=0; i < document.selector.sort_direction.options.length; i++ )
        {
            if ( document.selector.sort_direction.options[i].selected == true )
            {
                url += document.selector.sort_direction.options[i].value;
            }
        }
    }
    window.location.href = url;" type="button" class="button" />
                        {/literal}
                    </div>

                </form>
                <div id="searchbox" style="float: right; padding-right: 30px;">
                    <form action={"/content/search"|ezurl}>
                        <input id="searchtext" name="SearchText" type="text" value="" size="12" />
                        <input id="SubTreeArray[]" name="SubTreeArray[]" type="hidden" value="{$node.node_id}" />
                        <input id="searchbutton" class="button" type="submit" value="{'Search'|i18n('ticketsystem/design/standard')}" alt="Submit" />

                    </form>
                </div>
                <div class="break"></div>
            </div> {* END class="block" *}
        </div>
        {if $tickets|count()|gt(0)}
        <div id="tickets" class="content-navigation-childlist">
            <table class="list" cellspacing="0">
                <tr>
                    <th> ID             	</th>
                    <th> Nome richiesta		</th>
                    <th> Priorità               </th>
                    <th> Data			</th>
                    <th> Stato			</th>
                    <th> Creatore		</th>
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
                    <td width="10%"> {attribute_view_gui attribute=$ticket.data_map.priority}</td>
                    <td width="10%"> {$ticket.object.published|l10n( 'shortdate' )}</td>
                    <td class="state" width="10%" title="{$ticket.object.id}"> <span>{attribute_view_gui attribute=$ticket.data_map.state}</span> </td>

                    <td width="10%"> {if eq($user.contentobject.name, $ticket.creator.name)}Self{else}{$ticket.object.owner.name}{/if} </td>
                    <td class="assegnee" width="10%" title="{$ticket.object.id}"> <span>{attribute_view_gui attribute=$ticket.data_map.assigned}</span> </td>
                    <td width="10%"> {attribute_view_gui attribute=$ticket.data_map.project} </td>
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

                            <input class="button"  name="UpdatePriorityButton" type="submit" value="Mostra"/>
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
               <p>{'The current item does not contain any sub items.'|i18n( 'design/admin/node/view/full' )}</p>
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