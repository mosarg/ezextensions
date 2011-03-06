{def $icon_m2000_size_m2000='small'
     $icon_m2000_title_m2000=$attribute.content.mime_type
     $icon_m2000='no'}
{if $attribute.has_content}
{if $attribute.content}
{switch match=$icon_m2000}
    {case match='no'}
        <a href={concat("content/download/",$attribute.contentobject_id,"/",$attribute.id,"/file/",$attribute.content.original_filename)|ezurl}>{$attribute.content.original_filename|wash( xhtml)|shorten(50)}</a> 
    {/case}
    {case}
        <a href={concat("content/download/",$attribute.contentobject_id,"/",$attribute.id,"/file/",$attribute.content.original_filename)|ezurl}>{$attribute.content.mime_type|mimetype_icon( $icon_m2000_size_m2000, $icon_m2000_title_m2000 )} {$file_name|wash()|shorten(50)} {$attribute.content.filesize|si( byte )}</a>
    {/case}
{/switch}
{else}
    <div class="message-error"><h2>{'The file could not be found.'|i18n( 'design/ezwebin/view/ezbinaryfile' )}</h2></div>
{/if}
{/if}