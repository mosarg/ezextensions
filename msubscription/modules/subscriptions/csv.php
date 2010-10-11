<?php
/******************************************************************************
* Module for CSV data export
*******************************************************************************/


$Module = $Params['Module'];
$object_id = $Params['ObjectId'];
$accounting_structure=$Params['AccountingStructure'];
$source=$Params['Source'];
$output_list=array();
$user = eZUser::currentUser();

if ($user->isAnonymous())
    return $Module->handleError( eZError::KERNEL_ACCESS_DENIED, 'kernel' );
$export_object=eZContentObject::fetch($object_id);
if (!$export_object)
    return $Module->handleError( eZError::KERNEL_NOT_AVAILABLE, 'kernel' );

if($export_object->canEdit()) {

    switch ($source){

    case 'accounting':
    $accounts=ezcoursesAccountingInfo::fetchAccountersList($accounting_structure);
    foreach($accounts as $account) {
        array_push($output_list,array('data'=>json_decode($account->attribute('accounting_information1'),true)
            ,'labels'=>json_decode($account->attribute('accounting_information2'),true)));
    }
    break;

    case 'subscription':
        $subscriptions=ezcoursesSubscription::fetchSubscribersList($object_id);
        foreach($subscriptions as $subscription){
        array_push($output_list,array('data'=>(array)$subscription,'labels'=>''));
        }
    break;
    }
    $storage_dir =  eZSys::storageDirectory().'/';
    $msubscriptions_dir=$storage_dir.'/msubscriptions/csv/'.$source;
    $csv_file = $msubscriptions_dir . '/export_'.$source.'_'.$object_id.'.csv';
    if ( !file_exists( $msubscriptions_dir ) ) eZDir::mkdir( $msubscriptions_dir, octdec('0777'), true );
    $output_list=subscriptionsFormData::simplify($output_list);
    $csv_export = fopen($csv_file, 'w');
    foreach ($output_list as $line) {
        fputcsv($csv_export,$line);
    }
    fclose($csv_file);



    subscriptionsFormData::download($csv_file);


}

?>
