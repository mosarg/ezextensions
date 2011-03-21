{def $content=$attribute.content
     $classContent=$attribute.class_content
     $id=$attribute.id
     $i18n_context="extension/sckenhancedselection/object/edit"
     $available_options=$classContent.options
     $select_class=''}


{if and(is_set($classContent.db_options),count($classContent.db_options)|gt(0))}
    {set $available_options=$classContent.db_options}
    {def    $selection_chain=$classContent.options}

{/if}

{if is_set($seltype)}
    {foreach $available_options as $option}
        <input type="radio" name="ContentObjectAttribute_sckenhancedselection_selection_{$id}[]" value="{$option.identifier|wash}"
                {if $content|contains($option.identifier)} selected="selected"{/if}>
               {$option.name|wash}
        </input>
    {/foreach}      
{else}

{if is_set($selection_chain)}
{foreach $selection_chain as $chain_order}
    {set $select_class=concat($select_class,$chain_order.name,'_',$chain_order.identifier)}
{/foreach}
{/if}

<select class="{$select_class|wash}" name="ContentObjectAttribute_sckenhancedselection_selection_{$id}[]"
        {if $classContent.is_multiselect} multiple="multiple"{/if}>
        
    {foreach $available_options as $option}
        <option value="{$option.identifier|wash}"
                {if $content|contains($option.identifier)} selected="selected"{/if}>
               {$option.name|wash}
        </option>
    {/foreach}      
</select>
{/if}
{undef $content $classContent $id $i18n_context $available_options}

