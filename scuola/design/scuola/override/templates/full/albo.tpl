{* path /albo - Full view *}

{run-once}
 {ezscript_require( array('classes/contentfilter.js','init_filter.js','classes/navigator.js'))}
{/run-once}


{def     $structure_classes = array('dmsfolder')
         $structure_elements = array()
         $structure_count = ''
         $json_structure_elements=array()}
    
         
{set $structure_elements=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $structure_classes) )
     $structure_count=$structure_elements|count()}
   





{include uri='design:parts/global_variables.tpl' left_menu=false() left_nav_menu=false() extra_menu=false()}
<div class="content-view-full">
<div class="class-albo">
     <div class="attribute-header">
            {if $node.data_map.icon.has_content}
                <div class="attribute-image">
                 
                    {attribute_view_gui attribute=$node.data_map.icon image_css_class='shadow' link_class=ezimage_zoom href=$node.data_map.icon.content[original].url|ezroot image_class=gallerythumbnailsquare}
                 
                </div>
            {/if}
            <h1>{$node.data_map.name.content|wash()}</h1>
        </div>
        <div class="title-separator"></div>
        <div class="separator"></div>
   {if $node.data_map.short_description.has_content}
                <div class="attribute-short">
                    {attribute_view_gui attribute=$node.data_map.short_description}
                </div>
        {/if}
        
        {if $node.data_map.description.has_content}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        {/if}
        
        
        
        <div id="filter">
            <div id="interface"><ul class="filter-tabs"></ul></div>
            <div id="data"></div>
        </div>

</div>
</div>



{foreach $structure_elements as $structure_element}
    {set $json_structure_elements=$json_structure_elements|append(hash(node_id,$structure_element.node_id,url_alias,$structure_element.url_alias|ezurl(no),title,$structure_element.name))}
{/foreach}
</div>

<div id="filter_elements" style="display:none">
             <p title="keys">{$json_structure_elements|json_encode()}</p>
             <p title="navigator">div.pagenavigator</p>
</div>

{undef}