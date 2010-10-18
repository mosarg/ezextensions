{* Event Calendar - Full view *}
{set-block scope=root variable=cache_ttl}400{/set-block}
<!--load jquery-->
{ezscript('ezjsc::jqueryio')}
{* ezscript_require('ezjsc::jquery') *}
{if $node.object.state_id_array|contains('6')}
        <div class="wip rounded shadowmore">
            <p>{"Contenuto in preparazione non ancora visibile pubblicamente"|i18n('scuola/state')}</p>
        </div>
        {/if}

{include uri=concat("design:full/event_view_", $node.data_map.view.class_content.options[$node.data_map.view.value[0]].name|downcase(), ".tpl") }


<script type="text/javascript" src={'javascript/jquery-ui.js'|ezdesign} ></script>
