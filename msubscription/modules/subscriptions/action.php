<?php

/*******************************************************************************
 * Subcription form information collection
 *
 *******************************************************************************/

include_once( "kernel/common/template.php" );
$Module = $Params['Module'];
$http = eZHTTPTool::instance();
$userParameters = array();
if ( isset( $Params['UserParameters'] ) ) {
    $userParameters = $Params['UserParameters'];
}
$url = $http->postVariable( 'URL' );
$ObjectID = $Module->actionParameter('ContentObjectID' );
$NodeID = $Module->actionParameter( 'ContentNodeID' );

/*******************************************************************************
* Get form actions parameters/ every form submitting data using this action must
* containg these hidden fields 
*******************************************************************************/
if ( $Module->hasActionParameter( 'ViewMode' ) )
    $ViewMode = $Module->actionParameter( 'ViewMode' );
    $ViewMode = 'full';

if ($Module->hasActionParameter('AccountingField'))
    $accountingField=$Module->actionParameter( 'AccountingField' );

if ($Module->hasActionParameter('AccountingStructure'))
    $accountingStructure=$Module->actionParameter( 'AccountingStructure' );

if ($Module->hasActionParameter('PaymentInfo'))
    $paymentInfo=$Module->actionParameter( 'PaymentInfo' );

$object = eZContentObject::fetch( $ObjectID );

/*******************************************************************************
* Check if we can proceed further, if not exit and  aknowledge user
********************************************************************************/

if ( !$object )
    return $Module->handleError( eZError::KERNEL_NOT_AVAILABLE, 'kernel' );
if ( !$object->attribute( 'can_read' ) )
    return $Module->handleError( eZError::KERNEL_ACCESS_DENIED, 'kernel' );
$version = $object->currentVersion();
$contentObjectAttributes = $version->contentObjectAttributes();
$user = eZUser::currentUser();
$isLoggedIn = $user->attribute( 'is_logged_in' );
if ( !$isLoggedIn ) return $Module->handleError( eZError::KERNEL_ACCESS_DENIED, 'kernel' );

/*******************************************************************************
* Validate every information collecting attribute
********************************************************************************/


$attributeDataBaseName = 'ContentObjectAttribute';
$unvalidatedAttributes = array();
$canCollect = true;
$requireFixup = false;
foreach ( array_keys( $contentObjectAttributes ) as $key ) {
    $contentObjectAttribute = $contentObjectAttributes[$key];
    $contentClassAttribute = $contentObjectAttribute->contentClassAttribute();
    if ( $contentClassAttribute->attribute( 'is_information_collector' ) ) {
        $inputParameters = null;
        $status = $contentObjectAttribute->validateInformation( $http, $attributeDataBaseName, $inputParameters );
        if ( $status == eZInputValidator::STATE_INTERMEDIATE )
            $requireFixup = true;
        else if ( $status == eZInputValidator::STATE_INVALID ) {
            $canCollect = false;
            $description = $contentObjectAttribute->attribute( 'validation_error' );
            $hasValidationError = $contentObjectAttribute->attribute( 'has_validation_error' );
            if ( $hasValidationError ) {
                if ( !$description )
                    $description = false;
                $validationName = $contentClassAttribute->attribute( 'name' );
                $unvalidatedAttributes[] = array( 'id' => $contentObjectAttribute->attribute( 'id' ),
                    'identifier' => $contentClassAttribute->attribute( 'identifier' ),
                    'name' => $validationName,
                    'description' => $description );
            }
        }
        else if ( $status == eZInputValidator::STATE_ACCEPTED ) {
        }
    }
}

/*******************************************************************************
*Create attributes array to store inside ezaccounting_info
*
*******************************************************************************/
$collectionAttributes = array();
$postArray=subscriptionsFormData::extractPostVariables($_POST);
$static_data=array();
$labels_export_data=array();
$json_export_data=array('user_id'=>$user->id(),
    'first_name'=>$_POST['userFirstName'],
    'last_name'=>$_POST['userLastName'],
    'email'=>$_POST['userEmail']);

foreach ( array_keys( $contentObjectAttributes ) as $key ) {
    $contentObjectAttribute = $contentObjectAttributes[$key];
    $contentClassAttribute = $contentObjectAttribute->contentClassAttribute();
    $content_class_id=$contentClassAttribute->Identifier;

    if ($contentClassAttribute->attribute( 'is_information_collector' ) ) {
        $attribute_id=$contentObjectAttribute->attribute( 'id' );

        if (isset($postArray[$attribute_id])) {

            switch($contentClassAttribute->DataTypeString) {
                case 'sckenhancedselection':
                    $options=$contentClassAttribute->content();
                    $labels_export_data[$content_class_id]=subscriptionsFormData::extractOptions($options['options']);
                 break;
            }

            $json_export_data[$content_class_id]=$postArray[$attribute_id];
        }
        else $json_export_data[$content_class_id]='empty';
        $collectionAttributes[$attribute_id] = $contentObjectAttribute;
    }
    else {
       
        $static_data[$content_class_id]=$contentObjectAttribute->DataText;
    }
}
if ( $canCollect ) {

    $db = eZDB::instance();
    $db->begin();
    $file_name=$user->id().'_'.$accountingStructure;
    $courseAccounting=ezcoursesAccountingInfo::fetchByUserID((int)($user->id()));

    if (!is_object($courseAccounting)) {
        $test_center=array_shift($object->fetchAttributesByIdentifier(array('center_location')));
        $test_center_code=$test_center->content();
        $courseAccounting=ezcoursesAccountingInfo::create((int)($user->id()),$test_center_code[0]);

    }

    if (isset($json_export_data[$accountingField]) ) $courseAccounting->setAttribute('accounting_code',$json_export_data[$accountingField]);
    $courseAccounting->setAttribute('accounting_information1',json_encode($json_export_data));
    $courseAccounting->setAttribute('accounting_information2',json_encode($labels_export_data));
    $courseAccounting->setAttribute('attachments',$file_name);
    $courseAccounting->store();
    $db->commit();

/*******************************************************************************
* Create form pdf rendering
*******************************************************************************/
    $user_record=array();
    array_push($user_record,array('data'=>$json_export_data
        ,'labels'=>$labels_export_data));
    $real_file_path=subscriptionsFormData::form2Pdf($user_record,
        array('accounting_field'=>$accountingField,
        'user_id'=>$user->id(),
        'accounting_structure'=>$accountingStructure,
        'static_form_data'=>$static_data,
        'payment_info'=>json_decode($paymentInfo,true)
        ),
        $object->ClassIdentifier,
        $file_name
    );
/*******************************************************************************
* Send pdf via e-mail to just accounted user
*******************************************************************************/
    
    $sender=array('name'=>$static_data['admin_name'],'email'=>$static_data['email']);
    $receiver=array('name'=>$json_export_data['first_name'].' '.$json_export_data['last_name'],
                    'email'=>$json_export_data['email']);
    $message=array('subject'=>$static_data['user_email_subject'],
                    'body'=>$static_data['user_email_body'],
                    'attachment'=>$real_file_path);
    subscriptionsFormData::sendEmail($sender,$receiver,$message);

}
else {

    $contentModule = eZModule::exists( "content" );

    return $contentModule->run( 'view', array( $ViewMode, $NodeID ),
        array( 'ViewCache' => false,
        'AttributeValidation' => array( 'processed' => true,
        'attributes' => $unvalidatedAttributes ),
        'CollectionAttributes' => $collectionAttributes) );
}
return $Module->redirectTo( $url );
?>
