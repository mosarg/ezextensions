{* Spazio personale prof - full view*}

{include uri='design:parts/global_variables.tpl' left_menu=true() left_nav_menu=true()}
<div class="content-view-full">
    <div class="class-folder_professore">
      
        <div class="attribute-header">
            <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>
        </div>
        <div class="title-separator"></div>
        <div class="separator"></div>
        
      {*Show prof personal information on prof folder page*}
        
       {def $prof_object=fetch( 'content', 'reverse_related_objects',
                     hash( 'object_id',$node.contentobject_id) )}
    
       <div class="prof-personal_info">
            
           <div class="left-column">
            <div class="attribute-image">
                {if $prof_object[0].data_map.image.has_content}
                    {attribute_view_gui attribute=$prof_object[0].data_map.image image_css_class='shadow' link_class=ezimage_zoom href=$prof_object[0].data_map.image.content[original].url|ezroot image_class=mainstory3}
                {else}
                <div class="image-wrapper">
                    <a class="ezimage_zoom"><img style="" title="Teacher" class="shadow"  alt="generic_teacher" src={'props/teacher_big.jpg'|ezimage} /></a>
                </div>
                {/if}
            </div>
           
           </div>
           <div class="right-column">
                <div class="attribute-short">
                    {attribute_view_gui attribute=$prof_object[0].data_map.signature}
                </div>
                {if $node.object.data_map.description.has_content}
                    <div class="attribute-long">
                        {attribute_view_gui attribute=$node.data_map.description}
                    </div>
                {/if}
               {if $node.data_map.materie.has_content}
               <div class="highlight1">
                    <h1>{"Discipline"|i18n("design/m2000/full/helper_prof")}</h1>
                    {attribute_view_gui attribute=$node.object.data_map.materie}
               </div>
               {/if} 
               {if $node.data_map.email.has_content}
                    <div class="email">
                        <h2>{"Email"|i18n("design/m2000/full/proffolder")}</h2>
                        {attribute_view_gui attribute=$node.data_map.email}
                    </div>
               {/if}
               {if $node.data_map.telefono.has_content}
                    <div class="telefono">
                        <h2>{"Telefono"|i18n("design/m2000/full/proffolder")}</h2>
                        {attribute_view_gui attribute=$node.data_map.telefono}
                    </div>
               {/if}
                {if $node.data_map.ruolo.has_content}
                    <div id="ruolo">
                        <h2>{"Ruolo"|i18n("design/scuola/full/proffolder")}</h2>
                        {attribute_view_gui attribute=$node.data_map.ruolo}
                    </div>
                {/if}
           </div>
       </div>
   
        
        {*classi insegnamento*}

        
       {if $prof_object[0].data_map.teachwhere.has_content}
        <div class="attribute-teachwhere">
            <h2>{"Insegno in"|i18n("design/m2000/full/proffolder")}</h2>
        {attribute_view_gui attribute=$prof_object[0].data_map.teachwhere}
        </div>
       
        {/if}
        {def  $infoprof=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', array('infoprof')
                                                          ) )}

         {foreach $infoprof as $occupation }
              {node_view_gui view='embed' content_node=$occupation}
         {/foreach}
      
            

               </div>

</div>


{undef}