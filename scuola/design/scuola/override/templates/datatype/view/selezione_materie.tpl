{def $content=$attribute.content
     $classContent=$attribute.class_content
     $i18n_context="scuola/materie/selezione/view"
     $available_options=$classContent.options}

{if  and(is_set($classContent.db_options),count($classContent.db_options)|gt(0))}
    {set $available_options=$classContent.db_options}
{/if}



{if is_set($filter)}
{foreach $available_options as $option}

{if eq($option.scuola,$filter)}
    {if $content|contains(concat($option.identifier,'-',$filter))}
            
            {$option.name|wash}
    {/if}
 {/if}
 {/foreach}

 {else}

 {foreach $available_options as $option}
    {if $content|contains(concat($option.identifier,'-',$option.scuola))}
            {$option.name|wash}
    {/if}
 {/foreach}

 {/if}
{undef}