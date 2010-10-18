{* filter_scuole - Full view *}



{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}


{run-once}
{ezcss_require('filter_scuole.css')}
{ezscript_require( array( concat( 'ezjsc::', 'jqueryio' ),'classes/jquery-ui-min.js','classes/schools_filter.js',
            'init_schoolfilter.js'))}
{/run-once}

<div class="content-view-full">
    <div class="attribute-short">
        <h1>{$node.name}</h1>
    </div>
    <div class="attribute-long">
        {attribute_view_gui attribute=$node.data_map.descrizione}
    </div>

    <div id="facetes">
        <div id="inputs"></div>
        <div id="filter_results"></div>
    </div>
    
    <div id="config-filter-scuole" style="visibility:hidden">
            <p title="facetes">denom_istituzione,titolo_plesso,meccanografico_scuola,tipo,titolo_studio,comune,cap,polo</p>
            <p title="facetes_hash">{hash('denom_istituzione','Denominazione','titolo_plesso','Nome scuola',
                                          'meccanografico_scuola','Codice Meccanografico',
                                          'tipo','Tipologia','comune','Comune','cap','Cap',
                                          'titolo_studio','Titolo rilasciato','polo','Polo' )|json_encode()}</p>
            <p title="node_id">{$node.node_id}</p>
            <p title="can_edit">{fetch( 'content', 'can_instantiate_classes',hash('parent_node',$node))}</p>
    </div>

</div>