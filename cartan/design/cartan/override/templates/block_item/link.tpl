{* Link - block view *}
    <div class="class-link block-element">

    <div class="attribute-header">
        <h1><a href="{$node.data_map.location.content}" >{attribute_view_gui attribute=$node.data_map.name}</a></h1>
    </div>
    {if $node.data_map.description.content.is_empty|not}
        <div class="attribute-long">
            {attribute_view_gui attribute=$node.data_map.description}
        </div>
    {/if}

    {if ne( $node.data_map.location.content, '' )}
        <div class="attribute-link">
            <p><a href="{$node.data_map.location.content}" target="_blank">{$node.data_map.location.data_text}</a></p>
        </div>
    {/if}

    </div>



