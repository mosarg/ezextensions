{* matrice alunni edit*}

{def $attribute_base=ContentObjectAttribute
     $matrix=$attribute.content}

{if $matrix.rows.sequential}

<div style="display:none" id="rules">
    <p title="rules_labels">{$matrix.columns.sequential|json_encode}</p>
    <p title="rules_content">{$matrix.rows.sequential|json_encode}</p>
</div>
{/if}



{undef}
