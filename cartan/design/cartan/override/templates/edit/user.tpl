{ezscript_require( array('classes/registration.js','classes/editactions.js','init_edituser.js'))}

{def $action_url=concat("/content/edit/",$object.id,"/",$edit_version,"/",$edit_language|not|choose(concat($edit_language,"/"),''))}



<form enctype="multipart/form-data" id="editform" name="editform" method="post" action={concat("/content/edit/",$object.id,"/",$edit_version,"/",$edit_language|not|choose(concat($edit_language,"/"),''))|ezurl}>

<div class="border-box">

  <div class="content-edit user-edit rounded-more">

    <div class="attribute-header">
        <h1 class="long">{'Edit %1 - %2'|i18n( 'design/ezwebin/content/edit', , array( $class.name|wash, $object.name|wash ) )}</h1>
    </div>

    <div class="attribute-language">
    {def $language_index = 0
         $from_language_index = 0
         $translation_list = $content_version.translation_list}

    {foreach $translation_list as $index => $translation}
       {if eq( $edit_language, $translation.language_code )}
          {set $language_index = $index}
       {/if}
    {/foreach}


    </div>

    {include uri='design:content/edit_validation.tpl'}

    {include uri='design:content/edit_attribute.tpl'}

    <div class="buttonblock">
    <input class="defaultbutton" type="submit" name="PublishButton" value="{'Send for publishing'|i18n( 'design/ezwebin/content/edit' )}" />
    <input class="button" type="submit" name="StoreButton" value="{'Store draft'|i18n( 'design/ezwebin/content/edit' )}" />
    <input class="button" type="submit" name="DiscardButton" value="{'Discard draft'|i18n( 'design/ezwebin/content/edit' )}" />
    <input type="hidden" name="DiscardConfirm" value="0" />
    <input type="hidden" name="RedirectIfDiscarded" value="user/edit" />
    <input type="hidden" name="RedirectURIAfterPublish" value="user/edit" />
    </div>
</div>

</div>

</form>

<p id="action" style="display:none">{$action_url}</p>
<p id="redirect" style="display:none">{ezhttp( 'LastAccessesURI', 'session' )}</p>
