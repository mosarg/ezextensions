{* Ajax color select template  *}

{run-once}

{ezcss_require(array('farbtastic.css'))}
{ezscript_require( array( concat( 'ezjsc::', 'jqueryio' ),'classes/farbtastic.js'))}
{/run-once}

{literal}
<script type="text/javascript">


$(document).ready(function(){
    $('#colorpicker').farbtastic('#color');
}); 
</script>
{/literal}
{def $color_attribute_base='ContentObjectAttribute'
     $html_class='full'}

<div id="colorpicker"></div>

<input id="color" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="text" size="70" name="{$color_attribute_base}_ezstring_data_text_{$attribute.id}" value="{$attribute.data_text|wash( xhtml )}" />

{undef}

