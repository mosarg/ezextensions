{def $content=$attribute.content
     $classContent=$attribute.class_content
     $i18n_context="extension/sckenhancedselection/object/view"
     $available_options=$classContent.options}

{if and(is_set($classContent.db_options),count($classContent.db_options)|gt(0))}
    {set $available_options=$classContent.db_options}
{/if}

{foreach $available_options as $option}
    {$classContent.delimiter}
    {if $content|contains($option.identifier)|not}
        {skip}
    {/if}
        {$option.name|wash}
            {if is_set($option.scuola)}
                {$option.scuola|wash}
            {/if}
    {delimiter}
    {if $content|contains($option.identifier)}
        {cond($classContent.delimiter|ne(""),$classContent.delimiter,", ")}
    {/if}
    {/delimiter}
{/foreach}

{undef}