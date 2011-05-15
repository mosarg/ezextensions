{* dir circolari - Full view *}
{run-once}
 {ezscript_require( array('classes/contentfilter.js','init_filter.js','classes/navigator.js'))}
{/run-once}

{include uri='design:parts/global_variables.tpl' left_menu=false() left_nav_menu=false()}


{def $classes =array('folder_circolari')
               $structure_elements = array()
                 $json_structure_elements=array()}
                
{set $structure_elements=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $classes ) )}


<div class="content-view-full">
    <div class="class-dir_circolari">

        <div class="attribute-header">
            <h1>{$node.name|wash}</h1>
        </div>
        
          <div class="title-separator"></div>
        <div class="separator"></div>
        
        {if $node.can_edit}
               
        <div class="manual-edit">
            <h3>Link diretti alle sottocartelle per l'inserimento manuale
                <img src={"icons/pencil.png"|ezimage}>
            </h3>
                {foreach $structure_elements as $structure_element}
                <a href={$structure_element.url_alias|ezurl()}>{$structure_element.name}</a>
                  
                {/foreach}
        </div>
        
        
        {/if}
        
            {if $node.object.data_map.short_description.has_content}
                <div class="attribute-short">
                    {attribute_view_gui attribute=$node.data_map.short_description}
                </div>
            {/if}
        

        {if $node.object.data_map.description.has_content}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        {/if}

    




<div id="filter">
            <div id="interface"><ul class="filter-tabs"></ul></div>
            <div id="data"></div>
</div>    
    
    
</div>

    
 {foreach $structure_elements as $structure_element}
    {set $json_structure_elements=$json_structure_elements|append(hash(node_id,$structure_element.node_id,url_alias,$structure_element.url_alias|ezurl(no),title,$structure_element.name))}
{/foreach}    

<div id="filter_elements" style="display:none">
             <p title="show_all">{hash('node_id',$node.node_id,'url_alias',$node.url_alias|ezurl(no),'depth',2,'title','Mostra Tutto'|i18n( "design/scuola/filter" ))|json_encode()}</p>
             <p title="keys">{$json_structure_elements|json_encode()}</p>
             <p title="navigator">div.pagenavigator</p>
             <p title="initial_view">show_all</p>    
</div>                                                         
                                                      

</div>

