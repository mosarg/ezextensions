<body>
{def $site_url=ezini('SiteSettings','SiteURL')}

<h3>{'Grazie per esserti registrato su: '|i18n('design/standard/user/register)} <a href="{$site_url}">{$site_url}</a></h3>

<h4>{'Your account information'|i18n('design/standard/user/register')}</h4>
<ul>

    <li>{'Tipo di Utente'|i18n('design/scuola/register')}: {$object.class_identifier}</li>
    <li>{'Nome'|i18n('design/scuola/register')}: {$object.data_map.first_name.content}</li>
    <li>{'Cognome'|i18n('design/scuola/register')}: {$object.data_map.last_name.content}</li>
    <li>{'Username'|i18n('design/standard/user/register')}: {$user.login}</li>
    <li>{'Email'|i18n('design/standard/user/register')}: {$user.email}</li>
</ul>

{if eq($object.class_identifier,'genitore')}
<h4>{'Figli frequentanti la scuola'|i18n('design/scuola/register')}</h4>
    {attribute_view_gui attribute=$object.data_map.matricealunni}
{/if}

<br />

<div class="box">
{" Ricordati di nascondere la password prima di stampare questa email e consegnarla a scuola"|i18n('scuola/user/register')}
{if $password}
<p class="password" style="display:none" >{'Password'|i18n('design/standard/user/register')}: {$password}</p>
{/if}
</div>

{if and( is_set( $hash ), $hash )}

{'Clicca sul link sottostante per confermare il tuo account'|i18n('design/standard/user/register')}<br />
<a style="font-weight:bold;font-size:1.2em;"href="http://{$hostname}{concat( 'user2/activate2/', $hash, '/', $object.main_node_id )|ezurl(no)}"> >>>>Clicca qui!<<<< </a>

{/if}
{undef}
</body>
