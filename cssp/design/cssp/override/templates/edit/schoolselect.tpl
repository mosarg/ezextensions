{def $content=$attribute.content
     $classContent=$attribute.class_content
     $id=$attribute.id
     $i18n_context="extension/sckenhancedselection/object/edit"
     $available_options=$classContent.options }


{if and(is_set($classContent.db_options),count($classContent.db_options)|gt(0))}
    {set $available_options=$classContent.db_options}
{/if}
    {foreach $available_options as $option}
        <input type="radio" name="ContentObjectAttribute_sckenhancedselection_selection_{$id}[]" value="{$option.identifier|wash}"
                {if $content|contains($option.identifier)} checked{/if}>
               {$option.name|wash}
        </input>
    {/foreach}      

{undef $content $classContent $id $i18n_context $available_options}

