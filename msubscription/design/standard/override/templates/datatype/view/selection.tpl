{def $content=$attribute.content
     $classContent=$attribute.class_content
     $available_options=$classContent.options
     $content_options=array()}

{if and(is_set($classContent.db_options),count($classContent.db_options)|gt(0))}
    {set $available_options=$classContent.db_options}
{/if}

{foreach $available_options as $option}

{if $content|contains($option.identifier)}
   {set $content_options=$content_options|append(hash(id,$option.identifier,name,$option.name))}
{/if}

{/foreach}

{* $content_options|json_encode *}
{json_encode($content_options)}
{undef}

