{* Course org - Full view *}

{def $courses=array()
     $folders=array()}


<script type="text/javascript">
    $.include({"stylesheets/common.css"|ezdesign});
</script>

{scuolapagedata_set( 'left_menu', true() )}
{scuolapagedata_set( 'left_nav_menu', true() )}
{scuolapagedata_set( 'extra_menu', true() )}

<div class="border-box">
    {def $user=fetch( 'user', 'current_user' )}
    
     <div class="content-view-full">
        <div class="class-course_org">
            <div class="attribute-header">
                 <h1>{$node.name|wash()}</h1>
             </div>

            {if $node.object.data_map.short_description.has_content}
            <div class="attribute-short">{attribute_view_gui attribute=$node.object.data_map.short_description}</div>
            {/if}


        

            {if eq($user.login,'anonymous')}
                <div id="subscription_reminder">
                    <p> {"Per poterti registrare dei effettuare il login"|i18n("msubscription/design/course")}</p>
                </div>
            {else}

          {set $folders = fetch( 'content', 'list', hash('parent_node_id', $node.node_id,
                                              'offset', $view_parameters.offset,
                                              'sort_by', $node.sort_array,
                                              'class_filter_type', 'include',
                                              'class_filter_array', array('folder')))}

          <div class="content-view-children">
                {foreach $folders as $folder }
                  {node_view_gui view=line content_node=$folder}
                {/foreach}
          </div>
            
                                             
         <h4>{'Esami e Corsi:'|i18n('msubscription/courses')}</h4>  
          {set $courses = fetch( 'content', 'list', hash('parent_node_id', $node.node_id,
                                              'offset', $view_parameters.offset,
                                              'sort_by', $node.sort_array,
                                              'class_filter_type', 'include',
                                              'class_filter_array', array('course')))}

            <div class="content-view-children">
                {foreach $courses as $course }
                  {node_view_gui view=line content_node=$course}
                {/foreach}
            </div>


            {/if}

          

        </div>
    </div>

</div>