{* Event Calendar - Full Program view *}
{set-block scope=root variable=cache_ttl}3600{/set-block}
{foreach $block.valid_nodes as $calendar}
{def $event_node_id = $calendar.main_node_id
     $curr_ts = currentdate()
     $curr_today = $curr_ts|datetime( custom, '%j')
     $curr_year = $curr_ts|datetime( custom, '%Y')
     $curr_month = $curr_ts|datetime( custom, '%n')
     $temp_ts =$curr_ts
     $temp_month = $temp_ts|datetime( custom, '%n')
     $temp_year = $temp_ts|datetime( custom, '%Y')
     $temp_today = $temp_ts|datetime( custom, '%j')
     $days = $temp_ts|datetime( custom, '%t')
     $first_ts = makedate($temp_month, $curr_today, $temp_year)
     $last_ts = makedate($temp_month, $days|sum(30), $temp_year)}

{def $events=fetch('calendar','events_list',
        hash('parent_node_id',$event_node_id,'from_time',$first_ts,'to_time',$last_ts,'view','plain'))}

<div class="border-box">
<div class="content-view-full">
 <div class="block-event-programview ">
<div class="attribute-header rounded">
    <a href={$calendar.url_alias|ezurl}>{$calendar.object.name|wash()}</a>
</div>
<div id="agenda_programma">
    {foreach $events as $event}
    <table class="block_month_event" cellpadding="0" cellspacing="0">
    <tr>
    <td  class="block_month_label shadow rounded"><h5>{$event.data_map.from_time.content.timestamp|datetime(custom,"%j %M")}</h5></td>
    <td class="block_month_info rounded">
    <h5><a href={$event.url_alias|ezurl}>{$event.name|wash}</a></h5>
    <p>
    <span class="agenda_date">
    {$event.data_map.from_time.content.timestamp|datetime(custom,"%H:%i")}
    {if $event.data_map.to_time.has_content}
        {if $event.data_map.to_time.content.day|int()|eq( $event.data_map.from_time.content.day|int() )}
        - {$event.data_map.to_time.content.timestamp|datetime(custom,"%H:%i")}
        {else}
        - {$event.data_map.to_time.content.timestamp|datetime(custom,"%j %M %H:%i")}
        {/if}
    {/if}
    </span>
    </p>
    
    {if $event.data_map.text.has_content}
        <div class="slide-content">{$event.data_map.text.data_text|strip_tags()}</div>
       
    {/if}

    </td>
    </tr>
    </table>

    {/foreach}
</div>

{undef}
</div>
</div>
</div>

{/foreach}