{* Spazio personale prof - full view*}

{include uri='design:parts/global_variables.tpl' left_menu=true() left_nav_menu=true() extra_menu=false()}



<div class="border-box" >
    <div class="class-folder_professore">
       <div class="attribute-header">
            <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>
        </div>

        {*Show prof personal information on prof folder page*}
        
        {def $prof_object=fetch( 'content', 'reverse_related_objects',
                     hash( 'object_id',$node.contentobject_id) )}
    
      <div class="prof_personal_info">
            <div class="prof_picture">
        {attribute_view_gui attribute=$prof_object[0].data_map.image}   
            </div>
            <div class="prof_description">
        {attribute_view_gui attribute=$prof_object[0].data_map.signature}
            </div>

      </div>

        
                        

        {if $node.object.data_map.description.has_content}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        {/if}


    
        <div id="contatti">        
        {if $node.object.data_map.email.has_content}
            <div id="email">
                <h2>{"Email"|i18n("design/m2000/full/proffolder")}</h2>
                {attribute_view_gui attribute=$node.data_map.email}
            </div>
        {/if}
        {if $node.data_map.telefono.has_content}
            <div id="telefono">
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
        {*classi insegnamento*}



        {if $prof_object[0].data_map.teachwhere.has_content}

        <div class="teach_class">
            <h2>{"Insegno in"|i18n("design/m2000/full/proffolder")}</h2>
        {attribute_view_gui attribute=$prof_object[0].data_map.teachwhere context='embed' sort='school'}

        </div>

        
        {/if}

        {def  $infoprof=array()}

        {set  $infoprof=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', array('infoprof')
                                                          ) )}

         {foreach $infoprof as $occupation }
              {node_view_gui view='full' content_node=$occupation}
         {/foreach}


         {if $node.object.data_map.show_children.data_int}
            {def $page_limit = 10
                 $classes = array( 'infobox','infoprof' )
                 $children = array()
                 $children_count = ''}
                 
            {if le( $node.depth, '3')}
                {set $classes=array( 'infobox', 'folder')}
            {/if}

          {set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'exclude',
                                                          'class_filter_array', $classes,
                                                          'limit', $page_limit ) )
          $children_count=$children|count()}

           {if gt($children_count,0)}
                      
            <div class="content-view-children">
                  <h4>{"Elementi correlati"|i18n('scuola/folder/line')}</h4>
                {foreach $children as $child }
                      {node_view_gui view='line' content_node=$child}
                 {/foreach}
            </div>

           {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     item_count=$children_count
                     view_parameters=$view_parameters
                     item_limit=$page_limit}
            {/if}

               </div>
        </div>



{undef}