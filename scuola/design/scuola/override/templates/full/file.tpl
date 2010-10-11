{* File - Full view *}
{scuolapagedata_set( 'left_menu', true() )}
{scuolapagedata_set( 'left_nav_menu', true() )}
{scuolapagedata_set( 'extra_menu', false() )}

<div class="border-box">
<div class="content-view-full">
    <div class="class-file">

    <div class="attribute-header">
        <h1>{$node.name|wash()}</h1>
    </div>
        {if $node.data_map.description.content.is_empty|not}
        <div class="attribute-description">
        {attribute_view_gui attribute=$node.data_map.description}
        </div>
        {/if}
     <div class="file-info">
        <table class="comparison-file" cellspacing="0">
            <thead>
                <tr>
                    <th colspan="2">
                        {"Parametri file"|i18n('scuola/content/file')}
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="title">Creato da:</td>
                    <td>{$node.creator.name}</td>
                 </tr>
                 <tr>
                    <td class="title">Appartiene a:</td>
                    <td>{$node.object.owner.name}</td>
                 </tr>
                 <tr>
                    <td class="title">Versione corrente:</td>
                    <td>{$node.object.current_version}</td>
                 </tr>
                 <tr>
                    <td class="title">Pubblicato il:</td>
                    <td>{$node.object.published|datetime('custom','%h:%m %a %d %F %Y')}

                    </td>
                 </tr>
                 <tr>
                    <td class="title">Modificato il:</td>
                    <td>{$node.object.modified|datetime('custom','%h:%m %a %d %F %Y')}</td>
                 </tr>
                 
                 <tr>
                     <td class="title">File: </td>
                     <td><a href={concat("content/download/",$node.data_map.file.contentobject_id,"/",$node.data_map.file.id,"/file/",$node.data_map.file.content.original_filename)|ezurl}>{$node.name}</a></td>
                 </tr>
                 
            </tbody>
        </table>
    </div>

     



    </div>
</div>

</div>