{def $user=fetch(user, current_user)}
	{def $access=true()}
	{if $access}

{literal}
<script language="JavaScript" type="text/javascript">
    <!--
    window.onload=function()
    {
        with( document.editform )
        {
            for( var i=0; i<elements.length; i++ )
            {
                if( elements[i].type == 'text' )
                {
                    elements[i].select();
                    elements[i].focus();
                    return;
                }
            }
        }
    }

    function confirmDiscard( question )
    {
        // Disable/bypass the reload-based (plain HTML) confirmation interface.
        document.editform.DiscardConfirm.value = "0";

        // Ask user if she really wants do it, return this to the handler.
        return confirm( question );
    }
    -->
</script>
{/literal}

<form name="editform" id="editform" enctype="multipart/form-data" method="post" action={concat( '/content/edit/', $object.id, '/', $edit_version, '/', $edit_language|t|choose( concat( $edit_language, '/' ), '/' ), $is_translating_content|not|choose( concat( $from_language, '/' ), '' ) )|ezurl}>
      <div id="maincontent">
        <div id="fix">
            <div id="maincontent-design">
                <div class="content-edit">
                    <div class="context-block">
                        <div class="box-header">

                            <h1 class="context-title">
                       Ticket information
                            </h1>
                            <div class="header-mainline"></div>


                            <div class="box-content">
                                <div class="context-attributes">
									{include uri="design:content/edit_validation.tpl"}															
									{include uri="design:content/edit_attribute.tpl"}
                                </div> {* END class="context-attributes" *}
                            </div> {* END class="box-content" *}

                            <div class="block">
                                <input class="button" type="submit" name="PublishButton" value="{'Save'|i18n( 'design/admin/content/edit' )}" title="{'Publish the contents of the draft that is being edited. The draft will thus become the published version of the object.'|i18n( 'design/admin/content/edit' )}" />
                                <input class="button" type="submit" name="DiscardButton" value="{'Discard draft'|i18n( 'design/admin/content/edit' )}" onclick="return confirmDiscard( '{'Are you sure you want to discard the draft?'|i18n( 'design/admin/content/edit' )}' );" title="{'Discard the draft that is being edited. This will also remove the translations that belong to the draft (if any).'|i18n( 'design/admin/content/edit' ) }" />
                                <input type="hidden" name="DiscardConfirm" value="1" />
                            </div>  {* END class="block" *}
                            <
                        </div> {* END class="controlbar" *}
                    </div> {* END class="context-block" *}
                </div> {* class="content-edit" *}
            </div> {* id="maincontent-design" *}
        </div> {* id="fix" *}
    </div> {* id="maincontent" *}
</form>	
	{/if}
	{undef}
{undef}