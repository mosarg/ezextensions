{run-once}
 {ezscript_require( array('modal_selection2.js'))}
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

{foreach $available_options as $option}
<div class="school-id {$option.scuola}"> <span class="checkbox-label">{$option.name}</span> <span class="name">{$option.scuola}</span> <input type="checkbox" name="ContentObjectAttribute_sckenhancedselection_selection_{$id}[]"
                            value="{concat($option.identifier,'-',$option.scuola)|wash}"
                           {if $content|contains(concat($option.identifier,'-',$option.scuola))}
                           checked="yes"{/if}/></div>
     
       
{/foreach}
 
 

     
{undef}