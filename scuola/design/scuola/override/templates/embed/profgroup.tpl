{* Selezione insegnanti - Embed view *}

{include uri='design:parts/global_variables.tpl' left_menu=false() left_nav_menu=false() extra_menu=false()}


{def $equivalentSchools=ezini( 'EquivalentSchools','School','scuola.ini')
     $parentNodeName=$node.parent.path_identification_string}

{if is_set($equivalentSchools[$parentNodeName])}
    {set $parentNodeName=$equivalentSchools[$parentNodeName]}
{/if}




<div class="content-view-embed">
    <div class="class-profgroup">
        {def     $classes = array( 'proffolder' )
                 $info_obj=array()
                 $materiaT=array()
                 $page_limit=10}
        
   {if is_set($view_parameters.subject)}

   
    {run-once}
        {def $teachers=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'attribute_filter',array(array('proffolder/materie',
                                                                                          'like',
                                                                                          concat('*',$view_parameters.subject,'*'))),
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $classes) )
               $teachers_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
                                                                    'attribute_filter',array(array('proffolder/materie',
                                                                                          'like',
                                                                                          concat('*',$view_parameters.subject,'*'))),
                                                                    'class_filter_type', 'include',
                                                                    'class_filter_array',$classes ) )}
                                       
    {/run-once}
    
    {if $teachers_count|gt(0)}
   <div class="content-view-children">
                {foreach $teachers as $teacher  }
                              
                                {node_view_gui view='line' content_node=$teacher}
                      
                {/foreach}
                    
             
    </div>
         {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     node_id=$node.node_id
                     box_type='content-view-embed'
                     depth=1
                     view_type='view/embed'
                     item_count=$teachers_count
                     view_parameters=$view_parameters
                     item_limit=$page_limit}
                     
                     {else}
                      <h3>{"Nessun docente attivo per questa materia"|i18n('scuola/notice')}</h3>
                      {/if}

            {else}
       {run-once}
        {def $teachers=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $classes,
                                                          'limit', $page_limit) )
         $teachers_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
                                                              'class_filter_type', 'include',
                                                              'class_filter_array',$classes ) )}                                                   
       {/run-once}
    <div class="content-view-children">
             
                {foreach $teachers as $teacher }
                       {node_view_gui view='line' content_node=$teacher}
                {/foreach}
        
     </div>
            
     {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     node_id=$node.node_id
                     box_type='content-view-embed'
                     depth=1
                     view_type='view/embed'
                     item_count=$teachers_count
                     view_parameters=$view_parameters
                     item_limit=$page_limit}              
            {/if}
   
    </div>
</div>

<div class="facelet_elements" style="display:none">
          <p title="view_parameters">{$view_parameters|json_encode()}</p>
</div> 
{undef}

