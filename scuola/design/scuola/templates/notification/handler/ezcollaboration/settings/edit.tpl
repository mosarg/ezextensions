{def $approval_handlers=$handler.collaboration_handlers
     $selection=$handler.collaboration_selections}
<div class="contentheader">
    <h2>{"Collaboration notification"|i18n("design/standard/notification/collaboration")}</h2>
</div>
<p>{"Choose which collaboration items you want to get notifications for."|i18n("design/standard/notification/collaboration")}</p>

<input type="hidden" name="CollaborationHandlerSelection" value="1" />
<table border="0" cellspacing="0" cellpadding="0">
{def $types=''}
{foreach $approval_handlers as $app_handler}
    {set $types=$app_handler.notification_types}
        {if or($types,$types|gt(0))}
            {if is_array($types)}
                <tr>
                    <td colspan="2">
                        {$app_handler.info.type-name|wash}
                    </td>
                </tr>
                {foreach $types as $type}
                    <tr>
                        <td>
                              <input type="checkbox" name="CollaborationHandlerSelection_{$approval_handlers.id_string}[]"
                                                     value="{$app_handler.info.type-identifier}_{$type.value}"
            {if $selection|contains(concat($app_handler.info.type-identifier,'_',$type.value))}checked="checked"{/if}/>
                        </td>
                        <td>
                            {$type.name|wash}
                        </td>
                    </tr>
                {/foreach}
            {else}
                <tr>
                    <td>
                          <input type="checkbox" name="CollaborationHandlerSelection_{$handler.id_string}[]"
                                                 value="{$app_handler.info.type-identifier}"
   {if $selection|contains($app_handler.info.type-identifier)}checked="checked"{/if} />
                    </td>
                    <td>
                    {$app_handler.info.type-name|wash}
                    </td>
                </tr>
            {/if}

        {else}

        {/if}

{/foreach}
   
</table>
{undef}