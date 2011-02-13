{* Article - Line view *}

{if is_set($imagesize)|not()}
    {def $imagesize='large'}
{/if}
{if is_set($style)|not()}
    {def $style='compact'}
{/if}
<div class="content-view-line">
<div class="class-article">
    <h2 class="line-header-common"><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash}</a></h2>
    
    {include uri='design:parts/line/common_line_header.tpl'}
     
     {if $node.data_map.image.has_content}
        <div class="attribute-image">
            {attribute_view_gui image_class=$imagesize href=$node.url_alias|ezurl attribute=$node.data_map.image}
        </div>
    {/if}
       
    {if $node.data_map.intro.content.is_empty|not}
    <div class="attribute-short">
       {$node.data_map.intro.content.output.output_text|smartshort(150,'...')}
    </div>
    {/if}
    {include uri='design:parts/object_informations.tpl' style=$style}
    </div>
</div>