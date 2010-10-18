{* Folder - Full view *}


{mpagedata_set( 'left_menu', true() )}
{mpagedata_set( 'left_nav_menu', true() )}
{def $global_layout_class=fetch('content','list_count',hash(parent_node_id,$node.node_id,
                                    class_filter_type, "include",
                                    class_filter_array, array('infobox','global_layout')))}
{if gt($global_layout_class,0)}
    {mpagedata_set( 'extra_menu', true() )}
{else}
    {mpagedata_set( 'extra_menu', false() )}
{/if}

{run-once}
 {ezscript_require( array('classes/fluxes.js','init_flux.js'))}
{/run-once}

<div class="border-box">
  {def $style='content-view-full'}
   <div class="{$style}">
    <div class="class-flussi">
        {* contenuto in preparazione *}
        {if $node.object.state_id_array|contains('6')}
        <div class="wip rounded shadowmore">
            <p>{"Contenuto in preparazione non ancora visibile pubblicamente"|i18n('scuola/state')}</p>
        </div>
        {/if}
        <div class="attribute-header">
            <h1>{$node.name|wash}</h1>
        </div>
        {if $node.data_map.short_description.has_content}
                <div class="attribute-short">
                    {attribute_view_gui attribute=$node.data_map.short_description}
                </div>
        {/if}
        
       

<div id="mapid" style="width: 800px; height: 600px"></div>
          
    </div>
</div>

    {if $node.data_map.description.has_content}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        {/if}


</div>
<div id="config_flussi" style="visibility:hidden">
            <p title="mapid">mapid</p>
            <p title="medie_icon">{concat('http://',ezsys('hostname'),'icons/medie.png'|ezimage(no))}</p>
            <p title="superiori_icon">{concat('http://',ezsys('hostname'),'icons/superiori.png'|ezimage(no))}</p>
</div>
