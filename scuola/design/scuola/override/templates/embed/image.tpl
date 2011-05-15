{run-once}
{ezcss_require(array('javascript/fancybox.css'))}
{ezscript_require( array('classes/jquery.fancybox.js','classes/jquery.easing.js','init_fancybox.js'))}
{/run-once}


<div class="content-view-embed">
 <div class="class-image">
    <div class="attribute-image">
        <a title="{$object.data_map.caption.data_text|strip_tags()|shorten(140)}" class="embedded-image" href={$object.data_map.image.content[original].url|ezroot}>
        {if is_set( $link_parameters.href )}
          {attribute_view_gui attribute=$object.data_map.image zoom=true() image_css_class='shadow' image_class=$object_parameters.size href=$link_parameters.href|ezurl target=$link_parameters.target border_size=first_set( $object_parameters.border_size, '0' ) border_color=first_set( $object_parameters.border_color, '' ) border_style=first_set( $object_parameters.border_style, 'solid' ) margin_size=first_set( $object_parameters.margin_size, '' )}
        {else}
            {attribute_view_gui attribute=$object.data_map.image zoom=true() image_css_class='shadow' image_class=$object_parameters.size border_size=first_set( $object_parameters.border_size, '0' ) border_color=first_set( $object_parameters.border_color, '' ) border_style=first_set( $object_parameters.border_style, 'solid' ) margin_size=first_set( $object_parameters.margin_size, '' )}
        {/if}
        </a>
    </div>
     <div class="attribute-caption">
         {if $object.data_map.caption.has_content}
           {attribute_view_gui attribute=$object.data_map.caption}
         {/if}
     </div>
      {if $object.can_edit}
    <div class="image-controls">
           <form action={"/content/action"|ezurl} method="post">
           <input type="image"  name="EditButton" src={"icons/pencil.png"|ezimage} alt="Edit" />
           <input type="hidden" name="ContentObjectLanguageCode" value="{$object.current_language}" />
           <input type="hidden" name="ContentObjectID" value="{$object.id}" />
           <input type="hidden" name="NodeID" value="{$object.main_node_id}" />
           <input type="hidden" name="ContentNodeID" value="{$object.main_node_id}" />
        </form>
    </div>
{/if}
 </div>
</div>
