{def $content=$attribute.content
     $classContent=$attribute.class_content
     $available_options=$classContent.options
     $id=$attribute.id}

{if and(is_set($classContent.db_options),count($classContent.db_options)|gt(0))}
    {def $available_options=$classContent.db_options}
{/if}


{foreach $available_options as $option}
<div><input id="{$option.identifier|wash}" class="checklist" name="ContentObjectAttribute_sckenhancedselection_selection_{$id}[]" type="checkbox" value="{$option.identifier|wash}"/>
              {$option.name|wash}<br /></div>

{/foreach}



{undef}