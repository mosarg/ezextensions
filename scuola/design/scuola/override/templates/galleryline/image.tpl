{* Image - Gallery line view *}
<div class="content-view-galleryline">
    <div class="class-image">
    <div class="attribute-image ">
        <a href={$node.url_alias|ezurl}>  <img class="shadowmore"alt="gallery_thumb" src={$node.data_map.image.content[gallerythumbnail].url|ezroot}/></a>
    </div>
    <div class="attribute-name">
        <p>{$node.name|shorten(20)|wash}</p>
    </div>
    </div>
</div>