{set-block scope=root variable=cache_ttl}0{/set-block}
<div class="border-box">
    
{include uri='design:parts/global_variables.tpl' left_menu=true() left_nav_menu=true() extra_menu=false()}    



<div class="content-view-full">
    <div class="class-{$node.object.class_identifier}">

    <div class="attribute-header">
        <h1>{$node.name|wash()}</h1>
    </div>

    

    {def $name_pattern = $node.object.content_class.contentobject_name|explode('>')|implode(',')
         $name_pattern_array = array('enable_comments', 'enable_tipafriend', 'show_children', 'show_children_exclude', 'show_children_pr_page')}
    {set $name_pattern  = $name_pattern|explode('|')|implode(',')}
    {set $name_pattern  = $name_pattern|explode('<')|implode(',')}
    {set $name_pattern  = $name_pattern|explode(',')}
    {foreach $name_pattern  as $name_pattern_string}
        {set $name_pattern_array = $name_pattern_array|append( $name_pattern_string|trim() )}
    {/foreach}

    {foreach $node.object.contentobject_attributes as $attribute}
        {if $name_pattern_array|contains($attribute.contentclass_attribute_identifier)|not()}
            <div class="attribute-{$attribute.contentclass_attribute_identifier}">
                {attribute_view_gui attribute=$attribute}
            </div>
        {/if}
    {/foreach}
      

    </div>
</div>
</div>