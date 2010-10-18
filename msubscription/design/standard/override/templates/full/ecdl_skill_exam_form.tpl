{* Membership Application Form - Full view *}
{scuolapagedata_set( 'left_menu', false() )}
{scuolapagedata_set( 'left_nav_menu', false() )}
{scuolapagedata_set( 'extra_menu', false() )}

{def $user=fetch( 'user', 'current_user' )}
{def $first_name=$user.contentobject.data_map.first_name.content
                 $last_name= $user.contentobject.data_map.last_name.content
                 $email=$user.email
                 $payment_info=$node.data_map.pay_info.content
                 $test_center=$node.data_map.center_location.sort_key_string|upcase()}
<script type="text/javascript">
    $.include({"stylesheets/common.css"|ezdesign});
</script>

{run-once}
{ezscript_require( array( concat( 'ezjsc::', 'jqueryio' ), 'classes/jquery-ui-min.js','classes/accounting.js','init_accounting.js' ) )}
{/run-once}




<div id="config" style="visibility:hidden; height:0px;">
    <p title="object_id">{$node.contentobject_id}</p>
    <p title="user_login">{$user.login}</p>
    <p title="can_edit">{$node.can_edit}</p>
    <p title="subscription_state">{"Stato Iscrizione:"|i18n("msubscription/design/course")}</p>
    <p title="subscribed_users">{"Numero di iscritti:"|i18n("msubscription/design/course")}</p>
    <p title="center_location">{$test_center}</p>
    <p title="module_url">{"subscriptions"|ezurl(no)}</p>
    <p title="prices">{ldelim} 'mod':{$node.data_map.mod_price.content},'skill_buy':{$node.data_map.skill_buy_price.content}{rdelim}</p>
</div>

<div class="border-box">
    <div class="content-view-full">
        <div class="class-membership-application-form">
            <div class="attribute-header">
                <h1>{$node.name|wash()}</h1>
            </div>
            {attribute_view_gui attribute=$node.data_map.filling_rules}

            <div class="attribute-description">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>

            {* validation *}
            {include name=Validation uri='design:content/collectedinfo_validation.tpl'
            class='message-warning'
            validation=$validation collection_attributes=$collection_attributes}

            <div id="accounting">

                <div id="interface" ></div>

             {if eq($user.login,'anonymous')}
                <div id="subscription_reminder">
                    <p> {"Per poterti registrare dei effettuare il login"|i18n("msubscription/design/course")}</p>
                </div>
             {else}
                {if $node.can_edit|not()}
                <form  method="post" action={"subscriptions/action"|ezurl}>

                       <div class="step user rounded">
                        <h4 > Utente</h4>
                        <div class="rounded"><h2>{$first_name} {$last_name} {$email}</h2></div>
                    </div>
                    <div class="step rounded">
                        <h4> Dati Personali</h4>
                        <fieldset class="bigform rounded">
                            <legend></legend>
                            <div class="attribute-message medium" id="{$node.data_map.address.contentclass_attribute.identifier}">
                                <h4>{$node.data_map.address.contentclass_attribute.name}</h4>
                                {attribute_view_gui attribute=$node.data_map.address}
                            </div>
                            <div class="attribute-message short" id="{$node.data_map.cap.contentclass_attribute.identifier}">
                                <h4>{$node.data_map.cap.contentclass_attribute.name}</h4>
                                {attribute_view_gui attribute=$node.data_map.cap}
                            </div>
                            <div class="attribute-message short" id="{$node.data_map.city.contentclass_attribute.identifier}">
                                <h4>{$node.data_map.city.contentclass_attribute.name}</h4>
                                {attribute_view_gui attribute=$node.data_map.city}
                            </div>
                            <div class="attribute-message veryshort" id="{$node.data_map.prov.contentclass_attribute.identifier}">
                                <h4>{$node.data_map.prov.contentclass_attribute.name}</h4>
                                {attribute_view_gui attribute=$node.data_map.prov}
                            </div>
                            <div class="attribute-message short" id="{$node.data_map.phone.contentclass_attribute.identifier}">
                                <h4>{$node.data_map.phone.contentclass_attribute.name}</h4>
                                {attribute_view_gui attribute=$node.data_map.phone}
                            </div>
                            <div class="attribute-message short" id="{$node.data_map.birth_date.contentclass_attribute.identifier}">
                                <h4>{$node.data_map.birth_date.contentclass_attribute.name}</h4>
                                {attribute_view_gui attribute=$node.data_map.birth_date}
                            </div>
                            <div class="attribute-message short" id="{$node.data_map.birth_place.contentclass_attribute.identifier}">
                                <h4>{$node.data_map.birth_place.contentclass_attribute.name}</h4>
                                {attribute_view_gui attribute=$node.data_map.birth_place}
                            </div>
                            <div class="attribute-message veryshort" id="{$node.data_map.sex.contentclass_attribute.identifier}">
                                <h4>{$node.data_map.sex.contentclass_attribute.name}</h4>
                                {attribute_view_gui attribute=$node.data_map.sex}
                            </div>
                        </fieldset>
                    </div>
                    <div class="step rounded">
                        <h4>Scuola e lavoro</h4>
                        <fieldset class="bigform rounded">
                            <legend></legend>

                            <div class="attribute-message short" id="{$node.data_map.school_title.contentclass_attribute.identifier}">
                                <h4>{$node.data_map.school_title.contentclass_attribute.name}</h4>
                                {attribute_view_gui attribute=$node.data_map.school_title}
                            </div>
                            <div class="attribute-message short" id="{$node.data_map.occupation.contentclass_attribute.identifier}">
                                <h4>{$node.data_map.occupation.contentclass_attribute.name}</h4>
                                {attribute_view_gui attribute=$node.data_map.occupation}
                            </div>
                            <div class="attribute-message short" id="{$node.data_map.fiscal_code.contentclass_attribute.identifier}">
                                <h4>{$node.data_map.fiscal_code.contentclass_attribute.name}</h4>
                                {attribute_view_gui attribute=$node.data_map.fiscal_code}
                            </div>
                        </fieldset>
                    </div>
                    <div id="prog_cont">
                        <fieldset  class="bigform prog rounded">
                            <legend></legend>
                            <h4>Ecdl</h4>
                            <div class="attribute-message short" id="{$node.data_map.exams_list.contentclass_attribute.identifier}">
                                <h4>{$node.data_map.exams_list.contentclass_attribute.name}</h4>
                                {attribute_view_gui attribute=$node.data_map.exams_list}
                            </div>
                            <div class="attribute-message medium" id="{$node.data_map.skill_code.contentclass_attribute.identifier}">
                                <h4>{$node.data_map.skill_code.contentclass_attribute.name}</h4>
                                {attribute_view_gui attribute=$node.data_map.skill_code}
                            </div>
                            <div class="attribute-message veryshort" id="{$node.data_map.skill_buy.contentclass_attribute.identifier}">
                                <h4>{$node.data_map.skill_buy.contentclass_attribute.name}</h4>
                                {attribute_view_gui attribute=$node.data_map.skill_buy}<span class="tick"></span>
                            </div>
                        </fieldset>
                    </div>
                    <div class="step rounded">
                        <h4>Pagamento</h4>
                        <fieldset id="prices_info" class="bigform rounded">
                            <legend></legend>

                            <div class="price" id="mod_price"><h4>Costo totale dei corsi acquistati:</h4>  <span>Empty</span>€</div>
                            <div class="price" id="skill_buy_price"><h4>Costo della skill card:</h4> <span>Empty</span>€</div>
                            <div class="price" id="total"><h4>Totale da versare:</h4> <span>Empty</span>€</div>
                            <div class="attribute-info">
                                <h4>{$node.data_map.pay_info.contentclass_attribute.name}</h4>
                                <div  id="payment_info">{$node.data_map.pay_info.content} {$test_center} <span title="skill_buy">Skills Card</span> <span title="separator">e</span> <span title="mod">Esami</span> {$first_name} {$last_name}"</div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="step rounded">
                        <h4>Trattamento dati personali</h4>
                        <fieldset class="bigform rounded">
                            <legend></legend>

                            <div class="attribute-info">
                                <h4>{$node.data_map.privacy.contentclass_attribute.name}</h4>
                                {attribute_view_gui attribute=$node.data_map.privacy}
                            </div>

                            <div class="attribute-message" id="{$node.data_map.privacy_ok.contentclass_attribute.identifier}">
                                <h4>{$node.data_map.privacy_ok.contentclass_attribute.name}</h4>
                                {attribute_view_gui attribute=$node.data_map.privacy_ok}
                            </div>

                        </fieldset>
                    </div>
                    {* Form buttons - Processing *}

                    <div class="content-action">

                        <input type="hidden" name="userFirstName" value="{$first_name}"/>

                        <input type="hidden" name="userLastName"  value="{$last_name}"/>

                        <input type="hidden" name="userEmail" value="{$email}"/>

                        <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />

                        <input type="hidden" name="URL" value="{$node.url_alias}"/>

                        <input type="hidden" name="AccountingField" value="{$node.data_map.skill_code.contentclass_attribute.identifier}" />

                        <input type="hidden" name="AccountingStructure" value="{$node.data_map.center_location.sort_key_string|upcase()}"/>

                        <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />

                        <input type="hidden" name="ViewMode" value="full" />

                        <input type="hidden" id="paymentInfo" name="PaymentInfo" value="none" />

                        <input type="submit" class="defaultbutton" name="ActionCollectInformation" value="{"Send form"|i18n("design/ezwebin/full/feedback_form")}" />
                      
                    </div>
                </form>
                {/if}
                {/if}

            </div>


        </div>

    </div>
</div>