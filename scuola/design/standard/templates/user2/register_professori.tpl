{*Pagina registrazione insegnanti*}
{run-once}
    {ezscript_require( array('classes/registration.js','init_registration.js'))}
{/run-once}
<div class="registration-form">
<div class="left-column">
<form id="user_registration_form" enctype="multipart/form-data"  action={"/user2/register2/"|ezurl} method="post" name="Register" onsubmit="cancelOnUnload=false">

<div class="maincontentheader">
<h1>{"Register user"|i18n("design/standard/user")} Professore</h1>
</div>
      <div>
          <p>{'Le voci contrassegnate con * sono obbligatorie'|i18n('scuola/register')}</p>
    </div>

{if and( and( is_set( $checkErrNodeId ), $checkErrNodeId ), eq( $checkErrNodeId, true ) )}
    <div class="message-error">
        <h2><span class="time">[{currentdate()|l10n( shortdatetime )}]</span> {$errMsg}</h2>
    </div>
{/if}
{if count($content_attributes)|gt(0)}
    {def $mandatory=''}
    {foreach $content_attributes as $ContentObjectAttribute}
    <input type="hidden" name="ContentObjectAttribute_id[]" value="{$ContentObjectAttribute.id}" />
    <div class="block">
        {if $ContentObjectAttribute.is_required}
            {set $mandatory='mandatory}
        {else}
            {set $mandatory='nonmandatory'}
        {/if}

        {switch match=$ContentObjectAttribute.contentclass_attribute.identifier}
            {case match='user_account'}
            <div class="ezcca-edit-user_account">
              {attribute_edit_gui attribute=$ContentObjectAttribute}
            </div>
            {/case}
            {case match='teachwhere'}
            <div class="ezcca-edit-teachwhere">
            <h4 class="{$mandatory}">{$ContentObjectAttribute.contentclass_attribute_name} (È possibile più di una scelta)</h4>
             {attribute_edit_gui attribute=$ContentObjectAttribute}
            </div>
            {/case}
            {case match='school'}
            <div class="ezcca-edit-school">
             <h4 class="{$mandatory}">{$ContentObjectAttribute.contentclass_attribute_name}</h4>
                {attribute_edit_gui attribute=$ContentObjectAttribute}
            </div>
            {/case}
            {case match='geolocation'}
             <div class="ezcca-edit-geolocation">
             <h4 class="{$mandatory}">{$ContentObjectAttribute.contentclass_attribute_name} (È possibile più di una scelta)</h4>
                {attribute_edit_gui attribute=$ContentObjectAttribute}
            </div>
            {/case}
            {case match='occupazione'}
            <h4>{$ContentObjectAttribute.contentclass_attribute_name}</h4>
            <span>nothing to do</span>
            {/case}
            {case}
             <h4 class="{$mandatory}"> {$ContentObjectAttribute.contentclass_attribute_name}</h4>
             {attribute_edit_gui attribute=$ContentObjectAttribute}
            {/case}

        {/switch}
        <div class="separator"></div>
    </div>
   {/foreach}
        <div class="buttonblock">
            {if and( is_set( $checkErrNodeId ), $checkErrNodeId )|not()}
                <input class="button" type="submit" name="PublishButton" value="{'Register'|i18n('design/standard/user')}" />
            {else}
                <input class="button" type="submit" name="PublishButton" disabled="disabled" value="{'Register'|i18n('design/standard/user')}" />
            {/if}
        <input class="button" type="submit" name="CancelButton" value="{'Discard'|i18n('design/standard/user')}" />
        </div>
{else}
    <div class="warning">
        <h2>{"Unable to register new user"|i18n("design/standard/user")}</h2>
    </div>
    <div class="buttonblock">
        <input class="button" type="submit" name="CancelButton" value="{'Back'|i18n('design/standard/user')}" />
    </div>
{/if}
</form>
</div>
<div class="right-column">
    <h2> Informazioni:</h2><br/>
    I dati necessari per la registrazione sono: nome, cognome,informazioni account,istituto di appartenenza e sede geografica.
    <h5>Alcuni suggerimenti:</h5>
    <ul>
        <li>
            Come username è preferibile utilizzare forme del tipo <strong>nome.cognome</strong>
        </li>
        <li>
            Scegliete una password contenente una combinazione non banale di numeri e lettere
        </li>
        <li>
           Se volete dare più risalto al vostro account inserite un'immagine per il vostro avatar
        </li>
        <li>
            Ricordatevi di mettere una spunta nelle classi in cui insegnate. Sarà poi possibile modificare in ogni momento la scelta ora effettuata
        </li>
        
    </ul>
    Dopo aver concluso con successo la registrazione riceverete un'email con un link per la conferma dell'account. Cliccate sul link e portate poi a scuola una stampa dell'email ricevuta
    per l'attivazione dell'account.
    
</div>
</div>
 {undef}