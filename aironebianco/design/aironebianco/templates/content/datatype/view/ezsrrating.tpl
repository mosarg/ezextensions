{def $rating = $attribute.content}


{run-once}
{ezcss_require( 'star_rating.css' )}
{if has_access_to_limitation( 'ezjscore', 'call', hash( 'FunctionList', 'ezstarrating_rate' ) )}
      {ezscript_require('init_starrating.js' )}
{/if}
{/run-once}

<ul id="ezsr_rating_{$attribute.id}" class="ezsr-star-rating">
   <li id="ezsr_rating_percent_{$attribute.id}" class="ezsr-current-rating" style="width:{$rating.rounded_average|div(5)|mul(100)}%;">{'Currently %current_rating out of 5 Stars.'|i18n('extension/ezstarrating/datatype', '', hash( '%current_rating', concat('<span>', $rating.rounded_average|wash, '</span>') ))}</li>
   {for 1 to 5 as $num}
       <li><a href="JavaScript:void(0);" id="ezsr_{$attribute.id}_{$attribute.version}_{$num}" title="{'Rate %rating stars out of 5'|i18n('extension/ezstarrating/datatype', '', hash( '%rating', $num ))}" class="ezsr-stars-{$num}" rel="nofollow" onfocus="this.blur();">{$num}</a></li>
   {/for}
</ul>

{'Rating: %current_rating/5'|i18n('extension/ezstarrating/datatype', '', hash( '%current_rating', concat('<span id="ezsr_average_', $attribute.id, '" class="ezsr-average-rating">', $rating.rounded_average|wash, '</span>') ))}
({'%rating_count votes cast'|i18n('extension/ezstarrating/datatype', '', hash( '%rating_count', concat('<span id="ezsr_total_', $attribute.id, '">', $rating.rating_count|wash, '</span>') ))}) 
<p id="ezsr_just_rated_{$attribute.id}" class="ezsr-just-rated hide">{'Thank you for rating!'|i18n('extension/ezstarrating/datatype', 'When rating')}</p>
<p id="ezsr_has_rated_{$attribute.id}" class="ezsr-has-rated hide">{'You have already rated this page, you can only rate it once!'|i18n('extension/ezstarrating/datatype', 'When rating')}</p>
<p id="ezsr_changed_rating_{$attribute.id}" class="ezsr-changed-rating hide">{'Your rating has been changed, thanks for rating!'|i18n('extension/ezstarrating/datatype', 'When rating')}</p>


{undef $rating}
