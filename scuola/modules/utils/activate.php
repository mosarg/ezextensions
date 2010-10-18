<?php
$Module = $Params['Module'];
$http = eZHTTPTool::instance();

$parameters = array();
$redirectURL = $http->postVariable( 'url' );
$parameters['userid'] = $http->postVariable( 'userid' );
foreach( $parameters as $p => $id ) {
    $pname = $p;
    $pvalue = $id;
    if( $parameters["$pname"] == '' ) {
        $parameters["$pname"] = 'null';
    }
}
posttoview( $redirectURL, $parameters );


function posttoview( $url, $parameters = array(), $s = '') {

    foreach( $parameters as $p => $id ) {
        $pname = $p;
        $pvalue = $id;
        if( $id != 'null')
            $s .= '/('.$pname.')/'.$pvalue;
    }
    foreach ($parameters['userid'] as $user) {
        $current_user=eZUser::fetch($user);
        eZDebug::writeNotice($current_user->Email,"user email");
        $userSetting = eZUserSetting::fetch($user);
        $userSetting->setAttribute( 'is_enabled', 1 );
        $userSetting->store();
        sendConfMail($current_user->Email);
    }
    $location = $url.$s;
    // die( print_r( $location ) );
    header( "Location: " . $location );
    die();
}
function sendConfMail($receiver) {
    $ini = eZINI::instance();
    $mail = new eZMail();
    $emailSender = $ini->variable( 'MailSettings', 'EmailSender' );
    $administratorName=$ini->variable( 'MailSettings', 'EmailSenderName' );
    $mail->setSender( $emailSender,$administratorName);
    $mail->setReceiver($receiver);
    $body = ezi18n( 'scuola/user2/register', "Il tuo account è stato attivato dagli amministratori. Puoi ora accedere al sito" );
    $subject=ezi18n('scuola/user2/register','Attivazione account');
    $mail->setSubject( $subject );
    $mail->setBody( $body);
    $mailResult = eZMailTransport::send( $mail );
}

?>
