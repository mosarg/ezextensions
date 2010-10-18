{* Corso block view *}

<div class="corso-block  float-break">
     <div class="attribute-header">
        <h2><a href={$node.url_alias|ezurl()}>{$node.name||shorten(30)}</a></h2>
    </div>

    <div class="attribute-image">{attribute_view_gui attribute=$node.data_map.image image_class='small_square'}</div>

    <div class="attribute-short">
        {$node.data_map.intro.data_text|strip_tags()|shorten(140)}
    </div>

    <a href={$node.url_alias|ezurl()} class="goon">Continua...</a>
</div>