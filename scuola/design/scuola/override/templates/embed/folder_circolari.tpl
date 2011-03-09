{* folder circolari - Embed view *}

<div class="content-view-embed">
    <div class="class-folder_circolari">

{if is_set($view_parameters.depth)}
    {def $depth=$view_parameters.depth}
{else}
    {def $depth=1}
{/if}        

{if $node.object.state_id_array|contains('6')}
        <div class="wip">
            <p>{"Contenuto in preparazione non ancora visibile pubblicamente"|i18n('scuola/state')}</p>
        </div>
        {/if}
{def $page_limit = 10
     $circolari = array()
     $circolari_count = 0
     $uniq_id = 0
     $uniq_post = array()}


{set $circolari = fetch( 'content', 'list', hash('parent_node_id', $node.node_id,
                                                 'offset', $view_parameters.offset,
                                                 'sort_by', $node.sort_array,
                                                 'depth',$depth,
                                                 'class_filter_type', 'include',
                                                 'class_filter_array',array('file'),
                                                 'limit', $page_limit))
     $circolari_count=fetch( 'content', 'list_count', hash( 'parent_node_id', $node.node_id
                                                            'depth',$depth,
                                                            'class_filter_type', 'include',
                                                            'class_filter_array',array('file')))}

         <div class="content-view-children">
            {foreach $circolari as $circolare}
                {node_view_gui view=line content_node=$circolare extra_info=true()}
            {/foreach}
         </div>


            {include name=navigator
                     uri='design:navigator/google.tpl'
                     page_uri=$node.url_alias
                     node_id=$node.node_id
                     box_type='content-view-embed'
                     view_type='view/embed'
                     depth=$depth
                     item_count=$circolari_count
                     view_parameters=$view_parameters
                     item_limit=$page_limit}   
    </div>
</div>
