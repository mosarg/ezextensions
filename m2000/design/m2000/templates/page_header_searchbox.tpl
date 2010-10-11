<div id="searchbox">
    <div id="search-form">
    <form id="search-input" action={"/content/search"|ezurl} >
    <label for="searchtext" class="hide">{'Search text:'|i18n('scuola/pagelayout')}</label>
    {if $pagedata.is_edit}
    <input id="searchtext" name="SearchText" type="text" value="" size="12" disabled="disabled" />
    <input id="searchbutton" class="button-disabled" type="submit" value="{'Search'|i18n('scuola/pagelayout')}" alt="{'Search'|i18n('scuola/pagelayout')}" disabled="disabled" />
    {else}
    <input id="searchtext" name="SearchText" type="text" value="" size="12" />
    <input id="searchbutton" class="button" type="submit" value="{'Search'|i18n('scuola/pagelayout')}" alt="{'Search'|i18n('scuola/pagelayout')}" />
        {if eq( $ui_context, 'browse' )}
         <input name="Mode" type="hidden" value="browse" />
        {/if}
    {/if}
  </form>
    </div>

  {include uri='design:page_header_languages.tpl'}

  </div>