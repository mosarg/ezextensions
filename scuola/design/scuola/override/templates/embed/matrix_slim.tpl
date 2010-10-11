{* Embed matrix-slim *}
{def $matrix=$attribute.content}
<table class="minimal_list" cellspacing="0">
{def $columnNames=$matrix.columns.sequential}
{def $i=0}
{foreach $matrix.rows.sequential as $Rows}

    {foreach $Rows.columns as $Columns sequence $columnNames as $columnName}
<tr>
    <td><h3>{$columnName.name}:</h3> {$Columns|wash( xhtml )}</td>
</tr>
    {/foreach}
    <tr class="empty">
    </tr>
    {/foreach}
{undef}
</table>
