{def $glon=fetch('content','list',hash(parent_node_id,$module_result.path[1].node_id, class_filter_type, "include", class_filter_array, array(32)))}
<!-- ZONE CONTENT: START -->

<div class="border-box">
<div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
<div class="border-ml"><div class="border-mr"><div class="border-mc">
<div class="border-content">
{if $glon|count|gt(0)}
{attribute_view_gui attribute=$glon[0].data_map.page}
{/if}
</div>
</div></div></div>
<div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
</div>
<!-- ZONE CONTENT: END -->