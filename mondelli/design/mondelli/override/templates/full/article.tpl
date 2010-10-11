{* Article - Full view *}

{include uri='design:parts/global_variables.tpl' left_menu=true() left_nav_menu=true()}


<div class="border-box">
    <div class="content-view-full">
        <div class="class-article shadow oldborder2">
        <div class="attribute-header">
            <h1>{$node.data_map.title.content|wash()}</h1>
        </div>
        <div class="attribute-byline">
        {if $node.data_map.author.content.is_empty|not()}
        <p class="author">
             {attribute_view_gui attribute=$node.data_map.author}
        </p>
        {/if}
        <p class="date">
             {$node.object.published|l10n(shortdatetime)}
        </p>
        </div>

        {if eq( ezini( 'article', 'ImageInFullView', 'content.ini' ), 'enabled' )}
            {if $node.data_map.image.has_content}
                <div class="attribute-image">
                    
                    <div class="shadow" >{attribute_view_gui attribute=$node.data_map.image image_class=medium}</div>

                    {if $node.data_map.caption.has_content}
                    <div class="caption" style="width: {$node.data_map.image.content.medium.width}px">
                        {attribute_view_gui attribute=$node.data_map.caption}
                    </div>
                    {/if}
                </div>
            {/if}
        {/if}

        {if eq( ezini( 'article', 'SummaryInFullView', 'content.ini' ), 'enabled' )}
            {if $node.data_map.intro.content.is_empty|not}
                <div class="attribute-short">
                    {attribute_view_gui attribute=$node.data_map.intro}
                </div>
            {/if}
        {/if}

        {if $node.data_map.body.content.is_empty|not}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.body}
            </div>
        {/if}

        {if $node.data_map.gmap}
            {attribute_view_gui attribute=$node.data_map.gmap}
        {/if}

        {* include uri='design:parts/related_content.tpl' *}



        {if is_unset( $versionview_mode )}
                   {attribute_view_gui attribute=$node.data_map.comments}
       
        {/if}

        

        </div>
    </div>

</div>