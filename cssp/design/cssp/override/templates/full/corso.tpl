{* Corso - Full view *}
{mpagedata_set( 'left_menu', true() )}
{mpagedata_set( 'left_nav_menu', true() )}
{def $global_layout_class=fetch('content','list_count',hash(parent_node_id,$node.node_id,
                                    class_filter_type, "include",
                                    class_filter_array, array('infobox','global_layout')))}
{if gt($global_layout_class,0)}
    {mpagedata_set( 'extra_menu', true() )}
{else}
    {mpagedata_set( 'extra_menu', false() )}
{/if}

<div class="content-view-full">
     <div class="corso">

         <div id="corso_menu">
            {include uri='design:menu/corso_menu.tpl' param=$node}
        </div>


<div class="corso_column">


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

        {if $node.data_map.image.has_content}
                <div class="attribute-image">
                    {attribute_view_gui attribute=$node.data_map.image image_class=medium}

                    {if $node.data_map.caption.has_content}
                    <div class="caption">
                        {attribute_view_gui attribute=$node.data_map.caption}
                    </div>
                    {/if}
                </div>
            {/if}
      

       
            {if $node.data_map.intro.content.is_empty|not}
                <div class="attribute-short italic">
                    {attribute_view_gui attribute=$node.data_map.intro}
                </div>
            {/if}
  

        {if $node.data_map.body.content.is_empty|not}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.body}
            </div>
        {/if}


        <div class="partecipanti">
                <h2>Scuole partecipanti</h2>
                {attribute_view_gui  attribute=$node.data_map.partecipanti}
        </div>

      

        </div>
    </div>

</div>

{undef}