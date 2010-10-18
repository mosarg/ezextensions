<div class="user-login">

  

    {if $current_user.is_logged_in}
    <div class="portrait rounded">
        <a href={"/user/edit/"|ezurl}>
        {if $current_user.contentobject.data_map.image.has_content}
           {attribute_view_gui attribute=$current_user.contentobject.data_map.image image_class='square'}
        {else}
           Il mio profilo
        {/if}
        </a>
        <br />
    </div>
        <a href={"/user/logout"|ezurl} >Logout</a>
    
    

    {else}


    <form method="post" action={"/user/login/"|ezurl} name="loginform">

          <div class="attribute-header">
            <h1 class="long">{"Login"|i18n("design/ezwebin/user/login")}</h1>
        </div>


        <div class="block">
            <input class="embed_login" type="text" size="10" name="Login" id="id1" value="" tabindex="1" />
        </div>

        <div class="block">
            <input class="embed_login" type="password" size="10" name="Password" id="id2" value="" tabindex="1" />
        </div>

        {if ezini( 'Session', 'RememberMeTimeout' )}
        <div class="block">
            <input type="checkbox" tabindex="1" name="Cookie" id="id4" /><label for="id4" style="display:inline;">{"Remember me"|i18n("design/ezwebin/user/login")}</label>
        </div>
        {/if}

        <div class="buttonblock">
            <input class="defaultbutton" type="submit" name="LoginButton" value="{'Login'|i18n('design/ezwebin/user/login','Button')}" tabindex="1" />

        </div>

    </form>
    {/if}
</div>

