{def $content=$attribute.content
     $classContent=$attribute.class_content
     $id=$attribute.id
     $i18n_context="extension/sckenhancedselection/object/edit"
     $available_options=$classContent.options }
{switch match=$attribute.object.class_identifier}
{case match='ata'}
{set $available_options=$available_options|merge($classContent.db_options)}
<div class="class-element">
    <h5 class="school_title">{"Seleziona la scuola o le scuole di pertinenza"|i18n('user2/register')}</h5>
<ul class="selection-class">
    {foreach $available_options as $option}
    
    {if $option.identifier}
    <li class="node roundedmore">
        <input  {$classContent.is_multiselect|choose('type="radio"','type="checkbox"')} name="ContentObjectAttribute_sckenhancedselection_selection_{$id}[]" value="{$option.identifier|wash}" {if $content|contains($option.identifier)} checked="checked"{/if}/>
                <label >{$option.name|wash}</label>
    </li>
    {/if}

  {/foreach}
</ul>
</div>
{/case}
{case}
{if and(is_set($classContent.db_options),count($classContent.db_options)|gt(0))}
    {set $available_options=$classContent.db_options}
{/if}
<div class="class-element">
    <h5 class="school_title">{"Seleziona la scuola o le scuole di pertinenza"|i18n('user2/register')}</h5>
<ul class="selection-class">
    {foreach $available_options as $option}
    
    {if $option.identifier}
    <li class="node roundedmore">
        <input  {$classContent.is_multiselect|choose('type="radio"','type="checkbox"')} name="ContentObjectAttribute_sckenhancedselection_selection_{$id}[]" value="{$option.identifier|wash}"{if $content|contains($option.identifier)} checked="checked"{/if} />
                <label>{$option.name|wash}</label>
    </li>
    {/if}

  {/foreach}
</ul>
</div>
{/case}
{/switch}


{undef $content $classContent $id $i18n_context $available_options}
<script type="text/javascript">
    $.include({"stylesheets/edit/school_list.css"|ezdesign});
</script>
