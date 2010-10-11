<div class="class-article float-break">

        <div class="attribute-header">
            <h2 class="rounded"><a href={$node.url_alias|ezurl()}>{$node.name|wash()}</a></h2>
        </div>
       
        <div class="attribute-short">
             <div class="attribute-image">{attribute_view_gui attribute=$node.data_map.image image_class=$image_class}</div>
            {attribute_view_gui attribute=$node.data_map.intro}
        </div>
    <div class="read-on">
        <a href={$node.url_alias|ezurl()}>{'Continua >>'|i18n('scuola/block/mainstory')}</a>
    </div>
           {include uri='design:parts/article/article_index_frontpage.tpl' used_node=$node}


</div>