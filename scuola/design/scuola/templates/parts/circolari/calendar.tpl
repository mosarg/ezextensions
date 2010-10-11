<!--START: CAL NAV CIRCOLARI-->
<script type="text/javascript">
    $.include({"stylesheets/embed/agenda.css"|ezdesign});
</script>
{def

$circolare_node    = $used_node
$circolare_node_id = $circolare_node.node_id

$curr_ts = currentdate()
$curr_today = $curr_ts|datetime( custom, '%j')
$curr_year = $curr_ts|datetime( custom, '%Y')
$curr_month = $curr_ts|datetime( custom, '%n')

$temp_ts = cond( and(ne($view_parameters.month, ''), ne($view_parameters.year, '')), makedate($view_parameters.month, cond(ne($view_parameters.day, ''),$view_parameters.day, eq($curr_month, $view_parameters.month), $curr_today, 1 ), $view_parameters.year), currentdate() )

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

$dayofweek = 0

$day_array = " "
$loop_dayone = 1
$loop_daylast = 1
$day_circolares = array()
$loop_count = 0
}

{if ne($temp_month, 12)}
{set $last_ts=makedate($temp_month|sum( 1 ), 1, $temp_year)}
{else}
{set $last_ts=makedate(1, 1, $temp_year|sum(1))}
{/if}

{def    $circolare_items=fetch( 'content', 'list', hash(
'parent_node_id', $circolare_node_id,
'sort_by', array( 'attribute', true(), 'file/publication_date'),
'class_filter_type',  'include',
'class_filter_array', array( 'file' ),
'main_node_only', true(),
'attribute_filter',
array( array( 'file/publication_date', 'between', array( sum($first_ts,1), sub($last_ts,1)  )) )
))

$url_reload=concat( $circolare_node.url_alias, "/(day)/", $temp_today, "/(month)/", $temp_month, "/(year)/", $temp_year, "/offset/2")
$url_back=concat( $circolare_node.url_alias,  "/(month)/", sub($temp_month, 1), "/(year)/", $temp_year)
$url_forward=concat( $circolare_node.url_alias, "/(month)/", sum($temp_month, 1), "/(year)/", $temp_year)}

{if eq($temp_month, 1)}
{set $url_back=concat( $circolare_node.url_alias,"/(month)/", "12", "/(year)/", sub($temp_year, 1))}
{elseif eq($temp_month, 12)}
{set $url_forward=concat( $circolare_node.url_alias,"/(month)/", "1", "/(year)/", sum($temp_year, 1))}
{/if}

{foreach $circolare_items as $circolare}
{if eq($temp_month|int(), $circolare.data_map.publication_date.content.month|int())}
{set $loop_dayone = $circolare.data_map.publication_date.content.day}
{else}
{set $loop_dayone = 1}
{/if}
{if eq($temp_month|int(), $circolare.data_map.publication_date.content.month|int())}
{if $circolare.data_map.to_time.content.is_valid}
{set $loop_daylast = $circolare.data_map.publication_date.content.day}
{else}
{set $loop_daylast = $loop_dayone}
{/if}
{else}
{set $loop_daylast = $days}
{/if}
{for $loop_dayone|int() to $loop_daylast|int() as $counter}
{set $day_array = concat($day_array, $counter, ', ')}
{if eq($counter,$temp_today)}
{set $day_circolares = $day_circolares|append($event)}
{/if}
{/for}
{/foreach}
<div class="content-view-embed">
    <div class="class-event-calendar">
        <div class="calendar-month-view">


            <table cellpadding="0" cellspacing="0" border="0" summary="{'Calendar'|i18n('design/ezwebin/circolare/calendar')}">
                  <tr class="calendar_heading">
                    <th class="calendar_heading_prev first_col"><a href={$url_back|ezurl} title=" Previous month ">&#8249;&#8249;</a></th>
                    <th class="calendar_heading_date" colspan="5"><a href={$circolare_node.url_alias|ezurl}>{$temp_ts|datetime( custom, '%F' )|upfirst()}&nbsp;{$temp_year}</a></th>
                    <th class="calendar_heading_prev first_col"><a href={$url_forward|ezurl} title=" Previous month ">&#8250;&#8250;</a></th>
                </tr>
                
                <tr class="calendar_heading_days">
                    <th class="first_col">{"Mon"|i18n("design/ezwebin/circolare/calendar")}</th>
                    <th>{"Tue"|i18n("design/ezwebin/circolare/calendar")}</th>
                    <th>{"Wed"|i18n("design/ezwebin/circolare/calendar")}</th>
                    <th>{"Thu"|i18n("design/ezwebin/circolare/calendar")}</th>
                    <th>{"Fri"|i18n("design/ezwebin/circolare/calendar")}</th>
                    <th>{"Sat"|i18n("design/ezwebin/circolare/calendar")}</th>
                    <th class="last_col">{"Sun"|i18n("design/ezwebin/circolare/calendar")}</th>
                </tr>

                {def $counter=1 $col_counter=1 $css_col_class='' $col_end=0}

                {while le( $counter, $days )}
                {set $dayofweek     = makedate( $temp_month, $counter, $temp_year )|datetime( custom, '%w' )
                $css_col_class = ''
                $col_end       = or( eq( $dayofweek, 0 ), eq( $counter, $days ) )}
                {if or( eq( $counter, 1 ), eq( $dayofweek, 1 ) )}
                <tr class="days{if le( $days|sub( $counter ), 7 )}bottom{/if}">
                    {set $css_col_class=' left'}
                    {elseif and($col_end, not(and(eq( $counter, $days ), $span2|gt( 0 ), $span2|ne(7))) )}
                    {set $css_col_class=' right'}
                    {/if}
                    {if and( $span1|gt( 1 ), eq( $counter, 1 ) )}
                    {set $col_counter=1 $css_col_class=''}
                    {while ne( $col_counter, $span1 )}
                    <td{if $col_counter|eq( 1 )} class="left"{/if}>&nbsp;</td>
                    {set $col_counter=inc( $col_counter )}
                    {/while}
                    {elseif and( eq($span1, 0 ), eq( $counter, 1 ) )}
                    {set $col_counter=1 $css_col_class=''}
                    {while le( $col_counter, 6 )}
                    <td{if $col_counter|eq( 1 )} class="right"{/if}>&nbsp;</td>
                    {set $col_counter=inc( $col_counter )}
                    {/while}
                    {/if}
                    {if $day_array|contains(concat(' ', $counter, ',')) }
                        <td class="evcont">
                          <em><a href={concat( $circolare_node.url_alias, "/(day)/", $counter, "/(month)/", $temp_month, "/(year)/", $temp_year)|ezurl}>{$counter}</a></em>
                        </td>
                    {else}
                    <td class="{if eq($counter, $temp_today)}evcont{/if} {if and(eq($counter, $curr_today), eq($curr_month, $temp_month))}today{/if}{$css_col_class}">
                        {$counter}
                    </td>
                    {/if}
                    {if and( eq( $counter, $days ), $span2|gt( 0 ), $span2|ne(7))}
                    {set $col_counter=1}
                    {while le( $col_counter, $span2 )}
                    <td{if $col_counter|eq( $span2 )} class="right"{/if}>&nbsp;</td>
                    {set $col_counter=inc( $col_counter )}
                    {/while}
                    {/if}
                    {if $col_end}
                </tr>
                {/if}
                {set $counter=inc( $counter )}
                {/while}
            </table>
        </div>
    </div>
</div>

{undef}

<!-- END: CAL NAV -->