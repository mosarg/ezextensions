<div class="block-type-online-users block-view-{$block.view} oldborder1">

<div class="attribute-header"><h2>{$block.name|wash()}</h2></div>

{def $logged_in_count = fetch( 'user', 'logged_in_count' )}
{'There are currently %logged_in_count active users on the system.'|i18n( 'design/ezflow/block/online_users', , hash( '%logged_in_count', concat( '<span id="logged-in-count-', $block.id, '">', $logged_in_count, '</span>' ) ) )}

<br />
{def $anonymous_count = fetch( 'user', 'anonymous_count' )}
{'There are %anonymous_count anonymous users accessing the site.'|i18n( 'design/ezflow/block/online_users', , hash( '%anonymous_count', concat( '<span id="anonymous-count-', $block.id, '">', $anonymous_count, '</span>' ) ) )}

</div>

{ezscript_require( array( 'ezjsc::yui3', 'ezjsc::yui3io' ) )}

<script type="text/javascript">
<!--
{literal}
(function() {
YUI(YUI3_config).use('node', 'event', 'io-ez', function(Y) {
    function ioCallBack( id, o )
    {
        if ( o.responseJSON !== undefined )
        {
            var response = o.responseJSON;

            if ( response.content !== undefined ) {
{/literal}
                Y.get( '#logged-in-count-{$block.id}' ).set( 'innerHTML', response.content.logged_in_count );
                Y.get( '#anonymous-count-{$block.id}' ).set( 'innerHTML', response.content.anonymous_count );
{literal}
            }
        }
    }
    Y.io.ez( 'ezflow::onlineusers', { on: { success: ioCallBack } } );
});

})();
{/literal}
-->
</script>