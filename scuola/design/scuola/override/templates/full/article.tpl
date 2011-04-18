{* Article - Full view *}

{include uri='design:parts/global_variables.tpl' left_menu=true() left_nav_menu=true()}


    <div class="content-view-full">
        <div class="class-article">
       {if $node.object.state_id_array|contains('6')}
         <div class="wip">
                <p>{"Contenuto in preparazione non ancora visibile pubblicamente"|i18n('scuola/state')}</p>
         </div>
        {/if}

     
        <div class="attribute-header">
            {if $node.data_map.image.has_content}
                <div class="attribute-image">
                    {attribute_view_gui attribute=$node.data_map.image image_css_class='shadow' link_class=ezimage_zoom href=$node.data_map.image.content[original].url|ezroot image_class=gallerythumbnailsquare}
                 </div>
            {/if}
            <h1>{$node.data_map.title.content|wash()}</h1>
        </div>
        
        <div class="title-separator"></div>
        <div class="separator"></div>
        
        {if $node.data_map.intro.content.is_empty|not}
                <div class="attribute-short">
                    {attribute_view_gui attribute=$node.data_map.intro}
                </div>
        {/if}
       

        {if $node.data_map.body.content.is_empty|not}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.body}
            </div>
        {/if}

        

        

        </div>
           {include uri='design:parts/object_informations.tpl' style='full'}
    </div>
