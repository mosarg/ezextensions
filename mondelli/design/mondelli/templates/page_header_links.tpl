<div id="links" class="roundedbottom">
    <ul>
        <li id="title"></li>

       
    {if $current_user.is_logged_in}
        {if $pagedesign.data_map.my_profile_label.has_content}
        <li id="myprofile"><a href={"/user/edit/"|ezurl} title="{$pagedesign.data_map.my_profile_label.data_text|wash}">{$pagedesign.data_map.my_profile_label.data_text|wash}</a></li>
        {/if}
        {if $pagedesign.data_map.logout_label.has_content}
        <li id="logout"><a href={"/user/logout"|ezurl} title="{$pagedesign.data_map.logout_label.data_text|wash}">{$pagedesign.data_map.logout_label.data_text|wash} ( {$current_user.contentobject.name|wash} )</a></li>
        {/if}
    {else}
        {if and( $pagedesign.data_map.register_user_label.has_content, ezmodule( 'user/register' ) )}
        <li id="registeruser"><a href={"/user/register"|ezurl} title="{$pagedesign.data_map.register_user_label.data_text|wash}">{$pagedesign.data_map.register_user_label.data_text|wash}</a></li>
        {/if}
        {if $pagedesign.data_map.login_label.has_content}
       
        <li id="ajax_login">{include uri='design:page_ajaxlogin.tpl'}</li>

        {/if}
    {/if}

    {if $pagedesign.can_edit}
        <li id="sitesettings"><a href={concat( "/content/edit/", $pagedesign.id, "/a" )|ezurl} title="{$pagedesign.data_map.site_settings_label.data_text|wash}">{$pagedesign.data_map.site_settings_label.data_text|wash}</a></li>
    {/if}
    </ul>
</div>