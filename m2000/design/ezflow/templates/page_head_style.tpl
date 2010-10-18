<style type="text/css">
    @import url({"stylesheets/dropdown.css"|ezdesign(no)});
    @import url({"stylesheets/core.css"|ezdesign(no)});
    @import url({"stylesheets/pagelayout.css"|ezdesign(no)});
    @import url({"stylesheets/content.css"|ezdesign(no)});
    @import url({"stylesheets/websitetoolbar.css"|ezdesign(no)});
    {foreach ezini( 'StylesheetSettings', 'CSSFileList', 'design.ini' ) as $css_file}
    @import url({concat( 'stylesheets/', $css_file )|ezdesign});
    {/foreach}
     <!--@import url({"stylesheets/debug.css"|ezdesign(no)});-->
</style>
<link rel="stylesheet" type="text/css" href={"stylesheets/print.css"|ezdesign} media="print" />

<!-- IE conditional comments; for bug fixes for different IE versions -->

<!--[if lte IE 8]> <style type="text/css"> @import url({"stylesheets/browsers/ie7fix.css"|ezdesign(no)}); </style> <![endif]-->
<!--[if IE 5]>     <style type="text/css"> @import url({"stylesheets/browsers/ie5.css"|ezdesign(no)});    </style> <![endif]-->
<!--[if lte IE 7]> <style type="text/css"> @import url({"stylesheets/browsers/ie7lte.css"|ezdesign(no)}); </style> <![endif]-->