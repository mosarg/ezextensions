  <!-- Footer area: START -->
  <div id="footer">
  <div id="page-width7">
{if $pagedesign.data_map.logo.has_content}
<img alt="logo" src={$pagedesign.data_map.logo.content[infoboximage].url|ezroot}/>
{/if}

<address>
{if $pagedesign.data_map.footer_text.has_content}
      {$pagedesign.data_map.footer_text.content} 
{/if}
</address>
<p>
    <a href="http://validator.w3.org/check?uri=referer"><img
        src="http://www.w3.org/Icons/valid-xhtml10"
        alt="Valid XHTML 1.0 Transitional" height="31" width="88" /></a>
  </p>

</div>
 
  
</div>
  <!-- Footer area: END -->