{*dms folder - embed view *}
    <div class="content-view-embed">
    <div class="class-dmsfolder">
            
        

        {def $page_limit = 10
                 $files=array()
                 $files_count=''}
                 {set $files=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', array('file','image'),
                                                          'limit', $page_limit ) )
                      $files_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
                                                                      'class_filter_type', 'include',
                                                                      'class_filter_array',array('file','image') ) )}


 
          {if $files_count|gt(0)}
                 <div class="content-view-children">
                        {foreach $files as $file }
                            {node_view_gui view=line content_node=$file}
                        {/foreach}
                </div>
                    {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     node_id=$node.node_id
                     box_type='content-view-embed'
                     view_type='embed'
                     item_count=$files_count
                     view_parameters=$view_parameters
                     item_limit=$page_limit}       
    
                </div>
        {else}
        <h3>{"Nessun documento presente"|i18n('scuola/notice')}</h3>
        {/if}
</div>
  {undef}
