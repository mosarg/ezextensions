{* Event Calendar - week view *}
{def $event_color = $node.data_map.color.content
     $event_node  = $node
     $event_node_id = $event_node.node_id
     $curr_ts = currentdate()
     $curr_today = $curr_ts|scdatetime(custom, 'N')
     $curr_year =  $curr_ts|datetime(custom, '%Y')
     $curr_week =  $curr_ts|datetime( custom, '%W')}

     {if and(ne($view_parameters.week, ''),ne($view_parameters.year,''))}
       {def $week_time_stamps=scmaketime($view_parameters.week,$view_parameters.year)
            $temp_week=$view_parameters.week
            $temp_year=$view_parameters.year
            $temp_today=cond(ne($view_parameters.day,''),$view_parameters.day,1)}
     {else}
       {def $week_time_stamps=scmaketime($curr_week,$curr_year)
            $temp_week=$curr_week
            $temp_year=$curr_year
            $temp_today=$curr_today}
     {/if}

{def $first_ts=$week_time_stamps[0]
     $last_ts=$week_time_stamps[6]
     $url_reload=concat( $event_node.url_alias,"/(view)/week", "/(day)/", $temp_today, "/(week)/", $temp_week, "/(year)/", $temp_year, "/offset/2")
     $url_back=concat( $event_node.url_alias,  "/(view)/week","/(week)/", sub($temp_week, 1), "/(year)/", $temp_year)
     $url_forward=concat( $event_node.url_alias, "/(view)/week","/(week)/", sum($temp_week, 1), "/(year)/", $temp_year)
     $dayofweek = 0}

{def $events_table=fetch('calendar','events_list',
        hash('parent_node_id',$node.node_id,'from_time',$first_ts,'to_time',$last_ts,'view','week'))}


<div class="border-box">
    
<div class="content-view-full">
    <div class="class-event-calendar" title="{$event_color}" id="event_calendar_{$node.node_id}">
        {if $node.data_map.view.class_content.options[$node.data_map.view.value[0]].name|contains('ultipla')}
        <div class="view roundedtop">
            <a href={concat($event_node.url_alias,'/(view)/month')|ezurl}>{"Mostra mese"|i18n('scuola/calendar')}</a>
        </div>
        <div class="view-selected roundedtop float-break">
            <span>{"Vista settimana"|i18n('scuola/calendario')}</span>
        </div>
       {/if}
        <div class="calendar-week-view">
             <table  cellspacing="0" cellpadding="0" border="0" summary="Event Calendar" class="week-view">
            <thead>
                <tr class="calendar_heading">
                    <th class="calendar_heading_prev first_col"><a href={$url_back|ezurl} title=" Previous month ">&#8249;&#8249;</a></th>
                    <th class="calendar_heading_date" colspan="5">{$first_ts|datetime( custom, '%F' )|upfirst()} {$temp_year}  Settimana {$temp_week|upfirst()}&nbsp;</th>
                    <th class="calendar_heading_next last_col"><a href={$url_forward|ezurl} title=" Next Month ">&#8250;&#8250;</a></th>
                </tr>
                <tr class="calendar_heading_days">
                    <th class="first_col">{"Mon"|i18n("design/ezwebin/full/event_view_calendar")}</th>
                    <th>{"Tue"|i18n("design/ezwebin/full/event_view_calendar")}</th>
                    <th>{"Wed"|i18n("design/ezwebin/full/event_view_calendar")}</th>
                    <th>{"Thu"|i18n("design/ezwebin/full/event_view_calendar")}</th>
                    <th>{"Fri"|i18n("design/ezwebin/full/event_view_calendar")}</th>
                    <th>{"Sat"|i18n("design/ezwebin/full/event_view_calendar")}</th>
                    <th class="last_col">{"Sun"|i18n("design/ezwebin/full/event_view_calendar")}</th>
                </tr>
            </thead>
            <tbody>
                {def $counter=1}

                <tr class="days">
                {while le($counter,7)}
                <td>
                    <div class="timespan" id="event_{$week_time_stamps[sub($counter,1)]}_{$counter}_{$node.node_id}">
                {if is_set($events_table[$temp_year][$temp_week][$counter])}
                     {foreach $events_table[$temp_year][$temp_week][$counter].partial as $day_event}
                        <div style="background-color:{$event_color}" class="event_small rounded" id="event_{$counter}_{$day_event.node_id}">
                            {$day_event.data_map.from_time.content.hour}:{$day_event.data_map.from_time.content.minute}
                            {if $day_event.data_map.to_time.has_content}
                            {$day_event.data_map.to_time.content.hour}:{$day_event.data_map.to_time.content.minute}
                            {/if}
                            <a href={$day_event.url_alias|ezurl}>{$day_event.name}</a>
                            {if $day_event.object.can_edit}
                                <div class="controls">
                                    <form action={"/content/action"|ezurl} method="post">
                                        <input type="image" name="EditButton" src={"icons/pencil_small.png"|ezimage} alt="Edit" />
                                        <input type="hidden" name="ContentObjectLanguageCode" value="{$day_event.object.current_language}" />
                                        <input type="hidden" name="ContentObjectID" value="{$day_event.contentobject_id}" />
                                        <input type="hidden" name="NodeID" value="{$day_event.node_id}" />
                                        <input type="hidden" name="ContentNodeID" value="{$day_event.node_id}" />
                                     </form>
                                </div>
                            {/if}

                        </div>
                       {/foreach}
                {/if}


                    {set $counter=inc( $counter )}
                    </div>
                </td>
                {/while}
                </tr>
            </tbody>
 </table>
        </div>
 </div>
 </div>
</div>
{if $node.object.can_edit}
<script type="text/javascript" src={'javascript/calendar_functions_week.js'|ezdesign} ></script>
<script type="text/javascript" src={'javascript/maketime.js'|ezdesign} ></script>
{/if}