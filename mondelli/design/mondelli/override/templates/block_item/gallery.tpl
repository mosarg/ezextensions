{* Gallery - Block view *}
<div class="class-gallery block-type-gallery">

{* def $children=fetch_alias( children, hash( parent_node_id, $node.node_id, limit, 1 ) )  *}

{def $children=fetch('content','related_objects',hash(
                                        'object_id',$node.contentobject_id,
                                        'limit',1,
                                        'all_relations',array('attribute'),
                                        'load_data_map',false()
                                         ))}


{attribute_view_gui attribute=$children[0].data_map.image image_css_class=shadow image_class=blockthumbnailbig href=$node.url_alias|ezurl()}


<h2><a href={$node.url_alias|ezurl}>{$node.name|wash}</a></h2>


</div>


