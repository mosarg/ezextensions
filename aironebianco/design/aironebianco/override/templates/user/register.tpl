{run-once}
    {ezscript_require( array('classes/registration.js','init_registration.js'))}
{/run-once}

<div class="registration-form">
<div class="left-column">
<form id="user_registration_form" enctype="multipart/form-data"  action={"/user/register/"|ezurl} method="post" name="Register">

{if and( and( is_set( $checkErrNodeId ), $checkErrNodeId ), eq( $checkErrNodeId, true() ) )}
    <div class="message-error">
        <h2><span class="time">[{currentdate()|l10n( shortdatetime )}]</span> {$errMsg}</h2>
    </div>
{/if}


{if $validation.processed}

    {if $validation.attributes|count|gt(0)}
        <div class="warning">
        <h2>{"Input did not validate"|i18n("design/ezwebin/user/register")}</h2>
        <ul>
        {foreach $validation.attributes as $attribute}
            <li>{$attribute.name}: {$attribute.description}</li>
        {/foreach}
        </ul>
        </div>
    {else}
        <div class="feedback">
        <h2>{"Input was stored successfully"|i18n("design/ezwebin/user/register")}</h2>
        </div>
    {/if}

{/if}


<div class="maincontentheader">
<h1>{"Registrazione utente"|i18n("mondelli/user")}</h1>
</div>
<div>
          <p>{'Le voci contrassegnate con * sono obbligatorie'|i18n('mondelli/register')}</p>
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
       <div class="block">
        {if $ContentObjectAttribute.is_required}
            {set $mandatory='mandatory}
        {else}
            {set $mandatory='nonmandatory'}
        {/if}
        {switch match=$ContentObjectAttribute.contentclass_attribute.identifier}
            {case match='signature'}
            <div class="ezcca-edit-signature optional">
            <h4 class="{$mandatory}">{$ContentObjectAttribute.contentclass_attribute_name}</h4>
             {attribute_edit_gui attribute=$ContentObjectAttribute}
            </div>
            {/case}
            {case match='user_account'}
            <div class="ezcca-edit-user_account">
              {attribute_edit_gui attribute=$ContentObjectAttribute}
            </div>
            {/case}
            {case match='image'}
            <div class="ezcca-edit-image optional">
                <h4 class="{$mandatory}">{$ContentObjectAttribute.contentclass_attribute_name}</h4>
             {attribute_edit_gui attribute=$ContentObjectAttribute}
            </div>
            {/case}
           {case}
             <h4 class="{$mandatory}"> {$ContentObjectAttribute.contentclass_attribute_name}</h4>
             {attribute_edit_gui attribute=$ContentObjectAttribute}
            {/case}
        {/switch}

    </div>
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
<div class="right-column shadow">
    <h2> Informazioni:</h2><br/>
    I dati necessari per la registrazione sono: nome, cognome,username, password ed email.
    <h2>Alcuni suggerimenti:</h2>
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
        
    </ul>
    Dopo aver concluso con successo la registrazione riceverete un'email con un link per la conferma dell'account e le informazioni per concludere la registrazione.
    Il vostro indirizzo di E-mail non verrà ceduto a terzi e sarà utilizzato unicamente per comunicarvi le attività organizzate da Mondelli's Stable
</div>
</div>