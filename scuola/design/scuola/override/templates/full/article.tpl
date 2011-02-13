{* Article - Full view *}

{include uri='design:parts/global_variables.tpl' left_menu=true() left_nav_menu=true()}


    <div class="content-view-full">
        <div class="class-article">
       {if $node.object.state_id_array|contains('6')}
         <div class="wip  shadowmore">
                <p>{"Contenuto in preparazione non ancora visibile pubblicamente"|i18n('scuola/state')}</p>
         </div>
        {/if}

        {include uri='design:parts/object_informations.tpl' style='full'}
        <div class="attribute-header">
            {if $node.data_map.image.has_content}
                <div class="attribute-image">
                 
                    <div class="shadow" >{attribute_view_gui attribute=$node.data_map.image link_class=ezimage_zoom href=$node.data_map.image.content[original].url|ezroot image_class=gallerythumbnailsquare}</div>
                 
                </div>
            {/if}
            <h1>{$node.data_map.title.content|wash()}</h1>
        </div>
        
        <div class="title-separator"></div>
        <div class="separator"></div>
        
        {if $node.data_map.intro.content.is_empty|not}
                <div class="attribute-short">
                    {attribute_view_gui attribute=$node.data_map.intro}
                </div>
        {/if}
       

        {if $node.data_map.body.content.is_empty|not}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.body}
            </div>
        {/if}

        {if is_unset( $versionview_mode )}
        {if $node.data_map.enable_comments.data_int}
            <h1>{"Comments"|i18n("design/ezwebin/full/article")}</h1>
                <div class="content-view-children">
                    {foreach fetch_alias( comments, hash( parent_node_id, $node.node_id ) ) as $comment}
                        {node_view_gui view='line' content_node=$comment}
                    {/foreach}
                </div>

                {if fetch( 'content', 'access', hash( 'access', 'create',
                                                      'contentobject', $node,
                                                      'contentclass_id', 'comment' ) )}
                    <form method="post" action={"content/action"|ezurl}>
                    <input type="hidden" name="ClassIdentifier" value="comment" />
                    <input type="hidden" name="NodeID" value="{$node.object.main_node.node_id}" />
                    <input type="hidden" name="ContentLanguageCode" value="{ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini')}" />
                    <input class="button new_comment" type="submit" name="NewButton" value="{'New comment'|i18n( 'design/ezwebin/full/article' )}" />
                    </form>
                {else}
                    {if ezmodule( 'user/register' )}
                        <p>{'%login_link_startLog in%login_link_end or %create_link_startcreate a user account%create_link_end to comment.'|i18n( 'design/ezwebin/full/article', , hash( '%login_link_start', concat( '<a href="', '/user/login'|ezurl(no), '">' ), '%login_link_end', '</a>', '%create_link_start', concat( '<a href="', "/user/register"|ezurl(no), '">' ), '%create_link_end', '</a>' ) )}</p>
                    {else}
                        <p>{'%login_link_startLog in%login_link_end to comment.'|i18n( 'design/ezwebin/article/comments', , hash( '%login_link_start', concat( '<a href="', '/user/login'|ezurl(no), '">' ), '%login_link_end', '</a>' ) )}</p>
                    {/if}
                {/if}
        {/if}
        {/if}

        

        </div>

    </div>
