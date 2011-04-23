{* Image - Gallery line view *}

<a class="thumb" href={$node.data_map.image.content[galleryfull].url|ezroot}>  <img class="shadowmore"alt="gallery_thumb" src={$node.data_map.image.content[gallerythumbnailsquare].url|ezroot}/></a>
<div class="caption">
    <a href={$node.data_map.image.content[original].url|ezroot}>Scarica originale</a>|
    <a class="image_comment" href={$node.url|ezurl()}>Dettagli e commento </a>
    {$node.data_map.caption.data_text|strip_tags()|shorten(240)}
 </div>
  