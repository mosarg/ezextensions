{* alunno full view *}

{include uri='design:parts/global_variables.tpl' left_menu=false() left_nav_menu=false() extra_menu=false()}


<div class="maincontentheader">
  <h1>{"User profile"|i18n("m2000/standard/user")}</h1>
</div>

<div class="block">
  <label>{"Name"|i18n("m2000/standard/user")}</label><div class="labelbreak"></div>
  <p class="box">{$node.name|wash}</p>
</div>


<div class="picture">
        {attribute_view_gui attribute=$node.data_map.image}
</div>
<div class="signature">
        {attribute_view_gui attribute=$node.data_map.signature}
</div>  

<div id="scuola"
<h2>{"Scuola "|i18n("m2000/standard/user")}</h2>
{attribute_view_gui attribute=$node.data_map.school}
</div>

<div id="classi">
      {"Frequento la classe "|i18n("m2000/standard/user")}
 {attribute_view_gui attribute=$node.data_map.classe}
</div>

{include uri='design:parts/object_informations.tpl' style='full'}




