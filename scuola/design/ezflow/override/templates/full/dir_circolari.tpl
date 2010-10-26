{* dir circolari - Full view *}
{scuolapagedata_set( 'left_menu', false() )}
{if $node.object.data_map.show_extrainfo.data_int}
    {scuolapagedata_set( 'extra_menu', true() )}
{else}
    {scuolapagedata_set( 'extra_menu', false() )}
{/if}


<div class="border-box">
<div class="content-view-full">
    <div class="class-dir_circolari">

        <div class="attribute-header">
            <h1>{$node.name|wash}</h1>
        </div>
             
            {if $node.object.data_map.short_description.has_content}
                <div class="attribute-short">
                    {attribute_view_gui attribute=$node.data_map.short_description}
                </div>
            {/if}

    
            {def $classes =array('folder_circolari')
                 $children = array()
                }
                
             {set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $classes ) )}

            {if gt($children|count,0)}
             <div class="content-view-children">
                 <h4>{"Elementi correlati"|i18n('scuola/folder/line')}</h4>
                {foreach $children as $child }
                    {node_view_gui view='folder_circolari_icon' content_node=$child}
                {/foreach}
            </div>
            {/if}

            <a href="{concat($node.url_alias|ezurl(no),'/(show_list)/',true())}">Mostra tutte le circolari</a>
            
            {if is_set($view_parameters.show_list)}
                {def $circolari = fetch( 'content', 'list',
                                         hash('parent_node_id', $node.node_id,
                                              'sort_by', array('name',false()),
                                              'depth',2,
                                              'limit',50,
                                              'class_filter_type','include',
                                              'class_filter_array',array('file')))}
                {foreach $circolari as $circolare}
                    {node_view_gui view=line content_node=$circolare}
                {/foreach}
            {undef $circolari}
            {/if}
            


    </div>
</div>
</div>