<label>{'Per rispondere al questionario devi inserire la password che ti è stata consegnata'|i18n('scuola/survey')} {if $question.mandatory}<strong class="required">*</strong>{/if}</label>

<div class="survey-choices">

  <input size="50" name="{$prefix_attribute}_ezsurvey_answer_{$question.id}_{$attribute_id}" type="text" value="{$question.answer|number($question.num)|wash('xhtml')}" />
</div>