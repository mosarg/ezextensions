<div id="header-position">
    <div id="header" class="float-break">
        {include uri='design:page_header_searchbox.tpl'}

        

        <div id="user_links">
            {include uri='design:page_header_links.tpl'}
        </div>
        
        {if $pagedesign.data_map.image.has_content}
         <div id="logo2">
            <img src={$pagedesign.data_map.image.content[scuola].url|ezurl} alt="logo2"/>
            <p>Istituto Statale d'Istruzione Superiore</p>
        </div>
        {/if}
        {include uri='design:page_header_logo.tpl'}

        <div id="school_menu" >
            <!--start top school include-->
            {include uri='design:menu/top_school.tpl'}
            <!--end top school include-->
        </div>
        <p class="hide"><a href="#main">{'Skip to main content'|i18n('design/ezwebin/pagelayout')}</a></p>
    </div>
</div>