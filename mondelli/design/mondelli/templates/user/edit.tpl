<div class="content-view-full">
    <div class="class-user">
    <div class="border-box">

        <div class="left-column oldborder3"

                <div class="attribute-header">
                    <h1 class="long">{"User profile"|i18n("design/ezwebin/user/edit")}</h1>
                </div>

                <div class="block">
                    <h4>{"Username"|i18n("design/ezwebin/user/edit")}</h4>
                    <div class="labelbreak"></div>
                    <p class="box">{$userAccount.login|wash}</p>
                </div>

                <div class="block">
                    <h4>{"Email"|i18n("design/ezwebin/user/edit")}</h4>
                    <div class="labelbreak"></div>
                    <p class="box">{$userAccount.email|wash(email)}</p>
                </div>

                <div class="block">
                    <h4>{"Name"|i18n("design/ezwebin/user/edit")}</h4>
                    <div class="labelbreak"></div>
                    <p class="box">{$userAccount.contentobject.name|wash}</p>
                </div>

             <h4><a href={"/comment/setting"|ezurl}>{"My comment settings"|i18n("ezcomments/ezwebin/user/edit")}</a></h4>
            </div>
            <div class="right-column">

                <div class="block">
                    {attribute_view_gui attribute=$userAccount.contentobject.data_map.image image_css_class=shadow}
                </div>
            </div>

        <form action={concat($module.functions.edit.uri,"/",$userID)|ezurl} method="post" name="Edit">
        
                <div class="buttonblock">
                    <input class="button" type="submit" name="EditButton" value="{'Edit profile'|i18n('design/ezwebin/user/edit')}" />
                </div>

       

        </form>
    </div>
    </div>
</div>