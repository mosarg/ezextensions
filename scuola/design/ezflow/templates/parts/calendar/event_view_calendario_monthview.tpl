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

    <div class="class-event-calendar" title="{$event_color}" id="event_calendar_{$node.node_id}">
       
        {if $node.data_map.view.class_content.options[$node.data_map.view.value[0]].name|contains('ultipla')}
        <div class="view-selected roundedtop">
            <span>{"Vista Mese"|i18n('scuola/calendario')}</span>
        </div>

        <div class="view float-break roundedtop">
            <a href={concat($event_node.url_alias,'/(view)/week')|ezurl}>{"Mostra settimana"|i18n('scuola/calendar')}</a>
        </div>

       {/if}
        <div class="calendar-month-view">
          <table  cellspacing="0" cellpadding="0" border="0" summary="Event Calendar" class="month-view">
            <thead>
                <tr class="calendar_heading">
                    <th class="calendar_heading_prev first_col"><a href={$url_back|ezurl} title=" Previous month ">&#8249;&#8249;</a></th>
                    <th class="calendar_heading_date" colspan="5" title="{$temp_month}_{$temp_year}">{$temp_ts|datetime( custom, '%F' )|upfirst()}&nbsp;{$temp_year}</th>
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

                {def $counter=1 $col_counter=1 $css_col_class='' $col_end=0}
                {while le( $counter, $days )}
                    {set $dayofweek     = makedate( $temp_month, $counter, $temp_year )|datetime( custom, '%w' )
                     $css_col_class = ''
                     $col_end       = or( eq( $dayofweek, 0 ), eq( $counter, $days ) )}
                    {if or( eq( $counter, 1 ), eq( $dayofweek, 1 ) )}
                        <tr class="days{if eq( $counter, 1 )} first_row{elseif lt( $days|sub( $counter ), 7 )} last_row{/if}">
                        {set $css_col_class=' first_col'}
                    {elseif and( $col_end, not( and( eq( $counter, $days ), $span2|gt( 0 ), $span2|ne( 7 ) ) ) )}
                        {set $css_col_class=' last_col'}
                    {/if}
                    {if and( $span1|gt( 1 ), eq( $counter, 1 ) )}
                        {set $col_counter=1 $css_col_class=''}
                            {while ne( $col_counter, $span1 )}
                                <td class="previous_month">&nbsp;</td>
                                {set $col_counter=inc( $col_counter )}
                            {/while}
                    {elseif and( eq($span1, 0 ), eq( $counter, 1 ) )}
                            {set $col_counter=1 $css_col_class=''}
                            {while le( $col_counter, 6 )}
                                <td class="previous_month">&nbsp;</td>
                                {set $col_counter=inc( $col_counter )}
                            {/while}
                    {/if}
                    <td class="{if eq($counter, $temp_today)}ezagenda_selected{/if}
                        {if and(eq($counter, $curr_today), eq($curr_month, $temp_month))}ezagenda_current{/if}{$css_col_class}">
                        <div class="counter" title="{$counter}">{$counter}</div>
                        {if is_set($events_table[$temp_year][$temp_month][$counter])}
                            {foreach $events_table[$temp_year][$temp_month][$counter].partial as $day_event}
                            <div style="{concat("background:",$event_color)}" class="event_small rounded" id="event_{$counter}_{$day_event.node_id}">
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
                    </td>
                    {if and( eq( $counter, $days ), $span2|gt( 0 ), $span2|ne(7))}
                    {set $col_counter=1}
                    {while le( $col_counter, $span2 )}
                    {set $css_col_class=''}
                    {if eq( $col_counter, $span2 )}
                    {set $css_col_class=' last_col'}
                    {/if}
                    <td class="{$css_col_class} next_month">&nbsp;</td>
                    {set $col_counter=inc( $col_counter )}
                    {/while}
                    {/if}
                    {if $col_end}
                </tr>
                {/if}
                {set $counter=inc( $counter )}
                {/while}
            </tbody>
        </table>
        </div>
 </div>
 </div>
</div>
{undef}
{if $node.object.can_edit}
<script type="text/javascript" src={'javascript/calendar_functions.js'|ezdesign} ></script>
{/if}