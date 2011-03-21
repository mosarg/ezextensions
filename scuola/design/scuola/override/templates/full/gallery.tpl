{* Gallery - Full view *}

{include uri='design:parts/global_variables.tpl' left_menu=false() left_nav_menu=false()}


{run-once}
{ezcss_require(array('javascript/gallery.css'))}
{ezscript_require( array('classes/jquery.galleriffic.js','classes/jquery.history.js',
'classes/jquery.opacityrollover.js','classes/jush.js','init_gallery.js' ))}
{/run-once}



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

       {if $node.data_map.show_sub_gal.content}

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
                    <h4 class="school-year">{$gallery.data_map.syear.class_content.options[$gallery.data_map.syear.value[0]].name}</h4>
                    {set $syear=$gallery.data_map.syear.value[0]}
                    
                {/if}
                    {node_view_gui view=line content_node=$gallery style=big}
            {/foreach}

            </div>
          {/if}

        {else}



        {def $page_limit=30
             $children = fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                         'offset', $view_parameters.offset,
                                                         'limit', $page_limit,
                                                         'class_filter_type', 'include',
                                                         'class_filter_array', array( 'image','flash_player'),
                                                         'sort_by', $node.sort_array ) )
             $children_count = $children|count()}


        {if ge($children_count,1)}
           
           <div id="thumbs" class="content-view-children navigation">

               <ul class="thumbs noscript">
                          
               {foreach $children as $child}
               <li>
                   {node_view_gui view=galleryline content_node=$child}
               </li>
               {/foreach}
               </ul>
           </div>

        
        {/if}

        <div id="gallery" class="content">
            <div id="controls" class="controls"></div>
		<div class="slideshow-container">
                    <div id="loading" class="loader"></div>
                    <div id="slideshow" class="slideshow"></div>
		</div>
		<div id="caption" class="caption-container"></div>
	</div>
        {/if}
    </div>
</div>
</div>