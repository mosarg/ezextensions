{* matrix view scuola *}
{def $matrix=$attribute.content}
{if eq($subview,'table_less')}

    <tr>
        {foreach $matrix.columns.sequential as $ColumnNames}
             <th>{$ColumnNames.name}</th>
        {/foreach}
    </tr>
{foreach $matrix.rows.sequential as $Rows sequence array('light','dark') as $style}
    <tr class="{$style}">
        {foreach $Rows.columns as $Columns}
            <td>{$Columns|wash( xhtml )}</td>
        {/foreach}
    </tr>
{/foreach}

{else}
    <table class="list" cellspacing="0">
    <tr>
        {foreach $matrix.columns.sequential as $ColumnNames}
             <th>{$ColumnNames.name}</th>
        {/foreach}
    </tr>
{foreach $matrix.rows.sequential as $Rows sequence array('light','dark') as $style}
    <tr class="{$style}">
        {foreach $Rows.columns as $Columns}
            <td>{$Columns|wash( xhtml )}</td>
        {/foreach}
    </tr>
{/foreach}
  </table>
{/if}


{undef}