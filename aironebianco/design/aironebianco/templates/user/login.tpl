<div class="border-box">
    <div class="user-login">
        <form method="post" action={"/user/login/"|ezurl} name="loginform">
              <div class="attribute-header">
                <h1 >Login</h1>
            </div>
            {if $User:warning.bad_login}
            <div class="warning">
                <h2>Impossibile effettuare il login</h2>
                <ul>
                    <li>Devi inserire una password ed uno username validi per effettuare il login</li>
                </ul>
            </div>
            {else}
            {if $site_access.allowed|not}
            <div class="warning">
                <h2>Accesso Negato</h2>
                <ul>
                    <li>Non puoi accedere al sito</li>
                </ul>
            </div>
            {/if}

            {/if}

            <div class="block">
                <label for="id1">Nome utente</label><div class="labelbreak"></div>
                <input class="halfbox softshadow" type="text" size="10" name="Login" id="id1" value="{$User:login|wash}" tabindex="1" />
            </div>

            <div class="block">
                <label for="id2">Password</label><div class="labelbreak"></div>
                <input class="halfbox softshadow" type="password" size="10" name="Password" id="id2" value="" tabindex="1" />
            </div>

            {if ezini( 'Session', 'RememberMeTimeout' )}
            <div class="block">
                <input type="checkbox softshadow" tabindex="1" name="Cookie" id="id4" /><label for="id4" style="display:inline;">{"Remember me"|i18n("design/scuola/user/login")}</label>
            </div>
            {/if}

            <div class="buttonblock">
                <input class="defaultbutton" type="submit" name="LoginButton" value="{'Login'|i18n('design/scuola/user/login','Button')}" tabindex="1" />
                {if ezmodule( 'user/register' )}
                <input class="button" type="submit" name="RegisterButton" id="RegisterButton" value="{'Sign up'|i18n('design/scuola/user/login','Button')}" tabindex="1" />
                {/if}
            </div>
            <p><a href={'/user/forgotpassword'|ezurl}>Hai dimenticato la password?</a></p>
            <input type="hidden" name="RedirectURI" value="{$User:redirect_uri|wash}" />
            {if and( is_set( $User:post_data ), is_array( $User:post_data ) )}
            {foreach $User:post_data as $key => $postData}
            <input name="Last_{$key}" value="{$postData}" type="hidden" /><br/>
            {/foreach}
            {/if}
        </form>
    </div>
</div>