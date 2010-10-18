<?php
/******************************************************************************
* Module for PDF data download
*******************************************************************************/


$Module = $Params['Module'];
$object_id = $Params['ObjectId'];
$user_id=$Params['UserId'];
$accounting_structure=$Params['AccountingStructure'];
$output_list=array();
$user = eZUser::currentUser();

if ($user->isAnonymous())
    return $Module->handleError( eZError::KERNEL_ACCESS_DENIED, 'kernel' );
$export_object=eZContentObject::fetch($object_id);

if (!$export_object)
    return $Module->handleError( eZError::KERNEL_NOT_AVAILABLE, 'kernel' );

if($export_object->canEdit()) {

    $user_account=ezcoursesAccountingInfo::fetchByUserIdStructure($user_id,$accounting_structure);

 if (!$user_account)
     eZExecution::cleanExit();

    $file_name=$user_account->attribute('attachments').'.pdf';
    $storage_dir = eZSys::storageDirectory();
    $msubscriptions_dir=$storage_dir.'/msubscriptions/pdf';
    $download_file=$msubscriptions_dir.'/'.$file_name;

    subscriptionsFormData::download($download_file);


}

?>
