{* contatti - Full view *}
{scuolapagedata_set( 'extra_menu', false() )}
{scuolapagedata_set( 'left_menu', false() )}


<div class="class-contatti">

    <div class="content-view-full ">
     <div class="attribute-header">
            <h1>{$node.name}</h1>
      </div>
      <table class="list" cellspacing="0">
      {if $node.data_map.contatti_esterni.has_content}
            {attribute_view_gui attribute=$node.data_map.contatti_esterni subview=table_less}
      {/if}
      {if $node.data_map.contatti_interni.has_content}
         {attribute_view_gui attribute=$node.data_map.contatti_interni subview=agenda_list}
            
      {/if}
      </table>
    </div>


{if $node.data_map.aggrega_contatti.data_int}

            {def $subcontatti=fetch( 'content','list', hash( 'parent_node_id', $node.parent_node_id,
                                                          'depth','4',
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', array('contatti')))}


   {foreach $subcontatti as $subcontatto}
        {if ne($subcontatto.node_id,$node.node_id)}
        <h2>{$subcontatto.url_alias|preg_replace('/\/.ontatti/','')}</h2>
            {node_view_gui view=full content_node=$subcontatto}
        {/if}
   {/foreach}
{/if}

</div>