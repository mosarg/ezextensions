{* Presentazione - Full view *}
{mpagedata_set( 'left_menu', true() )}
{mpagedata_set( 'left_nav_menu', false() )}
{def $global_layout_class=fetch('content','list_count',hash(parent_node_id,$node.node_id,
                                    class_filter_type, "include",
                                    class_filter_array, array('infobox','global_layout')))}
{if gt($global_layout_class,0)}
    {mpagedata_set( 'extra_menu', true() )}
{else}
    {mpagedata_set( 'extra_menu', false() )}
{/if}

{def $schools_node=fetch( 'content', 'node', hash( 'node_path', 'Scuole' ) )}

{def $pole_schools=fetch('content','list',hash('parent_node_id',$schools_node.node_id,
                                                'class_filter_type','include',
                                                'class_filter_array',array('scuola'),
                                                'attribute_filter',array(
                                                                       array('scuola/polo','=',
                                                                       $node.data_map.pole_code.content[0])
                                                                    ),
                                                'depth','3'))}


<div class="border-box">
   <div class="content-view-full">
        <div class="polo-territoriale">

        <div class="attribute-header">
            <h1>{$node.name}:: {attribute_view_gui attribute=$node.data_map.pole_code}</h1>
        </div>

            <div class="attribute-image">
                {attribute_view_gui attribute=$node.data_map.image image_class='mainstory3'}
            </div>

          <div class="attribute-long italic">
                {attribute_view_gui attribute=$node.data_map.intro}
        </div>
        <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
        </div>
      

            <div class="related_schools">
                 <h2>Scuole afferenti</h2>
                {foreach $pole_schools as $pole_school}

                <a href={$pole_school.url_alias|ezurl()}>{$pole_school.name}</a>
           
                {/foreach}
            </div>


        </div>
    </div>

</div>

