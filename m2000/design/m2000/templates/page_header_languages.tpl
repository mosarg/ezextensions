<div id="languages">
    <ul>
    {def $avail_translation = language_switcher( $site.uri.original_uri)}
  
    {foreach $avail_translation as $siteaccess => $lang}
             <li{if $siteaccess|eq($access_type.name)} class="current_siteaccess"{/if}><a href={$lang.url|ezurl}>{$lang.text|wash}</a></li>
    {/foreach}
    </ul>
</div>