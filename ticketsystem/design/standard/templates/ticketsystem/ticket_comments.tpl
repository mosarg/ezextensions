{def $comments=fetch( 'content', 'tree', hash( 'parent_node_id', $node.node_id, 
              'class_filter_type',  'include',
              'class_filter_array', array( 'ticket_comment' ),
              'limitation', array(),
              'sort_by', array( array( 'published', true() ) )))}

 {def $item_type=ezpreference( 'admin_list_limit' )
		     $number_of_items=min( $item_type, 3)|choose( 10, 10, 25, 50 )
	             $can_remove=false()
		     $can_edit=false()
		     $can_create=false()
		     $can_copy=false()
		     $children_count=$node.children_count
		     $children=fetch( content, list, hash( parent_node_id, $node.node_id,
                                                           sort_by, $node.sort_array,
                                                           limit, $number_of_items,
                                                           offset, $view_parameters.offset ))}
{if $comments}
<div class="content-view-children">
            <div class="box-header">
       		<h2 class="context-title">Commenti</h2>
            </div>

	<div class="context-toolbar">
            <div class="block">
		<div class="left">
		  <p>
	      {switch match=$number_of_items}
	  	 {case match=25}
                     <a href={'/user/preferences/set/admin_list_limit/1'|ezurl} title="{'Show 10 items per page.'|i18n( 'design/admin/node/view/full' )}">10</a>
                      <span class="current">25</span>
                     <a href={'/user/preferences/set/admin_list_limit/3'|ezurl} title="{'Show 50 items per page.'|i18n( 'design/admin/node/view/full' )}">50</a>
	  	  {/case}
	   	  {case match=50}
		       <a href={'/user/preferences/set/admin_list_limit/1'|ezurl} title="{'Show 10 items per page.'|i18n( 'design/admin/node/view/full' )}">10</a>
		       <a href={'/user/preferences/set/admin_list_limit/2'|ezurl} title="{'Show 25 items per page.'|i18n( 'design/admin/node/view/full' )}">25</a>
		       <span class="current">50</span>
                    {/case}
                   {case}
		       <span class="current">10</span>
                       <a href={'/user/preferences/set/admin_list_limit/2'|ezurl} title="{'Show 25 items per page.'|i18n( 'design/admin/node/view/full' )}">25</a>
                       <a href={'/user/preferences/set/admin_list_limit/3'|ezurl} title="{'Show 50 items per page.'|i18n( 'design/admin/node/view/full' )}">50</a>
		    {/case}
              {/switch}
		   </p>
		</div> 
	</div> 
        </div>
	      <table class="list" cellspacing="0">
		    <tr>
                        <th>Nome</th>
			<th>Data</th>
			<th>Autore</th>
			<th class="tight">Azione</th>
			</tr>
                     {def  $node_name=$node.name
                           $child_name=''}
			{foreach $comments as $comment sequence array( bglight, bgdark ) as $style}
			{set $child_name=$comment.name|wash}
			       <tr class="{$style}">
				   <td> {$child_name} </td>
				     <td> {$comment.object.published|l10n( 'shortdatetime' )}</td>

                                    <td>{if eq($user.contentobject.name, $comment.creator.name)}Self{else}{$comment.creator.name}{/if}</td>
				<td> 
                        <form enctype="multipart/form-data" method="post" action={"content/action/"|ezurl}>
                            <input type="hidden" name="TopLevelNode" value="{$node.main_node_id}" />
                            <input type="hidden" name="ContentNodeID" value="{$comment.main_node_id}" />
                            <input type="hidden" name="ContentObjectID" value="{$comment.contentobject_id}" />
    			{if $comment.can_remove}
                            <input class="button"  type="submit" name="ActionRemove" value="Elimina"/>
                        {else}
                            <input class="button-disabled"  type="submit" name="ActionRemove"value="Elimina" disabled="disabled" />
			{/if}
			{if $comment.can_edit}
			    <input class="button"  type="submit" name="EditButton" value="Modifica"/>
			{else}
                            <input class="button-disabled"  type="submit" name="EditButton" value="Modifica" disabled="disabled"/>
			{/if}
			</form>
			</td>
			</tr>
                            <tr class="{$style}">
                            <td colspan="4" > {attribute_view_gui attribute=$comment.data_map.comment}</td>
                            </tr>
			{undef $node_name
                               $child_name}
		 	{/foreach}
                    </table>
		   
		   <div class="context-toolbar">
				{include name=navigator
				         uri='design:navigator/google.tpl'
				         page_uri=$node.url_alias
				         item_count=$children_count
				         view_parameters=$view_parameters
				         item_limit=$number_of_items}
                    </div>
		</div>
{/if}