{* Image - Full view *}

{include uri='design:parts/global_variables.tpl' left_menu=true() left_nav_menu=true() extra_menu=false()}




<div class="content-view-full">
    <div class="class-image">
        <div class="attribute-header">
            <h1>{$node.name|wash()}</h1>
            <a href={$node.data_map.image.content[original].url|ezroot}>Scarica originale</a>
        </div>
        <div class="attribute-image">
            <p>{attribute_view_gui attribute=$node.data_map.image image_css_class=shadow image_class=imagelarge}</p>
        </div>
        <div class="attribute-caption">
            {attribute_view_gui attribute=$node.data_map.caption}   
        </div>
        <div class="comments">
            {attribute_view_gui attribute=$node.data_map.comments}
        </div>
    </div>
    
</div>


