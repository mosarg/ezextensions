{* Libro - Line view *}
<div class="content-view-line">
    <div class="class-libro-compact">
        <a href={$node.url_alias|ezurl} class="libro-link">{$node.name|wash()}
            <span>{attribute_view_gui attribute=$node.data_map.copertina image_class='colorblock'}</span>
        </a>
        <span>{attribute_view_gui attribute=$node.data_map.isbn}</span>
    </div>
</div>
