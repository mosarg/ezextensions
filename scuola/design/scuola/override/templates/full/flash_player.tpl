{* Flash player - Full view *}


{include uri='design:parts/global_variables.tpl' left_menu=true() left_nav_menu=true() extra_menu=false()}


{def $sort_order=$node.parent.sort_array[0][1]
     $sort_column=$node.parent.sort_array[0][0]
     $sort_column_value=cond( $sort_column|eq( 'published' ), $node.object.published,
                             $sort_column|eq( 'modified' ), $node.object.modified,
                             $sort_column|eq( 'name' ), $node.object.name,
                             $sort_column|eq( 'priority' ), $node.priority,
                             $sort_column|eq( 'modified_subnode' ), $node.modified_subnode,
                             false() ) }
{if $sort_column_value|eq( false() )}
    {set $sort_column_value = $node.object.published
         $sort_column = 'published'}
{/if}

{def $previous_video = fetch( 'content', 'list', hash( 'parent_node_id', $node.parent_node_id,
                                                       'class_filter_type', 'include',
                                                       'class_filter_array', array( 'flash_player' ),
                                                       'limit', '1',
                                                       'attribute_filter', array( 'and', array( $sort_column, $sort_order|choose( '>', '<' ), $sort_column_value ) ),
                                                       'sort_by', array( $sort_column, $sort_order|not ) ) )
     $next_video = fetch( 'content', 'list', hash( 'parent_node_id', $node.parent_node_id,
                                                   'class_filter_type', 'include',
                                                   'class_filter_array', array( 'flash_player' ),
                                                   'limit', '1',
                                                   'attribute_filter', array( 'and', array( $sort_column, $sort_order|choose( '<', '>' ), $sort_column_value ) ),
                                                   'sort_by', array( $sort_column, $sort_order ) ) ) }

<div class="content-view-full">
    <div class="class-flash">

        

    <div class="attribute-header" >
        <h1>{$node.name|wash()}</h1>
    </div>

    {if is_unset( $versionview_mode )}
        <div class="content-navigator">
            {if $previous_video}
                <div class="content-navigator-previous">
                    <div class="content-navigator-arrow">&laquo;&nbsp;</div><a href={$previous_video[0].url_alias|ezurl} title="{$previous_video[0].name|wash}">{'Video precedente'|i18n( 'design/ezwebin/full/image' )}</a>
                </div>
            {else}
                <div class="content-navigator-previous-disabled">
                    <div class="content-navigator-arrow">&laquo;&nbsp;</div>{'Video precedente'|i18n( 'design/scuola/full/image' )}
                </div>
            {/if}

            {if $previous_video}
                <div class="content-navigator-separator">|</div>
            {else}
                <div class="content-navigator-separator-disabled">|</div>
            {/if}

            {def $parent=$node.parent}
                <div class="content-navigator-forum-link"><a href={$parent.url_alias|ezurl}>{$parent.name|wash}</a></div>

            {if $next_video}
                <div class="content-navigator-separator">|</div>
            {else}
                <div class="content-navigator-separator-disabled">|</div>
            {/if}

            {if $next_video}
                <div class="content-navigator-next">
                    <a href={$next_video[0].url_alias|ezurl} title="{$next_video[0].name|wash}">{'Video Successivo'|i18n( 'design/scuola/full/image' )}</a><div class="content-navigator-arrow">&nbsp;&raquo;</div>
                </div>
            {else}
                <div class="content-navigator-next-disabled">
                    {'Video Successivo'|i18n( 'design/ezwebin/full/image' )}<div class="content-navigator-arrow">&nbsp;&raquo;</div>
                </div>
            {/if}
        </div>
        {/if}

    <div class="content-media">
{def $siteurl=concat( "http://", ezini( 'SiteSettings', 'SiteURL' ) ) 
     $attribute_file=$node.data_map.file
     $video=concat( "content/download/",$attribute_file.contentobject_id,"/", $attribute_file.content.contentobject_attribute_id )|ezurl(no)
     $flash_var=concat( "moviepath=", $video )}
    
    {* Embed URL, which URL to retrieve the embed code from. *}
    {set $flash_var=$flash_var|append( "&amp;embedurl=", concat( $siteurl, "/flash/embed/", $node.object.id ) )}

    {* Embed Link *}
    {set $flash_var=$flash_var|append( "&amp;embedlink=", concat( $siteurl, $node.url_alias|ezurl(no) ) )}
    
    <script type="text/javascript">
    <!--
        insertMedia( '<object type="application/x-shockwave-flash"  data="{'flash/flash_player.swf'|ezdesign(no)}"  width="448" height="354"> ');
        insertMedia( '<param name="movie" value="{'flash/flash_player.swf'|ezdesign(no)}"  /> ');
        insertMedia( '<param name="scale" value="exactfit" /> ');
        insertMedia( '<param name="allowScriptAccess" value="sameDomain" />');
        insertMedia( '<param name="allowFullScreen" value="true" />');
        insertMedia( '<param name="flashvars" value="{$flash_var}" />');
        insertMedia( '<p>No <a href="http://www.macromedia.com/go/getflashplayer">Flash player<\/a> avaliable!<\/p>');
        insertMedia( '<\/object>' );
    //-->
    </script>

    <noscript>
    <object type="application/x-shockwave-flash" data="{'flash/flash_player.swf'|ezdesign(no)}" width="448" height="354">
        <param name="movie" value="{'flash/flash_player.swf'|ezdesign(no)}" />
        <param name="scale" value="exactfit" />
        <param name="allowScriptAccess" value="sameDomain" />
        <param name="allowFullScreen" value="true" />
        <param name="flashvars" value="{$flash_var}" />
        <p>No <a href="http://www.macromedia.com/go/getflashplayer">Flash player</a> avaliable!</p>
    </object>
    </noscript>
    </div>
    
    <div class="attribute-short">
        {attribute_view_gui attribute=$node.data_map.description}
    </div>
    </div>
{include uri='design:parts/object_informations.tpl' style='full'}
</div>
