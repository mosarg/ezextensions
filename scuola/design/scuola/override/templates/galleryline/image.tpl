{* Image - Gallery line view *}

<a class="thumb" href={$node.data_map.image.content[galleryfull].url|ezroot}>  <img class="shadow"alt="gallery_thumb" src={$node.data_map.image.content[gallerythumbnailsquare].url|ezroot}/></a>
<div class="caption">
    <h3>{$node.name}</h3>
    {$node.data_map.caption.data_text}
    <a href={$node.data_map.image.content[original].url|ezroot}>Scarica originale</a>|
    <a class="image_comment" href={$node.url|ezurl()}>Dettagli</a>
 </div>
  