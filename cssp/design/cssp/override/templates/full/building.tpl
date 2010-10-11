{mpagedata_set( 'left_menu', true() )}
{mpagedata_set( 'left_nav_menu', false() )}
{mpagedata_set( 'extra_menu', false() )}


{run-once}
{ezcss_require(array('jquery.svg.css','building.css','ui.datepicker.css',
                      'jquery.timeentry.css'))}
{ezscript_require( array( concat( 'ezjsc::', 'jqueryio' ),
            'classes/jquery.svgdom.min.js','classes/jquery-ui-min.js','classes/ui.datepicker.js',
            'classes/dialogs_booking.js','classes/jquery.timeentry.min.js',
            'classes/booking.js','init_booking.js'))}
{/run-once}

{def $calendars=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', array('event_calendar')
                                                          ))}
{def $user=fetch(user, current_user)}
<div class="content-view-full">
    <div class="building">


        <div class="attribute-short">
            <h1>{attribute_view_gui attribute=$node.data_map.title}</h1>
            {if $calendars|count()|gt(0)}
            <a href={$calendars[0].url_alias|ezurl()}><img title="{$calendars[0].name}" src={'icons/calendar_icon.png'|ezimage()} alt="{$calendars[0].name}"/> </a>
            {/if}
           {if $user.is_logged_in}
            <button id="personal">
                Le mie prenotazioni
                <img class="down" alt="down arrow" src={'icons/down_arrow_small.png'|ezimage()}/>
                <img class="hidden up" alt="up arrow" src={'icons/up_arrow_small.png'|ezimage()}/>
            </button>
           {/if}
        </div>
        <div id="user_bookings" class="hidden"></div>
        <div class="attribute-long">
            {attribute_view_gui attribute=$node.data_map.description}
        </div>

{if $node.children_count|gt(0)}
{def $rooms=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', array('building_room')
                                                          ))
     $rooms_list=array()}


        <div id="svgmap">
            <div id="graph"></div>
            <div id="legend">
                <h2>Stanze prenotabili</h2>
                <div class="content-view-children">
                    {foreach $rooms as  $room}

                    {node_view_gui view=line content_node=$room}
                    {set $rooms_list=$rooms_list|append(hash('room_code',$room.data_map.room_code.content,'room_name',$room.name))}

                    {/foreach}
                    
                </div>
            </div>
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

     

 <div id="config" style="visibility:hidden">
            <p title="node_id">{$node.node_id}</p>
            <p title="user_id">{$user.contentobject_id}</p>
            <p title="svg_url">{$node.data_map.svgmap.content.filepath|ezurl(no)}</p>
            <p title="building_name">{$node.data_map.title.content}</p>
            <p title="calendar_node_id">{$calendars[0].node_id}</p>
            <p title="clock_image">{'spinnerGem.png'|ezimage(no)}</p>
            <p title="rooms_list">{$rooms_list|json_encode()}</p>
            <p title="object_id">{$node.object.id}</p>
            <p title="can_edit">{$user.is_logged_in}</p>

 </div>


 {/if}

  </div>
</div>