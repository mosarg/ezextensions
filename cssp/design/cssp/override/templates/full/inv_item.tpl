{* Inv item - Full view *}

{mpagedata_set( 'left_menu', true() )}
{mpagedata_set( 'left_nav_menu', false() )}
{mpagedata_set( 'extra_menu', false() )}


{run-once}
{ezcss_require(array('building.css','inventary.css','ui.datepicker.css',
                      'jquery.timeentry.css'))}
{ezscript_require( array( concat( 'ezjsc::', 'jqueryio' ),'classes/jquery-ui-min.js',
            'classes/ui.datepicker.js',
            'classes/dialogs_inventary.js','classes/jquery.timeentry.min.js',
            'classes/inventary.js','init_inventary.js'))}
{/run-once}

{def $user=fetch(user, current_user)}
{def $calendars=fetch_alias( 'children', hash( 'parent_node_id', $node.parent_node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', array('event_calendar')
                                                          ))}


<div class="content-view-full">
    <div class="inv_item">

        
        

        <div class="attribute-header">
            <h1>{$node.name}</h1>
        </div>
        
        {if $node.object.data_map.description.has_content}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        {/if}
        
        <div class="separator"></div>

        <div class="attribute-image">
                {attribute_view_gui attribute=$node.data_map.image}
        </div>

        <table class="item-description">
            <tbody>
                <tr>
                    <td>
                        <h2>Anno  di acquisto</h2>
                    </td>
                    <td>
                         {attribute_view_gui attribute=$node.data_map.year_buy}
                    </td>
                </tr>
                <tr>
                    <td>
                       <h2>Titolo di godimento</h2>
                   </td>
                   <td>
                        {attribute_view_gui attribute=$node.data_map.use_title}
                   </td>
                </tr>
                <tr>
                    <td class>
                        <h2>Utilizzabile da altri istituti</h2>
                    </td>
                    <td>
                        {attribute_view_gui attribute=$node.data_map.lendable}
                    </td>
                </tr>
                <tr>
                    <td>
                        <h2>Stato di conservazione</h2>
                    </td>
                    <td>
                        {attribute_view_gui attribute=$node.data_map.state}
                    </td>
               </tr>
               <tr>
                   <td>
                        <h2>Attuale utilizzo</h2>
                   </td>
                   <td>
                        {attribute_view_gui attribute=$node.data_map.use}
                   </td>
                </tr>
                <tr>
                    <td>
                        <h2>Scuola proprietaria</h2>
                    </td>
                    <td>
                        {attribute_view_gui attribute=$node.data_map.proprieta}
                    </td>
                </tr>
                 <tr>
                    <td>
                        <h2>Disponibilità</h2>
                    </td>
                    <td>
                        {attribute_view_gui attribute=$node.data_map.disponibilita}
                    </td>
                </tr>
                <tr>
                    <td>
                        <h2>Attuale ubicazione</h2>
                    </td>
                    <td>
                         {attribute_view_gui attribute=$node.data_map.location}
                    </td>
                </tr>

        </tbody>
        </table>
     {if $user.is_logged_in}
        <div id="inv_item_interface">

        </div>
     {/if}
    </div>

    <div id="event_edit_container">
    <div id="datepicker"></div>

        <ul>
            <li>
                <h3 >Dalle: </h3>
                <input class="timechooser" id="start" type="text"/>
            </li>
            <li>
                <h3>Alle: </h3>
                <input class="timechooser" id="end" type="text"/>
            </li>
            <li>
                <label for="body">Testo: </label>
                <textarea name="body"></textarea>
            </li>
        </ul>
</div>
</div>

 <div id="config_inv_item" style="visibility:hidden">
            <p title="node_id">{$node.node_id}</p>
            <p title="object_id">{$node.object.id}</p>
            <p title="can_edit">{fetch( 'content', 'can_instantiate_classes',hash('parent_node',$node))}</p>
            <p title="calendar_node_id">{$calendars[0].node_id}</p>
            <p title="item_name">{$node.name}</p>
            <p title="node_url_alias">{$node.url_alias|ezurl(no)}</p>
 </div>
