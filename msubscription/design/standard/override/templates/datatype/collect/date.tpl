{def $attribute_base=ContentObjectAttribute}

<label>{'Anno'|i18n( 'msubscription/design/datatype' )}:
<input type="text" id="year"  name="{$attribute_base}_date_year_{$attribute.id}" size="5"  />
</label>
<label>{'Mese'|i18n( 'msubscription/design/datatype' )}:
<input type="text" id="month" name="{$attribute_base}_date_month_{$attribute.id}" size="3" />
</label>
<label>{'Giorno'|i18n( 'msubscription/design/datatype' )}:
<input type="text" id="day" name="{$attribute_base}_date_day_{$attribute.id}" size="3" />
</label>


{undef}

