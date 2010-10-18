{* classe - Full view *}
{scuolapagedata_set( 'left_menu', true() )}
<script type="text/javascript" src={'javascript/pxToEm.js'|ezdesign} ></script>
<script type="text/javascript" src={'javascript/equal_height.js'|ezdesign} ></script>

{literal}
<script type="text/javascript">
$(function(){ $('.pos_colonne').equalHeights(); });
</script>
{/literal}




{scuolapagedata_set( 'extra_menu', false() )}
<div class="border-box">
    <div class="content-view-full">
        <div class="class-classe">
        {if $node.object.state_id_array|contains('6')}
        <div class="wip rounded shadowmore">
            <p>{"Contenuto in preparazione non ancora visibile pubblicamente"|i18n('scuola/state')}</p>
        </div>
        {/if}
            <div class="attribute-header">
                <h1>{"Classe:: "|i18n('scuola/classi')} {$node.data_map.name.content}</h1>
                {if $node.data_map.short_name.has_content}
                    <h3 class="subtitle">{"Detta: "|i18n('scuola/classi')}</h3>
                {/if}
            </div>

            {if eq( ezini( 'folder', 'SummaryInFullView', 'content.ini' ), 'enabled' )}
            {if $node.object.data_map.short_description.has_content}
            <div class="attribute-short">
                {attribute_view_gui attribute=$node.data_map.short_description}
            </div>
            {/if}
            {/if}

            {if $node.object.data_map.description.has_content}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
            {/if}
            <div class="content-view-full horizzontal_block">
                {if $node.data_map.info.has_content}
                {attribute_view_gui attribute=$node.data_map.info}
                {/if}
            </div>


        </div>
    </div>


</div>
