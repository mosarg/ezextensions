{ezpagedata_set( 'left_menu', false() )}
{ezpagedata_set( 'no_class_menu', true() )}
{ezpagedata_set( 'no_prof_menu', true() )}


<div class="border-box">
<div class="notification-settings">

<form name="notification" method="post" action={"/notification/settings/"|ezurl}>

<div class="attribute-header">
    <h1 class="long">{'Notification settings'|i18n( 'design/ezwebin/notification/settings' )}</h1>
</div>


{def $notification_handlers=fetch( 'notification', 'handler_list' )}
    
    {foreach $notification_handlers as $handler}

        {if eq( $handler.id_string,'ezsubtree' )}
            {skip}
        {/if}
        {include handler=$handler uri=concat( 'design:notification/handler/', $handler.id_string, '/settings/edit.tpl' )}
  
        {/foreach}


<input class="button" type="submit" name="Store" value="{'Apply changes'|i18n('design/ezwebin/notification/settings')}" />

<br />

{include handler=$notification_handlers.ezsubtree view_parameters=$view_parameters uri=concat( 'design:notification/handler/', $notification_handlers.ezsubtree.id_string, '/settings/edit.tpl' )}

</form>


</div>

</div>
{undef}