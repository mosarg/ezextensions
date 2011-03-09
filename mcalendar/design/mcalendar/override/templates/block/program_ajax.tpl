{run-once}

{ezcss_require(array('blockprogram.css'))}
{ezscript_require( array( concat( 'ezjsc::', 'jqueryio' ),'classes/jquery-ui-min.js','classes/block_program.js',
'init_blockprogram.js'))}
{/run-once}

{def $calendar_list=array()}
<div class="content-view-block">
    <div class="program-ajax-block" id="{$block.name}">
        {if $block.name|count_chars()|gt(0)}
        <div class="attribute-header-block">
            <h2>{$block.name}</h2>
        </div>
        {/if}
        <div class="program-list">
           <!-- <div class="position"></div>-->
            <div class="commands"><div class="loading"></div>
                <div class="previous-button arrow rounded"><</div><div class="next-button arrow rounded">></div>
                <div class="month-name"></div>
            </div>
            <div class="visible-window">
            <ul class="events">
            </ul>
            </div>
           </div>
   
            {foreach $block.valid_nodes as $calendar}
                     {set $calendar_list=$calendar_list|append(hash('node_id',$calendar.node_id,'color',$calendar.data_map.color.content,'url_alias',$calendar.url_alias|ezurl(no)))}
            {/foreach}
   
        <div id="config-{$block.name}" style="visibility:hidden">
            <p title="calendars_list">{$calendar_list|json_encode}</p>
        </div>
    </div>
</div>


