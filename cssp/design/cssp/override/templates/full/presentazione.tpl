{* Presentazione - Full view *}
{mpagedata_set( 'left_menu', false() )}
{mpagedata_set( 'left_nav_menu', false() )}
{mpagedata_set( 'extra_menu', false() )}
<div class="border-box">


    <div class="content-view-full">
        <div class="presentazione">

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
     
       
            {if $node.data_map.intro.content.is_empty|not}
                <div class="attribute-short">
                    {attribute_view_gui attribute=$node.data_map.intro}
                </div>
            {/if}
   

        {if $node.data_map.corpo.content.is_empty|not}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.corpo}
            </div>
        {/if}

             



        </div>
    </div>

</div>

