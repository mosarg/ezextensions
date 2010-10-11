<?php
/***************************************************************
 * List course subscribers
 * 
 ***************************************************************/


include_once( "kernel/common/template.php" );

/***************************************************************
*Module parameters
*
****************************************************************/


$Module = $Params['Module'];
$valueCourseId = $Params['CourseId'];

/**************************************************
* Module actions
*
****************************************************/
$viewParameters = array( 'course_id' => $valueCourseId,"test"=>'test1');

/***************************************************
* Module template init
*
*****************************************************/

$tpl = templateInit();
$subscribers=ezcoursesSubscription::fetchSubscribersList($valueCourseId);
$tpl->setVariable( 'view_parameters', $viewParameters );
$tpl->setVariable( 'subscribers', $subscribers );
$tpl->setVariable('subscribers_number',ezcoursesSubscription::countSubscribers($valueCourseId));
$Result = array();
$Result['content'] = $tpl->fetch( 'design:subscriptions/list.tpl' );
$Result['path'] = array( array( 'url' => 'subscriptions/list','text' => 'Subscriptions' ),
    array( 'url' => false,'text' => 'list' ) );

?>
