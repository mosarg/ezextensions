{* Image - Block item view *}
<div class="content-view-listitem">
    <div class="class-image">
    <div class="attribute-image">
        <p>
            {attribute_view_gui attribute=$node.data_map.image image_class=$image_class href=$node.url_alias|ezurl()}
            <span>{$node.name|extract_left(20)|wash}</span>
        </p>
    </div>
    

    </div>
</div>
