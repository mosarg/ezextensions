{if is_set($attribute_base)|not}{def $attribute_base='ContentObjectAttribute'}{/if}
{def $value=cond( is_set( $#collection_attributes[$attribute.id] ), $#collection_attributes[$attribute.id].content, $attribute.content )
    $date=currentdate()
	$byear=$date|datetime(custom,"%Y")}
<div class="block">
    <div class="date element">
        <label >{"A:"|i18n("design/msubscription/birthdate")}</label><div class="labelbreak"></div>
        <select id="year" name="{$attribute_base}_birthday_year_{$attribute.id}" title="{"Please enter the year"|i18n("design/standard/content/datatype")}">
            <option value=""></option>
        {for sub($byear,100) to $byear as $i}
             <option value="{$i}">{$i}</option>
        {/for}
        </select>
    </div>

    <div class="date element">
        <label >{"M:"|i18n("design/msubscription/birthdate")}</label><div class="labelbreak"></div>
        <select id="month" name="{$attribute_base}_birthday_month_{$attribute.id}" title="{"Please enter the month"|i18n("design/standard/content/datatype")}">
            <option value=""></option>
        {for 1 to 12 as $i}
            <option value="{$i}" >{$i}</option>
        {/for}
        </select>
    </div>

    <div class="date element">
        <label >{"G:"|i18n("design/msubscription/birthdate")}</label><div class="labelbreak"></div>
         <select id="day" name="{$attribute_base}_birthday_day_{$attribute.id}" title="{"Please enter the day"|i18n("design/standard/content/datatype")}">
            <option value=""></option>
        {for 1 to 31 as $i}
            <option value="{$i}" >{$i}</option>
        {/for}
        </select>
    </div>
</div>
<div class="break"></div>