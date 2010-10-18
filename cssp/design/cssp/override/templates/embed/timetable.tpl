{def $matrix=$attribute.content}
<table class="list" cellspacing="0">
<tr>
<th>{"Ora:"|i18n("design/m2000/full/helper_prof")}</th>
{foreach $matrix.columns.sequential as $ColumnNames}
<th>{$ColumnNames.name}</th>
{/foreach}
</tr>
{def $i=0}
{foreach $matrix.rows.sequential as $Rows sequence array( bglight, bgdark ) as $style}
<tr class="{$style}">
    <td>{set $i=inc($i)}{$i}°</td>
    {foreach $Rows.columns as $Columns }
    <td>{$Columns|wash( xhtml )}</td>
    {/foreach}
</tr>
{/foreach}
{undef}
</table>
{undef}