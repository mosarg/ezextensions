{* agenda_list - embed view *}
<tr class="agenda-list-element {$style}">
          <td ><a href={$object.main_node.url_alias|ezurl}>{$object.name|preg_replace('/\s\w*/','')}</a></td>
          <td ><a href={$object.main_node.url_alias|ezurl}>{$object.name|preg_replace('/\w*\s+/','')}</a></td>
          <td> {if $object.data_map.ruolo.has_content}{$object.data_map.ruolo.content}{/if}</td>
          <td >{$object.data_map.telefono.content}</td>
          <td >{$object.data_map.email.content}</td>
</tr>



