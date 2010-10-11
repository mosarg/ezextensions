{* ezhttp( 'LastAccessesURI', 'session' ) *}
{* ezhttp( 'LastAccessedModifyingURI', 'session' ) *}
<form enctype="multipart/form-data" id="editform" name="editform" method="post" action={concat("/content/edit/",$object.id,"/",$edit_version,"/",$edit_language|not|choose(concat($edit_language,"/"),''))|ezurl}>

      {include uri='design:parts/website_toolbar_edit.tpl'}

      <div class="border-box">

        <div class="content-edit">

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

                {if $is_translating_content}

                {def $from_language_object = $object.languages[$from_language]}

                {'Translating content from %from_lang to %to_lang'|i18n( 'design/ezwebin/content/edit',, hash(
                '%from_lang', concat( $from_language_object.name, '&nbsp;<img src="', $from_language_object.locale|flag_icon, '" style="vertical-align: middle;" alt="', $from_language_object.locale, '" />' ),
                '%to_lang', concat( $translation_list[$language_index].locale.intl_language_name, '&nbsp;<img src="', $translation_list[$language_index].language_code|flag_icon, '" style="vertical-align: middle;" alt="', $translation_list[$language_index].language_code, '" />' ) ) )}

                {else}

                {'Content in %language'|i18n( 'design/ezwebin/content/edit',, hash( '%language', $translation_list[$language_index].locale.intl_language_name ))}&nbsp;<img src="{$translation_list[$language_index].language_code|flag_icon}" style="vertical-align: middle;" alt="{$translation_list[$language_index].language_code}" />

                {/if}
            </div>

            {include uri='design:content/edit_validation.tpl'}

            {include uri='design:content/edit_attribute.tpl'}

       

            <div class="buttonblock">
              <input class="defaultbutton" type="submit" name="PublishButton" value="{'Send for publishing'|i18n( 'design/ezwebin/content/edit' )}" />
                <input class="button" type="submit" name="StoreButton" value="{'Store draft'|i18n( 'design/ezwebin/content/edit' )}" />
                {if is_set($collaboration)|not}
                    <input class="button" type="submit" name="DiscardButton" value="{'Discard draft'|i18n( 'design/ezwebin/content/edit' )}" />
                    <input type="hidden" name="DiscardConfirm" value="0" />


                    
                    {if eq($object.current.main_parent_node_id,2)}
                            {def $redirect_to='/'}
                    {else}
                           {def $redirect_to=ezhttp( 'LastAccessesURI', 'session' )}
                    {/if}

                    <input type="hidden" name="RedirectIfDiscarded" value={$redirect_to} />
                {/if}
                <input type="hidden" name="RedirectURIAfterPublish" value={$redirect_to} />
            </div>
        </div>



    </div>

</form>

<script type="text/javascript" src={'javascript/modal_selection.js'|ezdesign} ></script>