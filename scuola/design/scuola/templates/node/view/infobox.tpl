<div class="border-box infobox-header">


    <h2>{attribute_view_gui attribute=$node.object.data_map.header}</h2>


</div>
<div class="border-box infobox">

{if $node.object.data_map.image.has_content}
    <div class="attribute-image"> 
        {attribute_view_gui attribute=$node.object.data_map.image href=$node.object.data_map.image_url.data_text image_class='infoboximage'} 
    </div>
{/if}

    <div class="attribute-long">
        {attribute_view_gui attribute=$node.object.data_map.content}
    </div>

    <div class="attribute-link">
        <p>{attribute_view_gui attribute=$node.object.data_map.url}</p>
    </div>


</div>