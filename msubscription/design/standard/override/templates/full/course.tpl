{* Course - Full view *}


<script type="text/javascript">
    $.include({"stylesheets/common.css"|ezdesign});
</script>

{run-once}
{ezscript_require( array( concat( 'ezjsc::', 'jqueryio' ),'classes/jquery-ui-min.js','classes/subscription.js','init_subscription.js' ) )}
{/run-once}




{scuolapagedata_set( 'left_menu', true() )}
{scuolapagedata_set( 'left_nav_menu', true() )}
{scuolapagedata_set( 'extra_menu', false() )}
<div class="border-box">
    {def $user=fetch( 'user', 'current_user' )}
    
     <div class="content-view-full">
        <div class="class-course">
            <div class="attribute-header">
                {if $node.data_map.title.has_content}
                <h1>{$node.data_map.title.content|wash()}</h1>
                {else}
                <h1>{$node.name|wash()}</h1>
                {/if}
            </div>


            


            {if $node.object.data_map.text.has_content}
            <div class="attribute-short">{attribute_view_gui attribute=$node.object.data_map.text}</div>
            {/if}


            <span class="stop_registration"> {"Le registrazioni sono aperte fino al"|i18n("msubscription/design/course")} {$node.object.data_map.stop_subscription.content.timestamp|datetime(custom,"%j %F")}</span>

            {if eq($user.login,'anonymous')}
                <div id="subscription_reminder">
                    <p> {"Per registrarti al corso devi effettuare il login"|i18n("msubscription/design/course")}</p>
                </div>
            {/if}


            <div id="subscription"></div>
            <div id="config" style="visibility:hidden">
                <p title="object_id">{$node.contentobject_id}</p>
                <p title="user_login">{$user.login}</p>
                <p title="can_edit">{$node.can_edit}</p>
                <p title="max_subscribers">{$node.data_map.max_subscribers.content}</p>
                <p title="subscription_state">{"Stato Iscrizione:"|i18n("msubscription/design/course")}</p>
                <p title="subscribed_users">{"Numero di iscritti:"|i18n("msubscription/design/course")}</p>
                <p title="available_exams">{attribute_view_gui attribute=$node.data_map.available_exams}</p>
                <p title="module_url">{"subscriptions"|ezurl(no)}</p>
            </div>

        </div>
    </div>

</div>