<!--double_top.tpl--> 
{*
Here we are going to generate some code with ul/li hierarchy A stylesheet called dropdown.css is also necessary to create the 
menu. Of course, it can be modified Only Folder are shown in the menu. This can be changed by adding the id of the class which you want to put into 
it. For example, replace array(1) by array(1,2) for each fetch functions if you want to show folders and Articles in each levels.
*}
{def $goleft=ezini( 'TopDrop', 'goleft', 'design.ini')} 
{let top_cat=2 used_node=false()}
{set used_node=2}
	
<div class="menu"><ul> {def $base=fetch( 'content', 'node', hash( 'node_id', 2 ) )} 


<li><a href="http://ez.hell.pit">Home</a></li>
{* FIRST LEVEL *}

{def $i=0}

<!-- In this way I can show only sublevel menus mm-->

{if eq($module_result.path|count,1)}
	{def $node_parent=$top_cat}
{else}
	{def $node_parent=$module_result.path[1].node_id}
{/if}

{section loop=fetch(content,list,hash(parent_node_id,$node_parent, class_filter_type, "include", class_filter_array, array(1, 11, 16, 17, 19, 20, 23, 38, 39,44),sort_by,$base.sort_array))}
	{let child_check=fetch(content,list,hash(parent_node_id,$:item.node_id, class_filter_type, "include", class_filter_array, array(1, 11, 16, 17, 19, 20, 23, 38, 39,44),sort_by,$base.sort_array))}
	{set $i=inc( $i )}

	 {if eq( $item.class_identifier, 'link')}
		<li><a class="{concat('menu_',$i)}" href={$:item.data_map.location.content|ezurl}>{$:item.name}
            {else}
		<li><a class="{concat('menu_',$i)}" href={$:item.url_alias|ezurl}>{$:item.name}
            {/if}


{section show=$child_check|count|gt(0)}

	{* SECOND LEVEL *}
	<!--[if IE 7]><!--></a><!--<![endif]-->
	<table><tbody><tr><td>
	{if $i|gt( $goleft )}
		<ul class="endstop">
	{else}
		<ul>
	{/if}
		{section loop=fetch(content,list,hash(parent_node_id,$:item.node_id, class_filter_type, "include", class_filter_array, array(1, 16, 17, 19, 20, 23, 38, 39),sort_by,$:item.sort_array))}
		{let child_check1=fetch(content,list,hash(parent_node_id,$:item.node_id, class_filter_type, "include", class_filter_array, array(1, 16, 17, 19, 20, 23, 38, 39),sort_by,$:item.sort_array))}
	          <li><a {section show=$child_check1|count|gt(0)}class="drop"{/section} href={$:item.url_alias|ezurl}>{$:item.name}
		  
{section show=$child_check1|count|gt(0)}
				
		{* THIRD LEVEL *}
		<!--[if IE 7]><!--></a><!--<![endif]-->
		<table><tbody><tr><td>
		{if $i|gt( $goleft )}
			<ul class="left">
		{else}
			<ul>
		{/if}
			{section loop=fetch(content,list,hash(parent_node_id,$:item.node_id, class_filter_type, "include", class_filter_array, array(1, 16, 17, 19, 20, 23, 38, 39),sort_by,$:item.sort_array))}
			{let child_check2=fetch(content,list,hash(parent_node_id,$:item.node_id, class_filter_type, "include", class_filter_array, array(1, 16, 17, 19, 20, 23, 38, 39),sort_by,$:item.sort_array))}
			<li><a {section show=$child_check2|count|gt(0)}class="drop"{/section} href={$:item.url_alias|ezurl}>{$:item.name}

{section show=$child_check2|count|gt(0)}

			{* FOURTH LEVEL *}
			<!--[if IE 7]><!--></a><!--<![endif]-->
			<table><tbody><tr><td>
			{if $i|gt( $goleft )}
				<ul class="left">
			{else}
				<ul>
			{/if}
				{section loop=fetch(content,list,hash(parent_node_id,$:item.node_id, class_filter_type, "include", class_filter_array, array(1, 16, 17, 20, 23, 39),sort_by,$:item.sort_array))}
				<li><a href={$:item.url_alias|ezurl}>{$:item.name}</a></li>
				{/section}
			</ul>
			</td></tr></tbody></table>
			{/section}
			</a>
			</li>
			{/let}	
			{/section}
		</ul>
		</td></tr></tbody></table>
{/section}
                      <!--[if lte IE 6]></a><![endif]-->
                      <!--[if IE 7]><!--></a><!--<![endif]-->
                      <!--[if !IE]> --><!-- <![endif]-->
		</li>
		{/let}	
		{/section}
	</ul>
	</td></tr></tbody></table>
	<!--[if lte IE 6]></a><![endif]-->
	<!--[if !IE]> --><!-- <![endif]-->
{section-else}
     </a>
{/section}
	
	</li>
	{/let}
	{/section}

{undef $i}
{undef $goleft}
{undef $base}
 </ul></div>

{/let}

