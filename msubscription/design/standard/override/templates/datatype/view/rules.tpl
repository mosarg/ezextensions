{* matrice alunni edit*}

{def $attribute_base=ContentObjectAttribute
     $matrix=$attribute.content}

{if $matrix.rows.sequential}

<div style="display:none" id="rules">
    <p title="rules_labels">{json_encode($matrix.columns.sequential)}</p>
    <p title="rules_content">{json_encode($matrix.rows.sequential)}</p>
</div>
{/if}



{undef}
