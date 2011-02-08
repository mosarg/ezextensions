{* classe - Full view *}

{include uri='design:parts/global_variables.tpl' left_menu=true() left_nav_menu=true()}

{set-block scope=root variable=cache_ttl}0{/set-block}


{cache-block keys=$node.url}
<div id="prof_menu">
 {* include uri='design:menu/prof_menu.tpl' param=$node *}
 {if $node.data_map.info.has_content}
    {attribute_view_gui attribute=$node.data_map.info}
 {/if}
</div>

<div class="border-box classe_center">
<div class="content-view-full">

    <div class="class-folder">

        <div class="attribute-header">
            <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>
        </div>

        {if eq( ezini( 'folder', 'SummaryInFullView', 'content.ini' ), 'enabled' )}
            {if $node.object.data_map.short_description.has_content}
                <div class="attribute-short">
                    {attribute_view_gui attribute=$node.data_map.short_description}
                </div>
            {/if}
        {/if}

        {if $node.object.data_map.description.has_content}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        {/if}
         
    </div>
{include uri='design:parts/object_informations.tpl' style='full'}
</div>


</div>
{/cache-block}