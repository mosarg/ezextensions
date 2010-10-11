<div id="links">
    <ul>
        <li id="title"><img alt="menu" src={'decorazioni/menu.png'|ezimage()} /></li>

        {if $pagedesign.data_map.tag_cloud_url.data_text|ne('')}
            {if $pagedesign.data_map.tag_cloud_url.content|eq('')}
            <li id="tagcloud"><a href={concat("/content/view/tagcloud/", $pagedata.root_node)|ezurl} title="{$pagedesign.data_map.tag_cloud_url.data_text|wash}">{$pagedesign.data_map.tag_cloud_url.data_text|wash}</a></li>
            {else}
            <li id="tagcloud"><a href={$pagedesign.data_map.tag_cloud_url.content|ezurl} title="{$pagedesign.data_map.tag_cloud_url.data_text|wash}">{$pagedesign.data_map.tag_cloud_url.data_text|wash}</a></li>
            {/if}
        {/if}
        {if $pagedesign.data_map.site_map_url.data_text|ne('')}
            {if $pagedesign.data_map.site_map_url.content|eq('')}
            <li id="sitemap"><a href={concat("/content/view/sitemap/", $pagedata.root_node)|ezurl} title="{$pagedesign.data_map.site_map_url.data_text|wash}">{$pagedesign.data_map.site_map_url.data_text|wash}</a></li>
            {else}
            <li id="sitemap"><a href={$pagedesign.data_map.site_map_url.content|ezurl} title="{$pagedesign.data_map.site_map_url.data_text|wash}">{$pagedesign.data_map.site_map_url.data_text|wash}</a></li>
            {/if}
        {/if}
       
    {if $current_user.is_logged_in}
        
    {else}
        {if and( $pagedesign.data_map.register_user_label.has_content, ezmodule( 'user/register' ) )}
        <li id="registeruser"><a href={"/user/register"|ezurl} title="{$pagedesign.data_map.register_user_label.data_text|wash}">{$pagedesign.data_map.register_user_label.data_text|wash}</a></li>
        {/if}
        {if $pagedesign.data_map.login_label.has_content}
        <li id="login"><a href={"/user/login"|ezurl} title="{$pagedesign.data_map.login_label.data_text|wash}">{$pagedesign.data_map.login_label.data_text|wash}</a></li>
        {/if}
    {/if}

    {if $pagedesign.can_edit}
        <li id="sitesettings"><a href={concat( "/content/edit/", $pagedesign.id, "/a" )|ezurl} title="{$pagedesign.data_map.site_settings_label.data_text|wash}">{$pagedesign.data_map.site_settings_label.data_text|wash}</a></li>
    {/if}
    </ul>
</div>