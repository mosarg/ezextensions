{* Event Calendar - Full view *}

<!--load jquery-->

{mpagedata_set( 'left_menu', false() )}
{mpagedata_set( 'left_nav_menu', false() )}
{mpagedata_set( 'extra_menu', false() )}

{run-once}
{ezcss_require(array('fullcalendar.css','mcalendar.css','dialog.css'))}
{ezscript_require( array( concat( 'ezjsc::', 'jqueryio' ),
'classes/jquery-ui-min.js','classes/fullcalendar.js',
'fcalendar.js','classes/dialogs.js' ))}
{/run-once}



{if $node.object.state_id_array|contains('6')}
<div class="wip rounded shadowmore">
    <p>{"Contenuto in preparazione non ancora visibile pubblicamente"|i18n('mcalendar/fullcalendar')}</p>
</div>
{/if}


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
    <div id="tools_container" style="visibility:hidden">
        <p title="action">{"/content/action"|ezurl}</p>
        <p title="editIcon">{"icons/pencil_small.png"|ezimage}</p>
        <p title="node_id">{$node.node_id}</p>
        <p title="event_color">{$node.data_map.color.content}</p>
        <p title="calendar_type">{$node.data_map.view.class_content.options[$node.data_map.view.value[0]].name|downcase()}</p>
        <p title="can_edit">{fetch( 'content', 'can_instantiate_classes',hash('parent_node',$node))}</p>
        <p title="calendars_list">[{hash('calendar_id',$node.node_id,'calendar_name',$node.name,'event_color',$node.data_map.color.content)|json_encode()}]</p>
        <p title="month_names">{"Gennaio,Febbraio,Marzo,Aprile,Maggio,Giugno,Luglio,Agosto,Settembre,Ottobre,Novembre,Dicembre"|i18n('mcalendar/fullcalendar')}</p>
        <p title="month_names_short">{"Gen,Feb,Mar,Apr,Mag,Giu,Lug,Ago,Set,Ott,Nov,Dic"|i18n('mcalendar/fullcalendar')}</p>
        <p title="day_names">{"Domenica,Lunedì,Martedì,Mercoledì,Giovedì,Venerdì,Sabato"|i18n('mcalendar/fullcalendar')}</p>
        <p title="day_names_short">{"Dom,Lun,Mar,Mer,Gio,Ven,Sab"|i18n('mcalendar/fullcalendar')}</p>
    </div>
</div>



