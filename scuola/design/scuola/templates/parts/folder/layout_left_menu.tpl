 <div class="content-view-full">     
<div class="class-folder">
        {* contenuto in preparazione *}
        {if $node.object.state_id_array|contains('6')}
        <div class="wip rounded shadowmore">
            <p>{"Contenuto in preparazione non ancora visibile pubblicamente"|i18n('scuola/state')}</p>
        </div>
        {/if}
        
        <div class="attribute-header">
            {if $node.data_map.icon.has_content}
                <div class="attribute-image">
                 
                    {attribute_view_gui attribute=$node.data_map.icon image_css_class='shadow' zoom=false() link_class=ezimage_zoom href=$node.data_map.icon.content[original].url|ezroot image_class=gallerythumbnailsquare}
                 
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


    {if $node.data_map.show_children.data_int}

       {if gt($semantic_count,0)}

            <div class="content-view-children">
                {foreach $semantic_elements as $semantic_element }
                  {node_view_gui view=line content_node=$semantic_element imagesize='articlethumbnail'}
                {/foreach}
            </div>
           {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     item_count=$semantic_count
                     view_parameters=$view_parameters
                     item_limit=$page_limit}
       {/if}
          
       {if gt($static_count,0)}
       <div class="static-elements-box">
           <div class="content-view-children">
                <h4>{"Contenuti scaricabili"|i18n('scuola/folder/line')}</h4>
                 <div class="sortbuttons" >
                    <h4>Ordine:</h4>
                    <a id="sortbuttonup"  class="rounded">Alfabetico ascendente</a>
                    <a id="sortbuttondown"  class="rounded">Alfabetico discendente</a>
                    <a id="timesortup" class="rounded">Temporale crescente</a>
                    <a id="timesortdown" class="rounded">Temporale decrescente</a>
                 </div>
                {foreach $static_elements as $static_element }
                  {node_view_gui view=line content_node=$static_element}
                {/foreach}
            </div>
       </div> 
       {/if}
    {/if}
    </div>

 </div>

{include uri='design:parts/object_informations.tpl' style='full'}
<script type="text/javascript" src={'javascript/tinysort.js'|ezdesign} ></script>
<script type="text/javascript" src={'javascript/listsort.js'|ezdesign} ></script>