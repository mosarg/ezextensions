<?php


$Module = array( 'name' => 'Manage subscriptions' );

$ViewList = array();

$ViewList['list'] = array( 'script' => 'list.php',
    'functions' => array( 'read' ),
    'params' => array('CourseId'));


$ViewList['action'] = array('script' => 'action.php',
    'functions'=>array('submit'),
    'single_post_actions' => array( 'ActionCollectInformation' => 'CollectInformation' ),
    'post_action_parameters' => array( 'CollectInformation' => array(
    'ContentObjectID' => 'ContentObjectID',
    'ContentNodeID' => 'ContentNodeID',
    'ViewMode' => 'ViewMode',
    'AccountingField'=>'AccountingField',
    'AccountingStructure'=>'AccountingStructure',
    'PaymentInfo'=>'PaymentInfo') ),
    'params'=> array( 'courseSite' ));
    
$ViewList['csv'] = array( 'script' => 'csv.php',
    'functions' => array( 'export'),
    'params' => array('ObjectId','AccountingStructure','Source'));

$ViewList['pdf'] = array( 'script' => 'pdf.php',
    'functions' => array( 'export'),
    'params' => array('ObjectId','UserId','AccountingStructure'));

$FunctionList = array();
$FunctionList['read'] = array();
$FunctionList['submit']=array();
$FunctionList['export']=array();

?>
