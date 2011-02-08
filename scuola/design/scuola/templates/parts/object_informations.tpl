{if $style|eq('full')}
<div class="object_informations">
<div class="attribute-byline">
        {if is_set($node.data_map.author)}
        <p class="author">
        {attribute_view_gui attribute=$node.data_map.author}
        </p>
        {/if}
        <p class="date">
             {$node.class_name}
             {'Pubblicato il: '|i18n('scuola/dates')}{$node.object.published|l10n(shortdatetime)}
             {'Ultima modifica: '|i18n('scuola/dates')}{$node.object.modified|l10n(shortdatetime)}
             {'Versione Corrente: '|i18n('scuola/dates')}{$node.object.current_version}
        </p>
</div>
</div>
{else}
 <div class="object_informations">
  <div class="attribute-byline">
       <p class="date">
             {$node.class_name}
             {'Pubblicato il: '|i18n('scuola/dates')}{$node.object.published|l10n(shortdatetime)}
             {'Ultima modifica: '|i18n('scuola/dates')}{$node.object.modified|l10n(shortdatetime)}
       </p>
</div>
</div>
{/if}