{* building room- line view *}

<div class="content-view-line">
<div class="building-room">
    <h3>
        <a href={$node.url_alias|ezurl}>{$node.name}</a>
    </h3>
    <div class="attribute-short">
        <h3>Codice identificativo stanza:</h3>
        {attribute_view_gui attribute=$node.data_map.room_code}
    </div>
    <div class="attribute-long">
        <h3>Descrizione:</h3>
        {attribute_view_gui attribute=$node.data_map.description}
    </div>
</div>
</div>
{undef}