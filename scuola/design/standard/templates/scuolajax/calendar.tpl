{* Event Calendar - Full Calendario2 view *}



{def
     $event_color =   '#fafafa'
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
        hash('parent_node_id',$node.node_id,'from_time',$first_ts,'to_time',$last_ts))}

<div class="border-box">

<div class="content-view-full">

    <div class="class-event-calendar">
        <div class="calendar-month-view">
          <table  cellspacing="0" cellpadding="0" border="0" summary="Event Calendar" class="month-view">
            <thead>
                <tr class="calendar_heading">
                    <th class="calendar_heading_prev first_col"><a href={$url_back|ezurl} title=" Previous month ">&#8249;&#8249;</a></th>
                    <th class="calendar_heading_date" colspan="5">{$temp_ts|datetime( custom, '%F' )|upfirst()}&nbsp;{$temp_year}</th>
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
                        <div class="counter">{$counter}</div>
                        {if is_set($events_table[$curr_year][$curr_month][$counter])}
                            {foreach $events_table[$curr_year][$curr_month][$counter].partial as $day_event}
                            <div style="background-color:{$event_color}" class="event_small" id="event_{$day_event.node_id}">
                            <a href={$day_event.url_alias|ezurl}>{$day_event.name}</a>
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




  
