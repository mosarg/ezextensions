{* ufficio - Full view *}
{scuolapagedata_set( 'extra_menu', false() )}
{scuolapagedata_set( 'left_menu', true() )}
{scuolapagedata_set( 'left_nav_menu', true() )}

<div class="class-ufficio">

    <div class="content-view-full ">
       <div class="attribute-header">
            <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>
            {if $node.object.data_map.logo.has_content}
                 {attribute_view_gui attribute=$node.data_map.logo}
             {/if}
       </div>


        {if $node.object.data_map.description.has_content}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        {/if}

        
    </div>
    <div class="ufficio_extra-info">
        {if $node.object.data_map.evidenza.has_content}
                <div class="attribute-page rounded">
                    <h1>{"In evidenza:"|i18n("design/scuola/full/ufficio")}</h1>
                    {attribute_view_gui attribute=$node.object.data_map.evidenza}
                </div>
	{/if}

        <div class="resp_ufficio rounded">
             <h2>{"Responsabile ufficio:"|i18n("design/scuola/full/ufficio")}</h2>
             <span>{attribute_view_gui attribute=$node.data_map.resp_uff}</span>
        </div>
         <div class="contatti rounded">
                <h2>{"Contatti:"|i18n("design/scuola/full/ufficio")}</h2>
                {attribute_view_gui attribute=$node.data_map.contatti}
        </div>
        {def $related_uffici=fetch( 'content', 'related_objects',
                     hash( 'object_id',$node.object.id,'all_relations',true()) )}

         

          {if gt($related_uffici|count,0)}
         <div class="uffici_correlati">
             <h2>{"Uffici Periferici associati:"|i18n("design/scuola/full/ufficio")}</h2>
         {foreach $related_uffici as $uff_correlato}
            {content_view_gui content_object=$uff_correlato view='ufficio_embed'}
         {/foreach}
         </div>
         {/if}
    </div>


</div>



