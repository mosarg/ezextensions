{ezcss_load( array( 'core.css',
                       'debug.css',
                       'pagelayout.css',
                       'content.css',
                       'websitetoolbar.css',
                       'dropdown.css',
                       ezini( 'StylesheetSettings', 'CSSFileList', 'design.ini' )))}
<link rel="stylesheet" type="text/css" href={"stylesheets/print.css"|ezdesign} media="print" />


<!-- IE conditional comments; for bug fixes for different IE versions -->

<!--[if lte IE 8]> <style type="text/css"> @import url({"stylesheets/browsers/ie7fix.css"|ezdesign(no)}); </style> <![endif]-->
<!--[if IE 5]>     <style type="text/css"> @import url({"stylesheets/browsers/ie5.css"|ezdesign(no)});    </style> <![endif]-->
<!--[if lte IE 7]> <style type="text/css"> @import url({"stylesheets/browsers/ie7lte.css"|ezdesign(no)}); </style> <![endif]-->