<script type="text/javascript">
    $.include({"stylesheets/jpassword.css"|ezdesign});
</script>

{literal}
<script type="text/javascript">
  $(document).ready(function(){
        $("#testpassword").jpassword({
       length:8,
       lang: {
         please: "Inserisci una password...",
         low: "Estremamente insicura.",
         correct: "Sicurezza sufficiente.",
         high: "Estremamente sicura.",
         length: "-X- caratteri sarebbero perfetti",
         number: "Inserisci qualche numero",
         uppercase: "Inserisci qualche lettera maiuscola",
         lowercase: "Inserisci qualche lettera minuscola?",
         punctuation: "Inserisci  della punteggiatura",
         special: "Inserisci dei caratteri speciali"
     },
     generate: "new_password"
 });

 });
</script>
{/literal}
<h2 class="attributetype">{"Group password"|i18n( 'survey' )}</h2>

<div class="block">
    <label>{"Please insert desired group password"|i18n( 'survey' )}:</label>
    <input id="testpassword" class="box" type="text" name="{$prefix_attribute}_ezsurvey_question_{$question.id}_text_{$attribute_id}" value="{$question.text|wash('xhtml')}" size="30" />
    <a href="#" id="new_password" class="roundedmore">Genera una password</a>
</div>


<div class="block">
    <label>{"Max number of times this password can be used"|i18n( 'survey' )}:</label>
    <input type="text" size="20" name="{$prefix_attribute}_ezsurvey_question_{$question.id}_text2_{$attribute_id}" value="{$question.text2|number($question.num)|wash('xhtml')}" />
</div>

<script type="text/javascript" src={'javascript/jpassword.js'|ezdesign} ></script>