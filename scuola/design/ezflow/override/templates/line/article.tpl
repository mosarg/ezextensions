{* Article - Line view *}

<div class="content-view-line">
    <div class="class-article float-break">

    <h2 class="rounded"><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash}</a></h2>

    {section show=$node.data_map.image.has_content}
        <div class="attribute-image">
            <img alt="immarticolo" src={$node.data_map.image.content[gallerythumbnail].url|ezroot}/>
        </div>
    {/section}

    {section show=$node.data_map.intro.content.is_empty|not}
    <div class="attribute-short">
        {attribute_view_gui attribute=$node.data_map.intro}
    </div>
    {/section}

    </div>
</div>