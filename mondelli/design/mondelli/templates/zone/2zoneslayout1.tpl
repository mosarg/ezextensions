<div class="zone-layout-{$zone_layout|downcase()} norightcol">

<div class="content-columns float-break">
<div class="leftcol-position">
<div class="leftcol">

<!-- ZONE CONTENT: START -->

<div class="border-box">


<div class="border-content">

{if and( is_set( $zones[0].blocks ), $zones[0].blocks|count() )}
{foreach $zones[0].blocks as $block}
{if or( $block.valid_nodes|count(), 
    and( is_set( $block.custom_attributes), $block.custom_attributes|count() ), 
    and( eq( ezini( $block.type, 'ManualAddingOfItems', 'block.ini' ), 'disabled' ), ezini_hasvariable( $block.type, 'FetchClass', 'block.ini' )|not ) )}
    <div id="address-{$block.zone_id}-{$block.id}">
    {block_view_gui block=$block}
    </div>
{else}
    {skip}
{/if}
    {delimiter}
        <div class="block-separator"></div>
    {/delimiter}
{/foreach}
{/if}

</div>


</div>

<!-- ZONE CONTENT: END -->

</div>
</div>

<div class="maincol-position">
<div class="maincol">

<!-- ZONE CONTENT: START -->

<div class="border-box">


<div class="border-content">
    <div class="newsletter">
        <a href={'/newsletter/subscribe'|ezurl()} ><img alt="old stamp" src={'props/stamp_small.png'|ezimage()}/>
        </a>
        <h2><a href={'/newsletter/subscribe'|ezurl()}>Iscriviti alla nostra newsletter</a></h2>
        
    </div>

{if and( is_set( $zones[1].blocks ), $zones[1].blocks|count() )}
{foreach $zones[1].blocks as $block}
{if or( $block.valid_nodes|count(), 
    and( is_set( $block.custom_attributes), $block.custom_attributes|count() ), 
    and( eq( ezini( $block.type, 'ManualAddingOfItems', 'block.ini' ), 'disabled' ), ezini_hasvariable( $block.type, 'FetchClass', 'block.ini' )|not ) )}
    <div id="address-{$block.zone_id}-{$block.id}">
    {block_view_gui block=$block}
    </div>
{else}
    {skip}
{/if}
    {delimiter}
        <div class="block-separator"></div>
    {/delimiter}
{/foreach}
{/if}

</div>


</div>

<!-- ZONE CONTENT: END -->

</div>
</div>

<div class="rightcol-position">
<div class="rightcol">

</div>
</div>
</div>

</div>