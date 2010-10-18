{* Scuola - Full view *}
{mpagedata_set( 'left_menu', true() )}
{mpagedata_set( 'left_nav_menu', false() )}
{mpagedata_set( 'extra_menu', false() )}
    <div class="content-view-full">

        <div class="class-scuola">

     <div class="upper_block">
        <div class="attribute-header">
            <h1>{$node.data_map.denom_istituzione.content|wash()}</h1>
        </div>

        {if $node.data_map.image.has_content}
                <div class="immagine_scuola">
                    {attribute_view_gui attribute=$node.data_map.image image_class=medium}
                </div>
        {/if}

        <div class="meccanografico">
                <h2> Codice meccanografico: {$node.data_map.meccanografico_scuola.content}</h2>
        </div>
            
        <div class="tipologia">
                <h2>Tipologia: {attribute_view_gui attribute=$node.data_map.tipo}</h2>
        </div>

         
            </div>
            {if $node.data_map.referenti.has_content}
        <div class="referenti">
                <p class="referenti"> Referenti della scuola circa l'informatica: {$node.data_map.referenti.content}</p>
         </div>
{/if}


    {def $reverse_nets=fetch( 'content', 'reverse_related_objects',
                     hash( 'object_id', $node.object.id,
                    'all_relations', true(),
                    'sort_by', array( array( 'class_name', true() ),
                        array( 'name', true() ) )))}

    {if $reverse_nets}
    <div class="attribute-long">
    <h2>Questa scuola partecipa alle seguenti reti:</h2>
     {foreach $reverse_nets as $reverse_net}
        {if $reverse_net.class_identifier|eq('net')}
            <a href={$reverse_net.main_node.url_alias|ezurl}>{$reverse_net.name}</a>
        {/if}

        {/foreach}
    </div>
     {/if}




    {def $page_limit = 10
                     $classes = array( 'scuola' )
                     $children = array()
                     $children_count = ''}

     {set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $classes,
                                                          'limit', $page_limit ) )
                }

            {if $children|count()|gt(0)}

            <div class="scelta_scuole">
                <h2>Istituti afferenti</h2>


            <div class="istituti">

                {foreach $children as $child }
                        <div class="sch_block">
                            <a href={$child.url_alias|ezurl}>
                            {if $child.data_map.image.has_content}
                               <img src= {$child.data_map.image.content[small].url|ezroot}   alt="logo"/></a>
                            {/if}
                            <a class="textlink" href={$child.url_alias|ezurl}>{$child.name}</a>
                        </div>
                {/foreach}
            </div>
       </div>
            {/if}



       {if $node.data_map.body.content.is_empty|not}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.body}
            </div>
       {/if}

       {if $node.data_map.location}
            {attribute_view_gui attribute=$node.data_map.location}
        {/if}


        
        </div>
    </div>


