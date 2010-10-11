{* Multicalendar - Full view *}
{mpagedata_set( 'left_menu', true() )}
{mpagedata_set( 'left_nav_menu', true() )}
{mpagedata_set( 'extra_menu', false() )}
{def $related_node=''}

{run-once}
{ezcss_require(array('fullcalendar.css','mcalendar.css','dialog.css'))}
{ezscript_require( array( concat( 'ezjsc::', 'jqueryio' ),
        'classes/jquery-ui-min.js','classes/fullcalendar.js',
        'init_multicalendar.js','classes/dialogs.js','classes/calendar_legend.js' ))}
{/run-once}

{if $node.object.state_id_array|contains('6')}
        <div class="wip rounded shadowmore">
            <p>{"Contenuto in preparazione non ancora visibile pubblicamente"|i18n('scuola/state')}</p>
        </div>
    {/if}
    
      
<div class="border-box">
     <div class="content-view-full">
  
        <div id="calendar"></div>
        <div id="event_edit_container">
            <form>
                <input type="hidden" />
                <ul>
                    <li>
                        <label for="calendar">Scegli il calendario: </label>
                        <select name="calendar">

                        </select>
                    </li>
                    <li>
                        <label for="start">Ora inizio: </label>
                        <select name="start">

                        </select>
                    </li>
                    <li>
                        <label for="end">Ora fine: </label>
                        <select name="end">

                        </select>
                    </li>
                    <li>
                        <label for="title">Titolo: </label><input type="text" name="title" />
                    </li>
                    <li>
                        <label for="body">Testo: </label><textarea name="body"></textarea>
                    </li>
                </ul>
            </form>
        </div>
        <div id="config" style="visibility:hidden">
            <p title="action">{"/content/action"|ezurl}</p>
            <p title="editIcon">{"icons/pencil_small.png"|ezimage}</p>
            <p title="node_id">{$node.node_id}</p>
            <p title="can_edit">{fetch( 'content', 'can_instantiate_classes' ,hash('parent_node',$node))}</p>
            <p title="calendars_list">[{foreach $node.data_map.calendars.content.relation_list as $relation}{set $related_node = fetch( 'content', 'node', hash( 'node_id', $relation.node_id ) )} {hash('calendar_id',$relation.node_id,'calendar_name',$related_node.name,'event_color',$related_node.data_map.color.content)|json_encode()},{/foreach}]</p>
        </div>
    </div>
</div>
{undef}