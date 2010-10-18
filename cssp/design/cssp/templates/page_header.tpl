<div id="header-position">
    <div id="header" class="float-break">
        <div id="upper_bar">
            <div id="logo">
                {include uri='design:page_header_logo.tpl'}
            </div>
            <div id="user_links">
                {include uri='design:page_header_links.tpl'}
            </div>
            <div id="rss_feed">
                {include uri='design:page_header_feeds.tpl'}
            </div>
            <div id="login_form">
                  {include uri='design:page_header_login.tpl'}
            </div>
        </div>
        <div id="middle_bar" >
              {include uri='design:menu/top_school.tpl'}

               {if $pagedata.show_path}
                {include uri='design:page_toppath.tpl'}
             {/if}
        </div>
        <p class="hide"><a href="#main">{'Skip to main content'|i18n('design/ezwebin/pagelayout')}</a></p>
    </div>
</div>