{* Article - Line view *}
<div class="content-view-line">
<div class="class-article">
    <h2 class="rounded attribute-header"><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash}</a></h2>
    
    {include uri='design:parts/line/common_line_header.tpl'}

    {if $node.data_map.image.has_content}
        <div class="attribute-image">
            <img class="shadow" alt="immarticolo" src={$node.data_map.image.content[large].url|ezroot}/>
        </div>
    {/if}

    {if $node.data_map.intro.content.is_empty|not}
    <div class="attribute-short">
        {attribute_view_gui attribute=$node.data_map.intro}
    </div>
    {/if}
    <a class="go_on" href={$node.url_alias|ezurl}>Continua...</a>
    </div>
</div>