{* Gallery - Full view *}
{scuolapagedata_set( 'left_menu', true() )}
{scuolapagedata_set( 'left_nav_menu', true() )}
{scuolapagedata_set( 'extra_menu', false() )}

<div class="border-box">

<div class="content-view-full">
    <div class="class-gallery">

        <div class="attribute-header">
            <h1>{$node.name|wash()}</h1>
        </div>

        <div class="attribute-short">
           {attribute_view_gui attribute=$node.data_map.short_description}
        </div>

        <div class="attribute-long">
           {attribute_view_gui attribute=$node.data_map.description}
        </div>

        {if $node.data_map.show_sub_gal}
            {def $child_gallery=fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                         'offset', $view_parameters.offset,
                                                         'class_filter_type', 'include',
                                                         'class_filter_array', array( 'gallery' ),
                                                         'sort_by',array('attribute',false(),'gallery/syear') ) )
                 $child_gallery_count=$child_gallery|count()}
          {if $child_gallery_count}
            <div class="content-view-children">


            {def $syear='-1'}
            {foreach $child_gallery as $gallery}
                {if ne($gallery.data_map.syear.value[0],$syear)}
                    <h4 class="school-year rounded">{$gallery.data_map.syear.class_content.options[$gallery.data_map.syear.value[0]].name}</h4>
                    {set $syear=$gallery.data_map.syear.value[0]}
                    
                {/if}
                    {node_view_gui view=line content_node=$gallery style=big}
            {/foreach}

            </div>
          {/if}

        {/if}



        {def $page_limit=12
             $children = fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                         'offset', $view_parameters.offset,
                                                         'limit', $page_limit,
                                                         'class_filter_type', 'include',
                                                         'class_filter_array', array( 'image','flash_player'),
                                                         'sort_by', $node.sort_array ) )
             $children_count = $children|count()}


        {if ge($children_count,1)}
            <div class="attribute-link">
                <p>
                <a href={$children[0].url_alias|ezurl}>{'Guarda i contenuti in sequenza'|i18n( 'design/scuola/full/gallery' )}</a>
                </p>
            </div>

           <div class="content-view-children">
               {def $filters = ezini( 'gallerythumbnail', 'Filters', 'image.ini' )}
               
                {foreach $filters as $filter}
                   {if or($filter|contains( "geometry/scale" ), $filter|contains( "geometry/scaledownonly" ), $filter|contains( "geometry/crop" ) )}
                      {def $image_style = $filter|explode("=").1}
                      {set $image_style = concat("width:", $image_style|explode(";").0, "px ;", "height:", $image_style|explode(";").1, "px")}
                      {break}
                   {/if}
                {/foreach}
           
               {foreach $children as $child}
                   {node_view_gui view=galleryline content_node=$child}
               {/foreach}

           </div>
        {/if}

        {include name=navigator
                 uri='design:navigator/google.tpl'
                 page_uri=$node.url_alias
                 item_count=$children_count
                 view_parameters=$view_parameters
                 item_limit=$page_limit}
    </div>
</div>
</div>