{* contatti - block item *}
{if is_set($style)|not()}
    {def $style='compact'}
{/if}
<div class="class-contatti-item">
      {def $esterni=$node.data_map.contatti_esterni.content
           $interni=$node.data_map.contatti_interni.content.relation_browse
           $labels=$esterni.columns.sequential
           $contatto_interno=''}
    <table class="micro-list" cellspacing="0">
      {foreach $esterni.rows.sequential as $contatto_esterno}
        {foreach $contatto_esterno.columns as $Columns sequence $labels as $columnName}
        <tr>
            <td><h3 class="small">{$columnName.name}:</h3> {$Columns|wash( xhtml )}</td>
        </tr>
        {/foreach}
        <tr class="empty">
        </tr>
      {/foreach}
      {foreach $interni as $nodo_interno}
        {set $contatto_interno=fetch(content,object,hash(object_id,$nodo_interno.contentobject_id,object_version,$nodo_interno.contentobject_version))}
         
        <tr><td ><h3 class="small">{$labels[0].name}: </h3>
               <a href={$contatto_interno.main_node.url_alias|ezurl}>{$contatto_interno.name|preg_replace('/\s\w*/','')}</a>
        </td></tr>
        <tr><td >
                <h3 class="small">{$labels[1].name}: </h3><a href={$contatto_interno.main_node.url_alias|ezurl}>{$contatto_interno.name|preg_replace('/\w*\s+/','')}</a>
        </td></tr>
        <tr><td ><h3 class="small">{$labels[2].name}: </h3>{if is_unset($contatto_interno.ruolo)}-{else}{$contatto_interno.ruolo}{/if}</td></tr>
        <tr><td ><h3 class="small">{$labels[3].name}: </h3>{$contatto_interno.data_map.telefono.content}</td></tr>
        <tr><td ><h3 class="small">{$labels[4].name}: </h3>{$contatto_interno.data_map.email.content}</td></tr>
        <tr class="empty">
        </tr>
      {/foreach}
      
      </table>
{include uri='design:parts/object_informations.tpl' style=$style}

</div>