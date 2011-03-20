{* ufficio - Full view *}

{include uri='design:parts/global_variables.tpl' left_menu=true() left_nav_menu=true() extra_menu=false()}

    <div class="content-view-full ">
        <div class="class-ufficio">
        <div class="attribute-header">
            {if $node.data_map.logo.has_content}
                <div class="attribute-image">
                   {attribute_view_gui attribute=$node.data_map.logo image_css_class='shadow' link_class=ezimage_zoom href=$node.data_map.logo.content[original].url|ezroot image_class=gallerythumbnailsquare}
                </div>
            {/if}
            <h1>{$node.data_map.name.content|wash()}</h1>
        </div>
 

        <div class="title-separator"></div>
        <div class="separator"></div>
        
        {def $related_uffici=fetch( 'content', 'related_objects',
                     hash( 'object_id',$node.object.id,'all_relations',true()) )}

         

      {if $node.object.state_id_array|contains('6')}
        <div class="wip">
            <p>{"Contenuto in preparazione non ancora visibile pubblicamente"|i18n('scuola/state')}</p>
        </div>
        {/if}             
                     
          {if gt($related_uffici|count,0)}
         <div class="uffici_correlati">
             <h2>{"Uffici Periferici associati:"|i18n("design/scuola/full/ufficio")}</h2>
         {foreach $related_uffici as $uff_correlato}
            {content_view_gui content_object=$uff_correlato view='ufficio_embed'}
         {/foreach}
         </div>
         {/if}
        
        

        {if $node.object.data_map.description.has_content}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        {/if}

        
    </div>
    <div class="ufficio_extra-info">
        {if $node.object.data_map.evidenza.has_content}
                <div class="attribute-page ">
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
        
    </div>


</div>



