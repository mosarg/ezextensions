{default     class_content		= $attribute.class_content
	     class_list			= fetch( class, list, hash( 'class_filter', $class_content.class_constraint_list,'sort_by', array( 'name', true() ) ) )
	     class_create_list		= fetch( class, list, hash( 'class_filter', $class_content.class_create_constraint_list,'sort_by', array( 'name', true() ) ) )
	     can_create			= true()
	     new_object_initial_node_placement=false()
	     related_items		= array()
	     browse_object_start_node	= $class_content.default_selection.node_id
	     browse_object_browse_type	= $class_content.selection_type
	     allow_edit			= $class_content.allow_edit
	     attribute_base		= ContentObjectAttribute
	     depth			= $class_content.depth}
{include uri="design:content/datatype/edit/ezobjectrelationbrowse_controls.tpl"}
{switch match=$class_content.selection_type}
	
	{* inline AJAX *}
	{case match=1}
		{run-once}
                        <script type="text/javascript" src={'javascript/objectrelationbrowse.js'|ezdesign} ></script>
			<script language="javascript"  type="text/javascript">
				//ORB  = new ORBHandler("{concat("objectrelationbrowse/list/",$attribute.contentclassattribute_id,"/",ezini( 'ModuleSettings', 'DynamicListLimit', 'module.ini' ),"/")|ezurl(no)}");
				ORB  = new ORBHandler("{concat("objectrelationbrowse/list/",ezini( 'ModuleSettings', 'DynamicListLimit', 'module.ini' ),"/")|ezurl(no)}");
				if (!ORB.http) alert("{"Unable to initialize AJAX handler"|i18n('design/standard/content/view')}");
				if (!ORB.http) ORB = null;

			</script>
	
	
		{/run-once}

		<input type="hidden" name="SelectionType_{$attribute.id}" value="1" />
		<input type="hidden" name="{$attribute_base}_id[]" value="{$attribute.id}" />
		<input type="hidden" name="contentclass_attribute_{$attribute.id}" id="contentclass_attribute_{$attribute.id}" value="{$attribute.contentclassattribute_id}" />

		<div id="panel_output_{$attribute.id}">
			<table border="0" class="list" style="width:100%" cellpadding=3 cellspacing=0>
				<tr>
					<td colspan="2">
						<input type="button" class="button" value = "{'Search...'|i18n('design/standard/content/view')}" 
							onClick="if (ORB) ORB.showInput({$attribute.id})" />
						<input type="button" class="button" value = "{'Remove selected'|i18n('design/standard/content/view')}" 
							onClick="if (ORB) ORB.moveItem(items_output_{$attribute.id},items_input_{$attribute.id}); if (ORB) ORB.selectall('items_output_{$attribute.id}',{$attribute.id});return false;"  style="width: 100px;">
						<input type="submit" class="button" value="{'Update priorities'|i18n( 'design/standard/content/datatype' )}"
							onClick="if (ORB) ORB.selectall('items_output_{$attribute.id}',{$attribute.id});" name="CustomActionButton[{$attribute.id}_update_priorities]"  />
					</td>
				</tr>
				<tr>
					<td valign="top">
						<div id="selectbox_output_{$attribute.id}" style="width:100%;">
							<select id="items_output_{$attribute.id}" multiple size="8" style="width:100%;">
							</select>
						</div>
					</td>
					<td width="20" valign="top">
						<img src={"move-up.gif"|ezimage} onclick="if (ORB) ORB.up('items_output_{$attribute.id}');" 
								title="{'Move selected item up'|i18n('design/standard/content/view')}" /><br/><br/>
							<img src={"move-down.gif"|ezimage} onclick="if (ORB) ORB.down('items_output_{$attribute.id}');" 
								title="{'Move selected item down'|i18n('design/standard/content/view')}" />
					</td>
				</tr>
			</table>
		</div>

		<div id="panel_input_{$attribute.id}" style="display:none">
			<table  border="0" class="list" style="width:100%" cellpadding=3 cellspacing=0 >
				<tr>
					<td colspan="2">
						<input type="text" size="32" name="objectname_{$attribute.id}" id="objectname_{$attribute.id}" 
							autocomplete="off"  onKeyUp="if (ORB) ORB.updateName('{$attribute.id}');"/>
						<input type="submit" class="button" value="{'Go'|i18n('design/standard/content/view')}" 
							onClick="if (ORB) ORB.updateName('{$attribute.id}');return false;">
						<span id="count_{$attribute.id}" style="display: inline;">0</span>
							{'results'|i18n('design/standard/content/view')} 
					</td>
				</tr>
				<tr>
					<td valign="top">
						<div id="selectbox_input_{$attribute.id}" style="width:100%;">
							<select size="6" style="width:100%;" id="items_input_{$attribute.id}" multiple>
								<option value="">{'Enter your search term(s)'|i18n('design/standard/content/view')}</option>
								{section loop=$attribute.content.relation_browse}
									{let term=fetch( 'content', 'object', hash( 'object_id', $:item.contentobject_id) )}
										<option value='{$:item.contentobject_id}' selected>{$term.name|shorten(99)}</option>
									{/let}
								{/section}
							</select>
						</div>
					</td>
					<td valign="top" width="20">
						<img src={"reverse.gif"|ezimage} class="button"  onclick="if (ORB) ORB.viceversa('items_input_{$attribute.id}');" 
								title="{'Reverse list'|i18n('design/standard/content/view')}" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="selectedtitle_{$attribute.id}" class="small" style="height:20px;">&nbsp;</div>
						<input type="button" class="button"  value = "{'Add selected'|i18n('design/standard/content/view')}" 
							onClick="if (ORB) ORB.moveItem(items_input_{$attribute.id}, items_output_{$attribute.id}); if (ORB) ORB.selectall('items_output_{$attribute.id}',{$attribute.id}); if (ORB) ORB.showOutput({$attribute.id}); return false;" style="width: 100px;">
						<input type="button" class="button"  value = "{'Cancel'|i18n('design/standard/content/view')}" 
							onClick="if (ORB) ORB.showOutput({$attribute.id})" />
					</td>
				</tr>
			</table>
		</div>

		<!-- the real data containers -->		
		<div id="nodelist_{$attribute.id}" style="display:inline;"></div>
		<div id="namelist_{$attribute.id}" style="display:inline;"></div>
		<div id="sellist_{$attribute.id}" style="display:inline;"></div>

		<script language="javascript"  type="text/javascript">
			if (ORB) ORB.moveItem( document.getElementById("items_input_{$attribute.id}"),  document.getElementById("items_output_{$attribute.id}"), true); 
			if (ORB) ORB.selectall("items_output_{$attribute.id}",{$attribute.id});
		</script>
	{/case}
	
	{* listbox *}
	{case match=2}
		{section loop=$attribute.content.relation_browse}
			{set related_items=$related_items|append($:item.contentobject_id)}
		{/section}
		
		<input type="hidden" name="SelectionType_{$attribute.id}" value="2" />
		<input type="hidden" name="{$attribute_base}_id[]" value="{$attribute.id}" />
		<select name="SelectedObjectIDArray_{$attribute.id}[]" multiple size="10" class="objectrelation">
			{section show=$attribute.contentclass_attribute.is_required|not}
				 <option value="0" {section show=or(eq($related_items|count,0),eq($attribute.content.relation_browse|count,0))}selected="selected"{/section}>{'No relation'|i18n( 'design/standard/content/datatype' )}</option>
			{/section}
	
			{let parent_node=fetch( content, node, hash( node_id, $browse_object_start_node ) )}
				{section var=node loop=fetch( content, tree,
						      hash( parent_node_id, $parent_node.node_id,
						       depth, $depth,
						       'class_filter_type',  'include','class_filter_array', $class_content.class_constraint_list,
						sort_by,array( array(  'path_string', true(), 'priority', true() ) ) ) )}
					<option value="{$node.contentobject_id}" {$related_items|contains($node.contentobject_id)|choose( '', 'selected="selected"' )}>{"&nbsp;&nbsp;&nbsp;"|repeat($node.depth)}{$node.name|wash}</option>
				{/section}
			{/let}
		</select>
	{/case}
	
	
	{* dropdown *}
	{case match=3}
		{section loop=$attribute.content.relation_browse}
			{set related_items=$related_items|append($:item.contentobject_id)}
		{/section}
		<input type="hidden" name="SelectionType_{$attribute.id}" value="3" />
		<input type="hidden" name="{$attribute_base}_id[]" value="{$attribute.id}" />
		
		<select name="SelectedObjectIDArray_{$attribute.id}[]">
			{section show=$attribute.contentclass_attribute.is_required|not}
				 <option value="0" {section show=or(eq($related_items|count,0),eq($attribute.content.relation_browse|count,0))}selected="selected"{/section}>{'No relation'|i18n( 'design/standard/content/datatype' )}</option>
			{/section}

			{let parent_node=fetch( content, node, hash( node_id, $browse_object_start_node ) )}
				{section var=node loop=fetch( content, tree,
						      hash( parent_node_id, $parent_node.node_id,
						            depth, $depth,
						            'class_filter_type',  'include','class_filter_array', $class_content.class_constraint_list,
							     sort_by,array( array(  'path_string', true(), 'priority', true() ) ) ) )}
					<option value="{$node.contentobject_id}" {$related_items|contains($node.contentobject_id)|choose( '', 'selected="selected"' )}>{"&nbsp;&nbsp;&nbsp;"|repeat($node.depth)}{$node.name|wash}</option>
				{/section}
			{/let}
		</select>
	{/case}
	
	
	{* checkbox (TODO)*}
	{case match=4}
		{section loop=$attribute.content.relation_browse}
			{set related_items=$related_items|append($:item.contentobject_id)}
		{/section}
		<input type="hidden" name="SelectionType_{$attribute.id}" value="4" />
		<input type="hidden" name="{$attribute_base}_id[]" value="{$attribute.id}" />
		
		{let parent_node=fetch( content, node, hash( node_id, $browse_object_start_node ) )}
			{section var=node loop=fetch( content, tree,
					      hash( parent_node_id, $parent_node.node_id,
						     depth, $depth,
						     'class_filter_type',  'include','class_filter_array', $class_content.class_constraint_list,
						   sort_by,array( array(  'path_string', true(), 'priority', true() ) ) ) )}
				{"&nbsp;&nbsp;&nbsp;"|repeat($node.depth)}<input type="checkbox" name="SelectedObjectIDArray_{$attribute.id}[]" value="{$node.contentobject_id}" {$related_items|contains($node.contentobject_id)|choose( '', 'checked="checked"' )}>{$node.name|wash}<br/>
			{/section}
		{/let}
	{/case}
	
	{* radio buttons (TODO) *}
	{case match=5}
		{section loop=$attribute.content.relation_browse}
			{set related_items=$related_items|append($:item.contentobject_id)}
		{/section}
		<input type="hidden" name="SelectionType_{$attribute.id}" value="4" />
		<input type="hidden" name="{$attribute_base}_id[]" value="{$attribute.id}" />

		{let parent_node=fetch( content, node, hash( node_id, $browse_object_start_node ) )}
			{section var=node loop=fetch( content, tree,
					      hash( parent_node_id, $parent_node.node_id,
						     depth, $depth,
						     'class_filter_type',  'include','class_filter_array', $class_content.class_constraint_list,
						   sort_by,array( array(  'path_string', true(), 'priority', true() ) ) ) )}
				{"&nbsp;&nbsp;&nbsp;"|repeat($node.depth)}<input type="radio" name="SelectedObjectIDArray_{$attribute.id}[]" value="{$node.contentobject_id}" {$related_items|contains($node.contentobject_id)|choose( '', 'checked="checked"' )}>{$node.name|wash}<br/>
			{/section}
		{/let}
	{/case}
	
	{* default browse *}
	{case}
		{section show=$attribute.content.relation_browse}
			<input type="hidden" name="SelectionType_{$attribute.id}" value="1" />
				<table class="list" cellspacing="0">
				<tr class="bglight">
				    <th class="tight"><img src={'toggle-button-16x16.gif'|ezimage} alt="{'Invert selection.'|i18n( 'design/standard/content/datatype' )}" onclick="ezjs_toggleCheckboxes( document.editform, '{$attribute_base}_selection[{$attribute.id}][]' ); return false;" title="{'Invert selection.'|i18n( 'design/standard/content/datatype' )}" /></th>
				    <th>Name</th>
				    <th>Type</th>
				    <th>Section</th>
				    <th class="tight">Order</th>
				</tr>

				{section name=Relation loop=$attribute.content.relation_browse sequence=array( bglight, bgdark )}
					
					{let object=fetch( content, object, hash( object_id, $:item.contentobject_id, object_version, $:item.contentobject_version ) )
					     version=fetch( content, version, hash( object_id, $:item.contentobject_id, version_id, $:item.contentobject_version ) )}
						{section show=$Relation:object}
							<tr class="{$:sequence}">

							{section show=$:item.is_modified}

								{* Remove. *}
								<td><input type="checkbox" name="{$attribute_base}_selection[{$attribute.id}][]" value="{$:item.contentobject_id}" /></td>

								<td colspan="3">

											<fieldset>
								<legend>{'Edit <%object_name> [%object_class]'|i18n( 'design/standard/content/datatype',, hash( '%object_name', $Relation:object.name, '%object_class', $Relation:object.class_name ) )|wash}</legend>

								{section name=Attribute loop=$:version.contentobject_attributes}
									<div class="block">
										{section show=$:item.display_info.edit.grouped_input}
											<fieldset>
											<legend>{$:item.contentclass_attribute.name}</legend>
											{attribute_edit_gui attribute_base=concat( $attribute_base, '_ezorl_edit_object_', $Relation:item.contentobject_id ) html_class='half' attribute=$:item priority=1}
											</fieldset>
										{section-else}
											<label>{$:item.contentclass_attribute.name}:</label>
											{attribute_edit_gui attribute_base=concat( $attribute_base, '_ezorl_edit_object_', $Relation:item.contentobject_id ) html_class='half' attribute=$:item priority=1}
										{/section}
									</div>
								{/section}


								</fieldset>
								</td>

								{* Order. *}
								<td><input size="2" type="text" name="{$attribute_base}_priority[{$attribute.id}][]" value="{$:item.priority}" /></td>

							{section-else}

								{let object=fetch( content, object, hash( object_id, $:item.contentobject_id, object_version, $:item.contentobject_version ) )}

									{* Remove. *}
									<td><input type="checkbox" name="{$attribute_base}_selection[{$attribute.id}][]" value="{$:item.contentobject_id}" /></td>

									{* Name *}
									<td>{if $Relation:object.main_node_id}<a href={concat("/content/view/full/",$Relation:object.main_node_id)|ezurl()}>{$Relation:object.name|wash()}</a>{else}{$Relation:object.name|wash()} (embedded object){/if}</td>

									{* Type *}
									<td>{$Relation:object.class_name|wash()}</td>

									{* Section *}
									<td>{fetch( section, object, hash( section_id, $Relation:object.section_id ) ).name|wash()}</td>

									{* Order. *}
									<td><input size="2" type="text" name="{$attribute_base}_priority[{$attribute.id}][]" value="{$:item.priority}" /></td>

								{/let}
							{/section}

							</tr>
						{/section}
					{/let}
					
				{/section}
				</table>

			{section-else}
				<p>{'There are no related objects.'|i18n( 'design/standard/content/datatype' )}</p>
			{/section}

			<div class="buttonblock">
				{section show=$attribute.content.relation_browse}
					<input class="button" type="submit" name="CustomActionButton[{$attribute.id}_remove_objects]" value="{'Remove selected'|i18n( 'design/standard/content/datatype' )}" />&nbsp;

					{section show=eq($class_content.allow_edit,1)}
						<input class="button" type="submit" name="CustomActionButton[{$attribute.id}_edit_objects]" value="{'Edit selected'|i18n( 'design/standard/content/datatype' )}" />			
					{section-else}
						<input class="button-disabled" type="submit" name="CustomActionButton[{$attribute.id}_edit_objects]" value="{'Edit selected'|i18n( 'design/standard/content/datatype' )}" disabled="disabled"  />
					{/section}

				{section-else}
					<input class="button-disabled" type="submit" name="CustomActionButton[{$attribute.id}_remove_objects]" value="{'Remove selected'|i18n( 'design/standard/content/datatype' )}" disabled="disabled" />&nbsp;
					<input class="button-disabled" type="submit" name="CustomActionButton[{$attribute.id}_edit_objects]" value="{'Edit selected'|i18n( 'design/standard/content/datatype' )}" disabled="disabled" />

				{/section}

				{section show=gt($attribute.content.relation_browse|count,1)}
					<input class="button" type="submit" name="{section show=eq($priority,1)}CustomActionButton[{$attribute.id}_update_priorities]{section-else}StoreButton{/section}" value="{'Update priorities'|i18n( 'design/standard/content/datatype' )}" />
				{/section}
				&nbsp;&nbsp;&nbsp;&nbsp;
				{section show=eq($class_content.type,1)}
					<input class="button-disabled" type="submit" name="CustomActionButton[{$attribute.id}_browse_objects]" value="{'Add existing objects'|i18n('design/standard/content/datatype')}"  disabled="disabled" />
				{section-else}
					<input class="button" type="submit" name="CustomActionButton[{$attribute.id}_browse_objects]" value="{'Add existing objects'|i18n('design/standard/content/datatype')}"  />
				{/section}

				<input type="hidden" name="{$attribute_base}_browse_for_object_browse_type[{$attribute.id}]" value="{$browse_object_browse_type|wash}" />
				{section show=$browse_object_start_node}
				    <input type="hidden" name="{$attribute_base}_browse_for_object_start_node[{$attribute.id}]" value="{$browse_object_start_node|wash}" />
				{/section}

				{section show=and( lt($class_content.selection_type,2), $can_create, array( 0, 1 )|contains( $class_content.type ) )}

					<select class="combobox" name="{$attribute_base}_new_class[{$attribute.id}]">
						{section name=Class loop=$class_create_list}
							<option value="{$:item.id}">{$:item.name|wash}</option>
						{/section}
					</select>

					{section show=$new_object_initial_node_placement}
						<input type="hidden" name="{$attribute_base}_object_initial_node_placement[{$attribute.id}]" value="{$new_object_initial_node_placement|wash}" />
					{/section}

					<input class="button" type="submit" name="CustomActionButton[{$attribute.id}_new_class]" value="{'Create new object'|i18n( 'design/standard/content/datatype' )}" />

				{/section}
			</div>		
	{/case}
{/switch}

{/default}
