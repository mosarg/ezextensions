{* progetto line view *}
<div class="content-view-line">
<div class="class-progetto">
    
    <h2 class="line-header-common"><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash}</a></h2>
    {include uri='design:parts/line/common_line_header.tpl'}
    
    {if $node.data_map.logo.has_content}
        <div class="attribute-image">
            {attribute_view_gui image_class=$imagesize href=$node.url_alias|ezurl attribute=$node.data_map.logo}
        </div>
    {/if}
    
    {if $node.data_map.intro.has_content}
    <div class="attribute-short">
       {attribute_view_gui attribute=$node.data_map.intro}
    </div>
    {/if}
    <span class="small_subtitle">{"Codice progetto:"|i18n("design/m2000/full/progetto")} {$node.data_map.codice_progetto.content|wash}</span>
{if is_set($location)|not}
      {include uri='design:parts/object_informations.tpl' style=$style}
{/if}
   
      </div>
 <div class="read-on">
        <a href={$node.url_alias|ezurl()}>{'Continua'|i18n('scuola/block/mainstory')}...</a>
    </div>
 
 </div>
{undef}