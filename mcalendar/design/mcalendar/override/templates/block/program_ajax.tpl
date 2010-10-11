{run-once}

{ezcss_require(array('blockprogram.css'))}
{ezscript_require( array( concat( 'ezjsc::', 'jqueryio' ),'classes/jquery-ui-min.js','classes/block_program.js',
'init_blockprogram.js'))}
{/run-once}

{def $calendar_list=array()}
<div class="content-view-block">
    <div class="program-ajax-block" id="{$block.name}">
        <div class="program-list">
           <!-- <div class="position"></div>-->
            <div class="upper-commands commands"><div class="loading"></div><div class="upper-button arrow"></div></div>
            <div class="visible-window">
            <ul class="events">
            </ul>
            </div>
            <div class="lower-commands commands"><div class="lower-button arrow"></div></div>
        </div>


        <div id="legend-{$block.name}">
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


