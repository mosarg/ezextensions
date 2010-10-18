<div class="block">
    <label>Test da tradurre:</label>
    <p>{$class_attribute.data_text1}</p>
</div>
<div class="block">
<label>{'Options'|i18n( 'design/standard/class/datatype' )}:</label>
{section show=$class_attribute.content.options}
<table class="list" cellspacing="0">
{section var=Options loop=$class_attribute.content.options sequence=array( bglight, bgdark )}
<tr class="{$Options.sequence}"><td>{$Options.item.name|wash( xhtml )}</td></tr>
{/section}
</table>
{section-else}
<p>{'There are no options.'|i18n( 'design/standard/class/datatype' )}</p>
{/section}
</div>