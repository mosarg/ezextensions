
       
        <div class="block">
            <h2>Nome Utente</h2>
            <input class="embed_login" type="text" size="10" name="Login" id="id1" value="" tabindex="1" />
        </div>

        <div class="block">
            <h2>Password</h2>
            <input class="embed_login" type="password" size="10" name="Password" id="id2" value="" tabindex="1" />
        </div>

        {if ezini( 'Session', 'RememberMeTimeout' )}
        <div class="block">
            <input type="checkbox" tabindex="1" name="Cookie" id="id4" /><label for="id4" style="display:inline;">{"Remember me"|i18n("design/ezwebin/user/login")}</label>
        </div>
        {/if}

        <div class="buttonblock">
            <button class="ajax_login_submit rounded" >{'Login'|i18n('design/ezwebin/user/login','Button')}</button>
        </div>
        <div class="error_box rounded"></div>
    