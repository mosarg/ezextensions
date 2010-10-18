{run-once}

{ezcss_require(array('blockcalendar.css'))}
{ezscript_require( array( concat( 'ezjsc::', 'jqueryio' ),'classes/jquery-ui-min.js','classes/block_calendar.js',
'init_blockcalendar.js'))}
{/run-once}

{def $calendar_list=array()}
<div class="content-view-block" >
    <div class="calendar-ajax-block" id="{$block.name}">

        <div class="calendar-container">

        </div>

        <div id="legend-{$block.name}" class="legend">
            {foreach $block.valid_nodes as $calendar}
            <div class="calendar_entry">
                <div class="small_square" style="background:{$calendar.data_map.color.content}"></div>
                <span><a href={$calendar.url_alias|ezurl()}>{$calendar.name}</a></span>
            </div>
            {set $calendar_list=$calendar_list|append(hash('node_id',$calendar.node_id,'color',$calendar.data_map.color.content))}
            {/foreach}
        </div>

        <div id="config-{$block.name}" style="visibility:hidden">
            <p title="calendars_list">{$calendar_list|json_encode}</p>
        </div>

    </div>
</div>