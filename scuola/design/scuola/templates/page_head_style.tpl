<style type="text/css">
    @import url({"stylesheets/core.css"|ezdesign(no)});
    <!--@import url({"stylesheets/debug.css"|ezdesign(no)});-->
    @import url({"stylesheets/pagelayout.css"|ezdesign(no)});
    @import url({"stylesheets/content.css"|ezdesign(no)});
    @import url({"stylesheets/websitetoolbar.css"|ezdesign(no)});
     
    {foreach ezini( 'StylesheetSettings', 'CSSFileList', 'design.ini' ) as $css_file}
    @import url({concat( 'stylesheets/', $css_file )|ezdesign});
    {/foreach}
   
</style>
<link rel="stylesheet" type="text/css" href={"stylesheets/print.css"|ezdesign} media="print" />

