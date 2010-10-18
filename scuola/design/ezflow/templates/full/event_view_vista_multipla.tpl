{scuolapagedata_set( 'left_menu', true() )}
{scuolapagedata_set( 'left_nav_menu', true() )}
{scuolapagedata_set( 'extra_menu', false() )}

{if is_set($view_parameters.view)}
    {switch  match=$view_parameters.view}
        {case match='week'}
            {include uri='design:parts/calendar/event_view_calendario_weekview.tpl'}
        {/case}
        {case match='month'}
            {include uri='design:parts/calendar/event_view_calendario_monthview.tpl'}
        {/case}

        {/switch}

{else}
    {include uri='design:parts/calendar/event_view_calendario_monthview.tpl'}
{/if}