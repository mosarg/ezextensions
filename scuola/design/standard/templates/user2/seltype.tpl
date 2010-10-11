{* Selezione classe utente creazione *}
<script type="text/javascript" >
{literal}
<!--
window.onload = function ()
{
 document.getElementById('hideNoJ').style.display = 'block';
}
// -->
{/literal}
</script>
<noscript>
    <div class="warning"><h1>{"Abilta Javascript per effettuare la registrazione"|i18n('user2/seltype')}</h1></div>
</noscript>

{def $usersClasses=ezini( 'UsersCreation', 'usertype', 'scuola.ini' )}


<div class="selection_box" id="hideNoJ" style="display:none">
{foreach $usersClasses as $userClassType}
    <div class="selection_gen roundedmore" id="{concat('selection_',$userClassType)}">
        <a href={concat('/user2/register2/classe/',$userClassType)|ezurl}>{$userClassType|upfirst()} </a>
    </div>
{/foreach}
</div>

