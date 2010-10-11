{* event calendar- line view *}

<div class="content-view-line">
<div class="event-calendar-icon square-icon">
    <h2>
    <a href={$node.url_alias|ezurl}>
         {$node.data_map.title.content}
    {if is_set($node.data_map.colore)}
    <span class="event-calendar-color" style="background-color:{$node.data_map.colore|wash}"> </span>
    {/if}
      </a>
    </h2>

</div>
</div>
{undef}