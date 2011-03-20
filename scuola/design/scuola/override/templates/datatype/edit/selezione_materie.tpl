{run-once}
 {ezscript_require( array('modal_selection.js'))}
{/run-once}



{def $content=$attribute.content
     $classContent=$attribute.class_content
     $id=$attribute.id
     $i18n_context="scuola/materie/selezione/view"
     $available_options=$classContent.options}


{if  and(is_set($classContent.db_options),count($classContent.db_options)|gt(0))}
    {set $available_options=$classContent.db_options}
    {def    $selection_chain=$classContent.options
            $select_class=''}
{foreach $selection_chain as $chain_order}
    {set $select_class=concat($select_class,$chain_order.name,'_',$chain_order.identifier)}
{/foreach}

 {/if}


<select class={$select_class|wash} name="ContentObjectAttribute_sckenhancedselection_selection_{$id}[]"
        {if $classContent.is_multiselect} multiple="multiple"{/if}>
        
    {foreach $available_options as $option}
        <option value="{concat($option.identifier,'-',$option.scuola)|wash}"
                {if and($content|contains($option.identifier),contains($option.scuola))}
                selected="selected"{/if}>
            {$option.name}
        </option>
    {/foreach}
        
</select>
     
{undef}