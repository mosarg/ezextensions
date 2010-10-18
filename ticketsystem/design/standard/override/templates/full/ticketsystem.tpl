
{set-block scope=root variable=cache_ttl}0{/set-block}

{mpagedata_set( 'left_menu', true() )}
{mpagedata_set( 'left_nav_menu', false() )}
{mpagedata_set( 'extra_menu', false() )}


{run-once}
{ezscript_require( array( concat( 'ezjsc::', 'jqueryio' ),'classes/jquery-ui-min.js',
            'classes/ticketsystem.js','init_ticketsystem.js'))}
{/run-once}


{if is_set($view_parameters.state)}
    {def $selected_states=$view_parameters.state|trim(',')|explode( ',' )}
{else}
    {def $selected_states = array(0,1,2,3,4,5,6)}
{/if}
{if is_set($view_parameters.creator)}
    {def $selected_creator = $view_parameters.creator|trim(',')|explode( ',' )}
    {if $selected_creator|contains(0)}
        {set $selected_creator = array(0)}
    {/if}
{else}
    {def $selected_creator = array(0)}
{/if}

{def $selected_sort_by=array()}

{if is_set($view_parameters.sort_direction)}
    {def $selected_sort_direction=true()}
{else}
    {def $selected_sort_direction=false()}
{/if}


{if is_set($view_parameters.sort_by)}


{switch match=$view_parameters.sort_by}

{case match='state'}
    {set $selected_sort_by = array( array( 'attribute', $selected_sort_direction, 'ticket/state' ))}
{/case}
{case match='owner'}
   {set $selected_sort_by = array(array( 'owner_id', $selected_sort_direction))}
{/case}

{case match='published'}
   {set $selected_sort_by = array( array( 'published', $selected_sort_direction))}
{/case}

{case match='name'}
   {set $selected_sort_by = array(array( 'name', $selected_sort_direction ))}
{/case}
{case match='project'}
   {set $selected_sort_by = array(array( 'attribute', $selected_sort_direction, 'ticket/project' ))}
{/case}

{case match='priority'}
   {set $selected_sort_by = array(array( 'attribute', $selected_sort_direction, 'ticket/priority'))}
{/case}
{case}
   {set $selected_sort_by = array(array( 'attribute', false(), 'ticket/priority' ),array( 'published', true()))}
{/case}

{/switch}
{else}
    {set $selected_sort_by = array(array( 'attribute', false(), 'ticket/priority' ),array( 'published', true()))}
{/if}



{def $item_type=ezpreference( 'admin_list_limit' )
     $number_of_items=min( $item_type, 3)|choose( 10, 10, 25, 50 )
     $can_remove=false()
     $can_edit=false()
     $can_create=false()
     $can_copy=false()
     $attribute_filter= array()
     $children_count=$node.children_count}
{if $selected_states}
        {set $attribute_filter=$attribute_filter|append( array( 'ticket/state', 'in', $selected_states ) )}
{/if}

{if and($selected_creator, $selected_creator|contains(0)|not )}
        {set $attribute_filter=$attribute_filter|append( array( 'owner', 'in', $selected_creator ) )}
{/if}



{def $user=fetch(user, current_user)
     $user_roles=array()}


{def $roles=fetch( 'user', 'member_of', hash( 'id', $user.contentobject_id))}

{foreach $roles as $role}
    {set $user_roles=$user_roles|append($role.name)} <br />
{/foreach}
<div class="content-view-full">

    {if $user.is_logged_in}
    <div class="class-ticketsystem">

    {attribute_view_gui attribute=$node.data_map.description}

{if $user_roles|contains('Help Desk')}

    {include uri='design:ticketsystem/ticketsystem_helpdesk.tpl'}

{else}

    {include uri='design:ticketsystem/ticketsystem_users.tpl'}
{/if}
   

    </div>
    {else}
    <div class="class-ticketsystem">
    Per accedere al sistema di notifica devi effettuare il login
    </div>
    {/if}

    {def $ticket_class=fetch( 'class', 'list', hash( 'class_filter', array( 'ticket')))}
    
    <div id="config-ticket-system" style="visibility:hidden">
        <p title="node_id">{$node.node_id}</p>
        <p title="object_id">{$node.object.id}</p>
        <p title="current_user_name">{$user.contentobject.name}</p>
        <p title="state_options">{$ticket_class[0].data_map.state.content.options|json_encode()}</p>
     </div>
{undef}
</div>