{* event calendar- line view *}

{if is_set($style)|not()}
    {def $style='compact'}
{/if}
<div class="content-view-line">
<div class="event-calendar">
    <h2>
    <a href={$node.url_alias|ezurl}>
         {$node.data_map.title.content}
    {if is_set($node.data_map.colore)}
    <span class="event-calendar-color" style="background-color:{$node.data_map.colore|wash}"> </span>
    {/if}
      </a>
    </h2>

</div>
    {include uri='design:parts/object_informations.tpl' style=$style}
</div>
{undef}