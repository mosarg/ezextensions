{* Course - line view *}
   
     <div class="content-view-line ">
        <div class="class-course rounded">
            <div class="attribute-header">
                 <h4>{$node.name|wash()}</h4>
                 <span class="stop_registration"> {"Data Esame:"|i18n("msubscription/design/course")} {$node.object.data_map.stop_subscription.content.timestamp|datetime(custom,"%j %F")}</span>
                 <a href={$node.url_alias|ezurl}><img src={"images/subscribe.png"|ezdesign}</a>
            </div>

        </div>
    </div>

