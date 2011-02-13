{* laboratory line- embed view *}
{if is_set($imagesize)|not()}
    {def $imagesize='large'}
{/if}
{if is_set($style)|not()}
    {def $style='compact'}
{/if}
<div class="content-view-line">
<div class="class-laboratory">
     <h2 class="line-header-common"><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash}</a></h2>
    
     <h2 class="titleimage"><a href={$node.url_alias|ezurl}>
         
     {if $node.data_map.logo.has_content}
        <div class="attribute-image">
            {attribute_view_gui image_class=$imagesize href=$node.url_alias|ezurl attribute=$node.data_map.logo}
        </div>
    {/if}     
   
   
     </a>
     </h2>

{if $node.data_map.responsabili.has_content}
            <h4> {'Docenti responsabili: '|i18n('scuola/teach')}</h4>
            <p class="responsabili">
                {attribute_view_gui attribute=$node.data_map.responsabili}
            </p>
            {/if}
     
    {if $node.data_map.intro.has_content}
    <div class="attribute-short">
      {$node.data_map.intro.content.output.output_text|smartshort(150,'...')}</div>
    {/if}
    {include uri='design:parts/object_informations.tpl' style=$style}
 </div>
</div>