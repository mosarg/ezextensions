{* Event Calendar - month view *}


{def
$event_color   = $node.data_map.color.content
$event_node    = $node
$event_node_id = $event_node.node_id
$curr_ts = currentdate()
$curr_today = $curr_ts|datetime( custom, '%j')
$curr_year = $curr_ts|datetime( custom, '%Y')
$curr_month = $curr_ts|datetime( custom, '%n')
$temp_ts = cond( and(ne($view_parameters.month, ''), ne($view_parameters.year, '')),
makedate($view_parameters.month, cond(ne($view_parameters.day, ''),$view_parameters.day,
eq($curr_month, $view_parameters.month), $curr_today, 1 ), $view_parameters.year), currentdate() )
$temp_month = $temp_ts|datetime( custom, '%n')
$temp_year = $temp_ts|datetime( custom, '%Y')
$temp_today = $temp_ts|datetime( custom, '%j')
$days = $temp_ts|datetime( custom, '%t')
$first_ts = makedate($temp_month, 1, $temp_year)
$dayone = $first_ts|datetime( custom, '%w' )
$last_ts = makedate($temp_month, $days, $temp_year)
$daylast = $last_ts|datetime( custom, '%w' )
$span1 = $dayone
$span2 = sub( 7, $daylast )
$url_reload=concat( $event_node.url_alias, "/(day)/", $temp_today, "/(month)/", $temp_month, "/(year)/", $temp_year, "/offset/2")
$url_back=concat( $event_node.url_alias,  "/(month)/", sub($temp_month, 1), "/(year)/", $temp_year)
$url_forward=concat( $event_node.url_alias, "/(month)/", sum($temp_month, 1), "/(year)/", $temp_year)
$dayofweek = 0}

{if ne($temp_month, 12)}
{set $last_ts=makedate($temp_month|sum( 1 ), 1, $temp_year)}
{else}
{set $last_ts=makedate(1, 1, $temp_year|sum(1))}
{/if}

{def $events_table=fetch('calendar','events_list',
hash('parent_node_id',$node.node_id,'from_time',$first_ts,'to_time',$last_ts,'view','month'))}


<div class="border-box">
    <div class="content-view-full">
        <div class="class-event-calendar event-calendar-programview">
            {if is_set($events_table[$temp_year][$temp_month])}
            <table class="ezagenda_month_event" cellpadding="0" cellspacing="0">
                <tbody>
                    <tr class="table-header">
                        <th colspan="2">Agenda</th>
                    </tr>
                    {foreach $events_table[$temp_year][$temp_month] as $agenda_event}
                    {foreach $agenda_event.partial as $day_event}
                    <tr>
                        <td  class="ezagenda_month_label">
                            <h2 class="shadowmore">{$day_event.data_map.from_time.content.timestamp|datetime(custom,"%j %M")}</h2>
                        </td>
                        <td class="ezagenda_month_info">

                            <h4><a href={$day_event.url_alias|ezurl}>{$day_event.name|wash}</a></h4>

                            <p>
                                <span class="ezagenda_date">
                                    {$day_event.data_map.from_time.content.timestamp|datetime(custom,"%H:%i")}
                                    {if $day_event.data_map.to_time.has_content}
                                    {if $day_event.data_map.to_time.content.day|int()|eq( $day_event.data_map.from_time.content.day|int() )}
                                    - {$day_event.data_map.to_time.content.timestamp|datetime(custom,"%H:%i")}
                                    {else}
                                    - {$day_event.data_map.to_time.content.timestamp|datetime(custom,"%j %M %H:%i")}
                                    {/if}
                                    {/if}
                                </span>

                                {if $day_event.data_map.category.has_content}
                                <span class="ezagenda_keyword">
                                    {attribute_view_gui attribute=$day_event.data_map.category}
                                </span>
                                {/if}
                            </p>

                            {if $day_event.data_map.text.has_content}
                            <div class="attribute-short">{attribute_view_gui attribute=$day_event.data_map.text}</div>
                            {/if}

                        </td>
                    </tr>
                    {/foreach}
                    {/foreach}
                </tbody>
            </table>
            {/if}
        <div class="backward"><a href={$url_back|ezurl} title=" Previous month">&#8249;&#8249;{"Eventi precedenti"|i18n('scuola/calendar')}</a></div>
        <div class="forward"><a href={$url_forward|ezurl} title=" Next Month ">{"Eventi successivi"|i18n('scuola/calendar')}&#8250;&#8250;</a></div>
        </div>
    </div>
    
</div>