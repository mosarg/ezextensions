<div class="border-box">
    <div class="user-activate">

        <div class="attribute-header">
            <h1 class="long">{"Activate account"|i18n("design/scuola/user/activate")}</h1>
        </div>

        <p>
            {if $account_activated}
                {"L'account verrà attivato non appena avrai portato a scuola una copia dell'e-mail ricevuta."|i18n('design/scuola/user/activate')}
            {elseif $already_active}
                {"Il tuo account è già attivo."|i18n('design/scuola/user/activate')}
            {elseif $already_enabled}
                {"Il tuo account è già attivo ed abilitato"|i18n('design/scuola/user/activate')}
             {else}
             {"La chiave inviata non è corretta. L'account non è attivo."|i18n('design/scuola/user/activate')}
            {/if}
        </p>
       
    </div>
</div>