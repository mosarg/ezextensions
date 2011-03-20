{* event embed-view *}
<div class="content-view-embed">
    <div class="class-event">
    
    <div class="attribute-header">
    {if $node.data_map.title.has_content}
        <h1>{$node.data_map.title.content|wash()}</h1>
    {else}
        <h1>{$node.name|wash()}</h1>
    {/if}
    </div>
    
    <div class="attribute-byline">
    {if $node.data_map.category.has_content}
    {"Category"|i18n("design/ezwebin/full/event")}:
    {attribute_view_gui attribute=$node.object.data_map.category}
    {/if}
    
    <span class="ezagenda_date">{$node.object.data_map.from_time.content.timestamp|datetime(custom,"%j %M %H:%i")}
    {if $node.data_map.to_time.has_content}
          - {$node.data_map.to_time.content.timestamp|datetime(custom,"%j %M %H:%i")}
    {/if}
    </span>
    </div>
    {if $node.data_map.where.has_content}
    <div class="where">{attribute_view_gui attribute=$node.data_map.where}</div>
    {/if}
        
   {if $node.data_map.text.has_content}
        <div class="attribute-short">{attribute_view_gui attribute=$node.data_map.text}</div>
    {/if}
    
    


    
  </div>
</div>



