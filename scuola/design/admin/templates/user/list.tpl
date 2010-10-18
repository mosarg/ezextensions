<div class="border-box">
<div class="box-header">
<div class="box-tc">
<div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">
<h2 class="context-title">{'Utenti da attivare'|i18n( 'scuola/attivazione/list')}</h2>
<div class="header-subline"></div>
</div></div></div></div></div></div>

 {def $user_classes_ids=ezini( 'UserClassTypes', 'userclasstype', 'scuola.ini')
 $user_classes=fetch( 'class', 'list', hash( 'class_filter', $user_classes_ids))}

 

<form action={"utils/activate"|ezurl} method="post" >


{foreach $user_classes as $user_class}
<div class="box-header">
<h2 class="context-title">Classe utente: {$user_class.name}</h2>
</div>
<table class="list" cellspacing="0" >
    <tr>
        <th>Nome utente</th>
        <th>Email</th>
        <th>Id utente</th>
        <th>Validato?</th>
        <th>Attiva</th>
    </tr>
    {foreach $all_users[$user_class.id] as $user_kind sequence array('bglight','bgdark') as $background}
        <tr class={$background|wash}>
                <td>{$user_kind.name}</td><td>{$user_kind.email}</td><td>{$user_kind.user_id}</td>
                <td>{cond(is_null($user_kind.hash_key),'Utente validato',true(),'Utente non validato')}</td>
                <td><input type="checkbox" value={$user_kind.user_id} name="userid[]" /></td>
        </tr>
    {/foreach}
</table>
{/foreach}
<input type="submit" value={"Attiva"|i18n('scuola/professori')}>
<input name="url" type="hidden" value={"user2/list/0"|ezurl} />
</form>
</div>

