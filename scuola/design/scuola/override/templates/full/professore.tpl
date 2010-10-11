<div class="maincontentheader">
  <h1>{"User profile"|i18n("m2000/standard/user")}</h1>
</div>

{def $userAccount=$node.object.data_map}
{def $accountData=$node.object.data_map.user_account.content}

<div class="block">
  <label>{"Name"|i18n("m2000/standard/user")}</label><div class="labelbreak"></div>
  <p class="box">{$node.object.name|wash}</p>
</div>
<div class="block">
  <label>{"Username"|i18n("m2000/standard/user")}</label><div class="labelbreak"></div>
  <p class="box">{$accountData.login|wash}</p>
</div>

<div class="block">
  <label>{"Email"|i18n("m2000/standard/user")}</label><div class="labelbreak"></div>
  <p class="box">{$accountData.email|wash(email)}</p>
</div>

<div class="picture">
        {attribute_view_gui attribute=$userAccount.image}   
</div>
<div class="signature">
      {attribute_view_gui attribute=$userAccount.signature}
</div>  


<div class="div.prof_personal_info">
<div id="scuola"
<h2>{"Scuola principale di appartenenza"|i18n("m2000/standard/user")}</h2>
{attribute_view_gui attribute=$userAccount.school}
</div>

<div id="classi">
  <h2>
    {"Insegno in"|i18n("m2000/standard/user")}
  </h2>
{attribute_view_gui attribute=$userAccount.teachwhere sort='school' context='embed'}
</div>
</div>

{undef}