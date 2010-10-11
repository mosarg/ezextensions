{* Edit prof *}
{ezpagedata_set( 'extra_menu', false() )}
{ezpagedata_set( 'left_menu', false() )}

{cache-block keys=array($node)}
<div class="edit-prof">


    <div class="main-content">
        <form action={concat($module.functions.edit.uri,"/",$userID)|ezurl} method="post" name="Edit">
              <div class="maincontentheader">
                <h1>{"User profile"|i18n("m2000/standard/user")}</h1>
            </div>
            <div class="block">
                <label>{"Name"|i18n("m2000/standard/user")}</label><div class="labelbreak"></div>
                <p class="box">{$userAccount.contentobject.name|wash}</p>
            </div>
            <div class="block">
                <label>{"Username"|i18n("m2000/standard/user")}</label><div class="labelbreak"></div>
                <p class="box">{$userAccount.login|wash}</p>
            </div>
            <div class="block">
                <label>{"Email"|i18n("m2000/standard/user")}</label><div class="labelbreak"></div>
                <p class="box">{$userAccount.email|wash(email)}</p>
            </div>
            <div class="picture">
                {attribute_view_gui attribute=$userAccount.contentobject.data_map.image}
            </div>
            <div class="signature">
                {attribute_view_gui attribute=$userAccount.contentobject.data_map.signature}
            </div>
            {if $userAccount.contentobject.class_identifier|eq('professore')}
            <div class="div.prof_personal_info">
                <div id="scuola">
                    <h2>{"Scuole di appartenenza"|i18n("m2000/standard/user")}</h2>
                    {attribute_view_gui attribute=$userAccount.contentobject.data_map.school}
                </div>
            </div>

            {/if}
            <div class="buttonblock">
                <input class="text" type="hidden" name="ContentObjectLanguageCode" value="{$userAccount.contentobject.initial_language_code}" />
                <input class="button" type="submit" name="EditButton" value="{'Edit profile'|i18n('m2000/standard/user')}" />
            </div>

        </form>
    </div>
    <div class="profile_info_col">
        <div class="profile_info rounded shadowmore">
            {def  $relNodes=$userAccount.contentobject.related_contentobject_array[0].assigned_nodes}
            <h2>Cartelle personali</h2>
            {foreach $relNodes as $relNode}
            <div>
                <a href={$relNode.url_alias|ezurl}>{$relNode.parent.url_alias}-{$relNode.name}</a>
            </div>

            {/foreach}
        </div>
        <div class="profile_info rounded shadowmore">
            <div id="classi">
                <h2>{"Insegno in"|i18n("m2000/standard/user")}</h2>
                {attribute_view_gui attribute=$userAccount.contentobject.data_map.teachwhere sort='school' context='embed'}
            </div>
        </div>
        <div class="profile_info rounded shadowmore">
            <div id="media">
                <h2>{"Contenuti multimediali"|i18n("m2000/standard/user")}</h2>
                <a href={"Media"|ezurl()}>Media</a>
            </div>
        </div>
    </div>

</div>
{/cache-block}