{* Folder - Line view *}
{if is_set($imagesize)|not()}
    {def $imagesize='colorblock'}
{/if}
{if is_set($style)|not()}
    {def $style='compact'}
{/if}
<div class="content-view-line">
    <div class="class-folder">

        <h2><a href={$node.url_alias|ezurl}>{$node.name|wash()}</a></h2>

       {if $node.data_map.short_description.has_content}
        <div class="attribute-short">
        {attribute_view_gui attribute=$node.data_map.short_description}
        </div>
       {/if}
        {if $node.data_map.icon.has_content}
        <img alt="folder" src={$node.data_map.icon.content[$imagesize].url|ezroot} />
         {/if}
    </div>
    {include uri='design:parts/object_informations.tpl' style=$style}
</div>
