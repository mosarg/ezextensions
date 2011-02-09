{switch match=$node.class_identifier}
    {case match='article'}
        {def $color_code='article_code'}
     {/case}
     {case match='folder'}
        {def $color_code='folder_code'}
     {/case}
     {case}
      {def $color_code='generic_code'}
     {/case}
  {/switch}

{switch match=$style}
{case match='full'}
<div class="object_informations {$color_code}">
<div class="attribute-byline">
        {if is_set($node.data_map.author)}
        <p class="author">
        {attribute_view_gui attribute=$node.data_map.author}
        </p>
        {/if}
        <p >
             {$node.class_name}
             {'Pubblicato il: '|i18n('scuola/dates')}{$node.object.published|l10n(shortdatetime)}
             {'Ultima modifica: '|i18n('scuola/dates')}{$node.object.modified|l10n(shortdatetime)}
             {'Versione Corrente: '|i18n('scuola/dates')}{$node.object.current_version}
        </p>
</div>
</div>
{/case}
{case match='ultracompact'}
 <div class="object_informations {$color_code}">
  <div class="attribute-byline">
       <p>
             {$node.class_name} {$node.object.published|l10n(shortdate)}
             
       </p>
</div>
</div>
{/case}
{case}
 <div class="object_informations {$color_code}">
  <div class="attribute-byline">
       <p>
             {$node.class_name}
             {'Pubblicato il: '|i18n('scuola/dates')}{$node.object.published|l10n(shortdate)}
       </p>
</div>
</div>
{/case}
{/switch}
{undef $color_code}