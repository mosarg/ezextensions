{* Course_org - line view *}
   
     <div class="content-view-line ">
        <div class="class-course_org rounded">
            <div class="attribute-header">
                 <h4>{$node.name|wash()}</h4>
                 <a href={$node.url_alias|ezurl}>
                 {if $node.data_map.icon.has_content}
                    <img alt="logo_course_org" src={$node.data_map.icon.content[blockmenu].url|ezroot} />
                {/if}
                 </a>
            </div>

        </div>
       {if $node.data_map.short_description.has_content}
            <div class="attribute-short">
                {attribute_view_gui attribute=$node.data_map.short_description}
            </div>
        {/if}
    </div>

