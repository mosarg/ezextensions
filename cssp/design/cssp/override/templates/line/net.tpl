{*net - line view *}
<div class="content-view-line">
   
    <div class="class-net">
       
        <div class="attribute-header">
            <h1><a href={$node.url_alias|ezurl}>{$node.name|wash}</a></h1>
        </div>
            
        {if $node.data_map.description.has_content}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        {/if}
    </div>
</div>

  
