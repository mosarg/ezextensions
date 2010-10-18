{* Ajax color select template  *}
<script type="text/javascript">
    $.include({"stylesheets/farbtastic.css"|ezdesign});
</script>

<script type="text/javascript" src={'javascript/farbtastic.js'|ezdesign} ></script>



{literal}
<script type="text/javascript">


$(document).ready(function(){
    $('#colorpicker').farbtastic('#color');
}); //$(document).ready


</script>
{/literal}
{def $color_attribute_base='ContentObjectAttribute'
     $html_class='full'}

<div id="colorpicker"></div>

<input id="color" class="ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}" type="text" size="70" name="{$color_attribute_base}_ezstring_data_text_{$attribute.id}" value="{$attribute.data_text|wash( xhtml )}" />

{undef}

