<div class="attribute-byline">
        {if $node.data_map.author.content.is_empty|not()}
        Di
        <p class="author">
         {attribute_view_gui attribute=$node.data_map.author}
        </p>
        {/if}
        <p class="date">
            Ultima modifica: {$node.object.modified|l10n(shortdatetime)}
             
        </p>
</div>