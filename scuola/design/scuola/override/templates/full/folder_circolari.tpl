{* folder circolari - Full view *}
{scuolapagedata_set( 'left_menu', true() )}
{scuolapagedata_set( 'left_nav_menu', true() )}
{scuolapagedata_set( 'extra_menu', false() )}
<div class="class-folder_circolari extrainfo">
    <div class="columns-folder_circolari float-break">
        <div class="main-column-position">
            <div class="main-column float-break">
    

{if $node.object.state_id_array|contains('6')}
        <div class="wip rounded shadowmore">
            <p>{"Contenuto in preparazione non ancora visibile pubblicamente"|i18n('scuola/state')}</p>
        </div>
        {/if}
{def $page_limit = 10
     $circolari = array()
     $circolari_count = 0
     $uniq_id = 0
     $uniq_post = array()}


     {if and($view_parameters.month,$view_parameters.year)}

     {def $start_date = maketime( 0,0,0, $view_parameters.month, cond( ne( $view_parameters.day , ''), $view_parameters.day, '01' ), $view_parameters.year)
             $end_date = maketime( 23, 59, 59, $view_parameters.month, cond( ne( $view_parameters.day , ''), $view_parameters.day, makedate( $view_parameters.month, '01', $view_parameters.year)|datetime( 'custom', '%t' ) ), $view_parameters.year)}

     {set $circolari = fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                              'offset', $view_parameters.offset,
                                              'attribute_filter', array( and,
                                                                         array( 'file/publication_date', '>=', $start_date ),
                                                                         array( 'file/publication_date', '<=', $end_date ) ),
                                              'sort_by', $node.sort_array,
                                              'limit', $page_limit ) )
             $circolari_count = fetch( 'content', 'list_count', hash( 'parent_node_id', $node.node_id,
                                                                  'attribute_filter', array( and,
                                                                         array( 'file/publication_date', '>=', $start_date ),
                                                                         array( 'file/publication_date', '<=', $end_date) ) ) )}

        {foreach $circolari as $circolare}
            {node_view_gui view=line content_node=$circolare}
        {/foreach}

     {else}

        {set $circolari = fetch( 'content', 'list', hash('parent_node_id', $node.node_id,
                                              'offset', $view_parameters.offset,
                                              'sort_by', $node.sort_array,
                                              'limit', $page_limit))
          $circolari_count=fetch( 'content', 'list_count', hash( 'parent_node_id', $node.node_id))}


        {foreach $circolari as $circolare}
            {node_view_gui view=line content_node=$circolare}
        {/foreach}
    {/if}


            {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     item_count=$circolari_count
                     view_parameters=$view_parameters
                     item_limit=$page_limit}
            </div>
        </div>

        <div class="extrainfo-column-position">
           <div class="extrainfo-column">
               {include uri='design:parts/circolari/extra_info.tpl' used_node=$node}
           </div>
        </div>
    </div>
</div>