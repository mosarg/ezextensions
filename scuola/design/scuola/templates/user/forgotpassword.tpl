<div class="border-box">
<div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
<div class="border-ml"><div class="border-mr"><div class="border-mc float-break">

<div class="user-forgotpassword">

{if $link}
<p>
{"Un'e-mail è stata spedita all'indirizzo: %1. L'e-mail contiene un link che devi cliccare in modo da poter confermare la tua identità."|i18n('design/ezwebin/user/forgotpassword',,array($email))}
</p>
{else}
   {if $wrong_email}
   <div class="warning">
   <h2>{"Nessun utente registrato con tale indirizzo."|i18n('design/ezwebin/user/forgotpassword')}</h2>
   </div>
   {/if}
   {if $generated}
   <p>
   {"La password è stata generata con successo ed inviata all'indirizzo: %1"|i18n('design/ezwebin/user/forgotpassword',,array($email))}
   </p>
   {else}
      {if $wrong_key}
      <div class="warning">
      <h2>{"La chiava non è valida o è già stata utilizzata. "|i18n('design/ezwebin/user/forgotpassword')}</h2>
      </div>
      {else}
      <form method="post" name="forgotpassword" action={"/user/forgotpassword/"|ezurl}>

      <div class="attribute-header">
      <h1 class="long">{"Hai dimenticato la password?"|i18n('design/ezwebin/user/forgotpassword')}</h1>
      </div>

      <p>
      {"Se hai dimenticato la password inserisci il tuo indirizzo e-mail, creeremo una nuova password e te la invieremo."|i18n('design/ezwebin/user/forgotpassword')}
      </p>

      <div class="block">
      <label for="email">{"Email"|i18n('design/ezwebin/user/forgotpassword')}:</label>
      <div class="labelbreak"></div>
      <input class="halfbox" type="text" name="UserEmail" size="40" value="{$wrong_email|wash}" />
      </div>

      <div class="buttonblock">
      <input class="button" type="submit" name="GenerateButton" value="{'Generate new password'|i18n('design/ezwebin/user/forgotpassword')}" />
      </div>
      </form>
      {/if}
   {/if}
{/if}

</div>

</div></div></div>
<div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
</div>