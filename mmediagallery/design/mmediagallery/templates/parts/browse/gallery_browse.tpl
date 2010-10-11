
{def $ignore_nodes_merge=''}

<table class="list" cellspacing="0">
<tr>
    <th class="tight">
          <img src={'toggle-button-16x16.gif'|ezimage} alt="{'Invert selection'|i18n( 'design/scuola/content/browse_mode_list' )}" title="{'Invert selection'|i18n( 'design/scuola/content/browse_mode_list' )}" onclick="ezjs_toggleCheckboxes( document.browse, '{$select_name}[]' ); return false;" />
       </th>
    <th class="tight">
        {'Immagine'|i18n( 'design/scuola/content/browse_mode_list' )}
    </th>


    <th >
        {'Nome'|i18n( 'design/scuola/content/browse_mode_list' )}
    </th>
    <th class="tight">
    {'Tipo'|i18n( 'design/scuola/content/browse_mode_list' )}
    </th>
</tr>

{foreach $node_array as $Nodes sequence array( bglight, bgdark ) as $style}
  <tr class="{$style}">
    <td>
   
     {set $ignore_nodes_merge=merge( $browse.ignore_nodes_select_subtree, $Nodes.path_array )}
     {if and( or( $browse.permission|not,
                           cond( is_set( $browse.permission.contentclass_id ),
                                 fetch( content, access, hash( access,          $browse.permission.access,
                                                               contentobject,   $Nodes,
                                                               contentclass_id, $browse.permission.contentclass_id ) ),
                                 fetch( content, access, hash( access,          $browse.permission.access,
                                                               contentobject,   $Nodes ) ) ) ),
                           $browse.ignore_nodes_select|contains( $Nodes.node_id )|not,
                           eq( $ignore_nodes_merge|count,
                               $ignore_nodes_merge|unique|count ) )}
        {if is_array( $browse.class_array )}
            {if $browse.class_array|contains( $Nodes.object.content_class.identifier )}
                <input type="{$select_type}" name="{$select_name}[]" value="{$Nodes[$select_attribute]}" />
            {else}
                <input type="{$select_type}" name="" value="" disabled="disabled" />
            {/if}
        {else}
            {section show=and( or( eq( $browse.action_name, 'MoveNode' ), eq( $browse.action_name, 'CopyNode' ), eq( $browse.action_name, 'AddNodeAssignment' ) ), $Nodes.item.object.content_class.is_container|not )}
                <input type="{$select_type}" name="{$select_name}[]" value="{$Nodes[$select_attribute]}" disabled="disabled" />
            {section-else}
                <input type="{$select_type}" name="{$select_name}[]" value="{$Nodes[$select_attribute]}" />
            {/section}
        {/if}
    {else}
        <input type="{$select_type}" name="" value="" disabled="disabled" />
    {/if}
    </td>

    {if eq($Nodes.object.content_class.identifier,'image')}
    <td>
       <img alt="browse_image" src={$Nodes.data_map.image.content[gallerythumbnailsquare].url|ezroot}/>
    </td>
    {/if}
    <td>
    {set $ignore_nodes_merge=merge( $browse.ignore_nodes_click, $Nodes.path_array )}
    {if eq( $ignore_nodes_merge|count,
                      $ignore_nodes_merge|unique|count )}
        {if and( or( ne( $browse.action_name, 'MoveNode' ), ne( $browse.action_name, 'CopyNode' ) ), $Nodes.object.content_class.is_container )}
            <a href={concat( '/content/browse/', $Nodes.node_id )|ezurl}>{$Nodes.name|wash}</a>
        {else}
            {$Nodes.name|wash}
        {/if}
    {else}
        {$Nodes.name|wash}
    {/if}
    

    </td>
    <td class="class">
    {$Nodes.object.content_class.name|wash}
    </td>
 </tr>
{/foreach}
</table>