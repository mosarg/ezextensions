{* contatti - Full view *}

{if is_set($style)|not()}
    {def $style='full'}
{/if}
    

{include uri='design:parts/global_variables.tpl' left_menu=false() left_nav_menu=false() extra_menu=false()}

<div class="content-view-full ">
    <div class="class-contatti">


        <div class="attribute-header">
            <h2>{$node.name}</h2>
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

    {def $subcontatti=$node.object.reverse_related_contentobject_array}

    {foreach $subcontatti as $subcontatto}
    
    <h2 class="second-level">{$subcontatto.main_node.url_alias|preg_replace('/\/.ontatti|-/',' ')}</h2>
    {node_view_gui view=embed content_node=$subcontatto.main_node style='empty'}
  
    {/foreach}
    {/if}
{include uri='design:parts/object_informations.tpl' style=$style}
</div>