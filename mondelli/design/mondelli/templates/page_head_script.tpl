{* Load JavaScript dependencys + JavaScriptList *}
{ezscript_load( array( ezini( 'JavaScriptSettings', 'JavaScriptList', 'design.ini' ), ezini( 'JavaScriptSettings', 'FrontendJavaScriptList', 'design.ini' ) ) )}
{* load google api loader *}

{def $GMapsKeyHost=ezini( 'SiteSettings', 'GMapsKeyHost', 'site.ini' )}
<script type="text/javascript" src="http://www.google.com/jsapi?key={$GMapsKeyHost[ezsys('hostname')]}"></script>
<script type="text/javascript" charset="utf-8">
    google.load("maps", "2.x");
</script>
<!--[if IE]> <script type="text/javascript" src={'javascript/init_iesucks.js'|ezdesign} ></script><![endif]-->