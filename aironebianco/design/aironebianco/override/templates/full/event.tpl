{* Event - Full view *}

<div class="border-box">

<div class="content-view-full">
    <div class="class-event">
    
    <div class="attribute-header">
    {if $node.data_map.title.has_content}
        <h1>{$node.data_map.title.content|wash()}</h1>
    {else}
        <h1>{$node.name|wash()}</h1>
    {/if}
    </div>
   <span class="ezagenda_date">{$node.object.data_map.from_time.content.timestamp|datetime(custom,"%j %M %H:%i")}
    {if $node.object.data_map.to_time.has_content}
          - {$node.object.data_map.to_time.content.timestamp|datetime(custom,"%j %M %H:%i")}
    {/if}
   </span>


   
    {if $node.object.data_map.text.has_content}
        <div class="attribute-long">{attribute_view_gui attribute=$node.object.data_map.text}</div>
    {/if}



  </div>
</div>

</div>