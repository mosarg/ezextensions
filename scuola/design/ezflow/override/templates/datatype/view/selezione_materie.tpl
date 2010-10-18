{def $content=$attribute.content
     $classContent=$attribute.class_content
     $i18n_context="scuola/materie/selezione/view"
     $available_options=$classContent.options}

{if  and(is_set($classContent.db_options),count($classContent.db_options)|gt(0))}
    {set $available_options=$classContent.db_options}
{/if}
{foreach $available_options as $option}
    {if $content|contains(concat($option.identifier,'-',$option.scuola))}
            {$option.name|wash}
    {/if}
 {/foreach}
{undef}