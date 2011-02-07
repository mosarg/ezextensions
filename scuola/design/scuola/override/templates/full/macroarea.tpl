{* Macroarea - Full view *}


{if $node.object.data_map.show_menu.data_int}
    {include uri='design:parts/global_variables.tpl' left_menu=true() left_nav_menu=true()}
{else}
    {include uri='design:parts/global_variables.tpl' left_menu=false() left_nav_menu=false()}
{/if}

<div class="content-view-full">
    <div class="class-macroarea">

    {if is_set($node.object.data_map.descrizione)}
        <div class="custom-content">
            {attribute_view_gui attribute=$node.object.data_map.descrizione}
        </div>
    {/if}

       {if $node.data_map.page.has_content}
        <div class="attribute-page">
            {attribute_view_gui attribute=$node.object.data_map.page}
        </div>
       {/if}

    {if $node.data_map.show_children.data_int}


    {def         $children = array()
                 $children_count = ''
                 $counter=0
                 $classes=array('macroarea')}

    {set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $classes))
          $children_count=$children|count}





   {if gt($children_count,0)}

    {foreach $children as $child }
    {set $counter=inc($counter)}
    <div class="macro_block">
                    <a href={$child.url_alias|ezurl}>
                    <img class="shadowmacro" src={$child.data_map.logo.content[gallerythumbnail].url|ezroot}   alt="logo"/></a>
        <h2>           <a href={$child.url_alias|ezurl}>
                       {$child.name|shorten(40)}
                    </a>
        </h2>
    </div>
    {if eq(mod($counter,4),0)}
    <br class="break"/>
    {/if}
    {/foreach}

    {else}

    {set $classes=array('article','article_mainpage','folder','file')}
    {def $elements=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $classes) )
           $elements_count=$elements|count}
                      {if ge($elements_count,1)}
   <div class="content-view-children">
                {foreach $elements as $element }
                  {node_view_gui view=line content_node=$element}
                {/foreach}
            </div>
    {/if}


    {/if}
{/if}

    </div>
</div>
{undef}