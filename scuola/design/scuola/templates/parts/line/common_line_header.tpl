<div class="attribute-byline">
        {if $node.data_map.author.content.is_empty|not()}
        <p class="author">
        Di {attribute_view_gui attribute=$node.data_map.author}
        </p>
        {/if}
        <p class="date">
             {'Ultimo aggiornamento: '|i18n('scuola/dates')}{$node.object.current_version}
        </p>
</div>