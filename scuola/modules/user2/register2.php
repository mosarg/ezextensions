<?php
//
// Created on: <01-Aug-2002 09:58:09 bf>
//
// SOFTWARE NAME: eZ Publish
// SOFTWARE RELEASE: 4.1.3
// BUILD VERSION: 23650
// COPYRIGHT NOTICE: Copyright (C) 1999-2009 eZ Systems AS
// SOFTWARE LICENSE: GNU General Public License v2.0
// NOTICE: >
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of version 2.0  of the GNU General
//   Public License as published by the Free Software Foundation.
//
//   This program is distributed in the hope that it will be useful,
//   but WITHOUT ANY WARRANTY; without even the implied warranty of
//   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//   GNU General Public License for more details.
//
//   You should have received a copy of version 2.0 of the GNU General
//   Public License along with this program; if not, write to the Free
//   Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
//   MA 02110-1301, USA.
//
//
$http = eZHTTPTool::instance();
$Module = $Params['Module'];
$redirectNumber = $Params['redirect_number'];
$userType=$Params['classtype'];
$action=$Params['actionType'];
if ( isset( $Params['UserParameters'] ) )
{
     $UserParameters = $Params['UserParameters'];
    /* if ( count($Params['UserParameters'])>0 ){
     $userType=$UserParameters['class'];
    eZDebug::writeNotice($userType,'Il tipo di utente da creare è:');
    } */
}
else
{
    $UserParameters = array();
}

/*eZDebug::writeNotice($http,'HTTP');
eZDebug::writeNotice($Params['classtype'],'classtype');
eZDebug::writeNotice($Params['redirect_number'],'redirect_number');*/

$viewParameters = array();
$viewParameters = array_merge( $viewParameters, $UserParameters );

$Params['TemplateName'] = "design:user2/register2.tpl";
$EditVersion = 1;

require_once( "kernel/common/template.php" );
$tpl = templateInit();
$tpl->setVariable( 'view_parameters', $viewParameters );
if ($userType){
$tpl->setVariable('classType',$userType);
}
if ($http->hasSessionVariable('currentType'))
{
$tpl->setVariable('currentType',$http->sessionVariable('currentType'));
}

if((!$userType)&&(!$http->hasSessionVariable("DefUserClassID"))){
return $Module->handleError( eZError::KERNEL_ACCESS_DENIED, 'kernel' );
  }

$Params['TemplateObject'] = $tpl;




// $http->removeSessionVariable( "RegisterUserID" );

$db = eZDB::instance();
$db->begin();

// Create new user object if user is not logged in
if ( !$http->hasSessionVariable( "RegisterUserID" ) )
{
/*eZDebug::writeNotice("Sto eseguendo la sezione in cui l'utente non è ancora stato creato ma è stato sele
zionato il tipo di utente");*/
    // flag if user client supports cookies and session validates + if we should do redirect
    $userClientValidates  = true;
    $doValidationRedirect = false;
    if ( !eZSession::userHasSessionCookie() )
    {
        if ( $redirectNumber == '2' )
            $userClientValidates = false;
        else
            $doValidationRedirect = true;
    }
    else if ( !eZSession::userSessionIsValid() )
    {
        if ( $redirectNumber == '2' )
            $userClientValidates = false;
        else
            $doValidationRedirect = true;
    }

    if ( $doValidationRedirect )
    {
        $db->rollback();
        return $Module->redirectTo( '/user2/register2/2' );
    }
    else if ( !$userClientValidates )
    {
        $db->rollback();

        $tpl->setVariable( 'user_has_cookie', eZSession::userHasSessionCookie(), 'User' );
        $tpl->setVariable( 'user_session_validates', eZSession::userSessionIsValid(), 'User' );      

        $Result = array();
        $Result['content'] = $tpl->fetch( 'design:user/register_user_not_valid.tpl' );
        $Result['path'] = array( array( 'url' => 'user2/seltype',
                                'text' => ezi18n( 'scuola/user2', 'Registrazione utente' ) ),
                         array( 'url' => false,
                                'text' => ezi18n( 'scuola/user2', 'Informazioni personali' ) ) );
        return $Result;
    }
    // else create user object
    
    $ini = eZINI::instance();
    $errMsg = '';
    $checkErrNodeId = false;

    $defaultUserPlacement = (int)$ini->variable( "UserSettings", "DefaultUserPlacement" );

    $defaultProfClass=(int)$ini->variable("UserSettings","ProfessorsDefClass");
    $defaultAlumnClass=(int)$ini->variable("UserSettings","AlumniDefClass");
    $defaultAtaClass=(int)$ini->variable("UserSettings","AtaDefClass");
    $defaultParentsClass=(int)$ini->variable("UserSettings","ParentsDefClass");
    $defaultuserClassID = $ini->variable( "UserSettings", "UserClassID" );

   

    //eZDebug::writeNotice($defaultProfClass,'Register2.notice DefaultProfClass');
    
    //Select user class type
    if(isset($userType)){
        $http->setSessionVariable('currentType',$userType);

    	switch ($userType){
    	  case "professori":
    	  $userClassID=$defaultProfClass;
    	  break;
    	  case "alunni":
    	  $userClassID=$defaultAlumnClass;
    	  break;
    	  case "ata":
    	  $userClassID=$defaultAtaClass;
    	  break;
    	  case "genitori":
	  $userClassID=$defaultParentsClass;
	  break;
	  default:
    	  $userClassID=$defaultuserClassID;
    	  break;
          
        }
    }else{
    	$userClassID=$defaultuserClassID;

    }

 
    $sql = "SELECT count(*) as count FROM ezcontentobject_tree WHERE node_id = $defaultUserPlacement";
    $rows = $db->arrayQuery( $sql );
    $count = $rows[0]['count'];
    if ( $count < 1 )
    {
        $errMsg = ezi18n( 'design/standard/user', 'The node (%1) specified in [UserSettings].DefaultUserPlacement setting in site.ini does not exist!', null, array( $defaultUserPlacement ) );
        $checkErrNodeId = true;
        eZDebug::writeError( "$errMsg" );
        $tpl->setVariable( 'errMsg', $errMsg );
        $tpl->setVariable( 'checkErrNodeId', $checkErrNodeId );
    }
   
    $class = eZContentClass::fetch( $userClassID );

    $userCreatorID = $ini->variable( "UserSettings", "UserCreatorID" );
    $defaultSectionID = $ini->variable( "UserSettings", "DefaultSectionID" );
    
    $contentObject = $class->instantiate( $userCreatorID, $defaultSectionID );
    $objectID = $contentObject->attribute( 'id' );

    // Store the ID in session variable
    $http->setSessionVariable( "RegisterUserID", $objectID );
    $http->setSessionVariable("DefUserClassID",	$userClassID);
   

    $userID = $objectID;

    $nodeAssignment = eZNodeAssignment::create( array( 'contentobject_id' => $contentObject->attribute( 'id' ),
                                                       'contentobject_version' => 1,
                                                       'parent_node' => $defaultUserPlacement,
                                                       'is_main' => 1 ) );
    $nodeAssignment->store();
}
else
{

    $userID = $http->sessionVariable( "RegisterUserID" );

}

$Params['ObjectID'] = $userID;

$Module->addHook( 'post_publish', 'registerSearchObject', 1, false );

if ( !function_exists( 'checkContentActions' ) )
{
    function checkContentActions( $module, $class, $object, $version, $contentObjectAttributes, $EditVersion, $EditLanguage )
    {

      if ( $module->isCurrentAction( 'Cancel' ) )
        {
         
            $http = eZHTTPTool::instance();
            if ( $http->hasPostVariable( 'RedirectIfDiscarded' ) )
            {
                eZRedirectManager::redirectTo( $module, $http->postVariable( 'RedirectIfDiscarded' ) );
            }
            else
            {
               eZRedirectManager::redirectTo( $module, '/' );
            }

            $version->removeThis();

            $http = eZHTTPTool::instance();
            $http->removeSessionVariable( "RegisterUserID" );
            $http->removeSessionVariable("DefUserClassID");
            $http->removeSessionVariable('currentType');
            
            return eZModule::HOOK_STATUS_CANCEL_RUN;
        }

        if ( $module->isCurrentAction( 'Publish' ) )
        {
          
           $http = eZHTTPTool::instance();
           $user = eZUser::currentUser();

           $operationResult = eZOperationHandler::execute( 'content', 'publish', array( 'object_id' => $object->attribute( 'id' ),
                                                                                         'version' => $version->attribute( 'version') ) );

            $object = eZContentObject::fetch( $object->attribute( 'id' ) );

            // Check if user should be enabled and logged in
            unset($user);
            $user = eZUser::fetch( $object->attribute( 'id' ) );
            $user->loginCurrent();

            $receiver = $user->attribute( 'email' );
            $mail = new eZMail();
            if ( !$mail->validate( $receiver ) )
            {
            }
            require_once( "kernel/common/template.php" );
            $ini = eZINI::instance();
            $tpl = templateInit();
            $tpl->setVariable( 'user', $user );
            $tpl->setVariable( 'object', $object );
            $hostname = eZSys::hostname();
            $tpl->setVariable( 'hostname', $hostname );
            $password = $http->sessionVariable( "GeneratedPassword" );

            $tpl->setVariable( 'password', $password );

            // Check whether account activation is required.
            $verifyUserType = $ini->variable( 'UserSettings', 'VerifyUserType' );
            $sendUserMail = !!$verifyUserType;
            // For compatibility with old setting
            if ( $verifyUserType === 'email'
              && $ini->hasVariable( 'UserSettings', 'VerifyUserEmail' )
              && $ini->variable( 'UserSettings', 'VerifyUserEmail' ) !== 'enabled' )
            {
                $verifyUserType = false;
            }

            if ( $verifyUserType === 'email' ) // and if it is email type
            {
                // Disable user account and send verification mail to the user
      
                $userSetting = eZUserSetting::fetch( $user->attribute( 'contentobject_id' ) );
                $userSetting->setAttribute( 'is_enabled', 0 );
                $userSetting->store();

                // Log out current user
                eZUser::logoutCurrent();

                // Create enable account hash and send it to the newly registered user
                $hash = md5( mt_rand() . time() . $user->attribute( 'contentobject_id' ) );
                $accountKey = eZUserAccountKey::createNew( $user->attribute( 'contentobject_id' ), $hash, time() );
                $accountKey->store();

                $tpl->setVariable( 'hash', $hash );

                $sendUserMail = true;
            }
            else if ( $verifyUserType )// custom account activation
            {
                $verifyUserTypeClass = false;
                // load custom verify user settings
                if ( $ini->hasGroup( 'VerifyUserType_' . $verifyUserType ) )
                {
                    if ( $ini->hasVariable( 'VerifyUserType_' . $verifyUserType, 'File' ) )
                        include_once( $ini->variable( 'VerifyUserType_' . $verifyUserType, 'File' ) );
                    $verifyUserTypeClass = $ini->variable( 'VerifyUserType_' . $verifyUserType, 'Class' );
                }
                // try to call the verify user class with function verifyUser
                if ( $verifyUserTypeClass && method_exists( $verifyUserTypeClass, 'verifyUser' ) )
                    $sendUserMail  = call_user_func( array( $verifyUserTypeClass, 'verifyUser' ), $user, $tpl );
                else
                    eZDebug::writeWarning( "Unknown VerifyUserType '$verifyUserType'", 'user/register' );
            }

            // send verification mail to user if email type or custum verify user type returned true
            if ( $sendUserMail )
            {
                $administratorName=$ini->variable( 'MailSettings', 'EmailSenderName' );
                $templateResult = $tpl->fetch( 'design:user/registrationinfo.tpl' );
                if ( $tpl->hasVariable( 'content_type' ) )
                    $mail->setContentType( $tpl->variable( 'content_type' ) );
                else $mail->setContentType('text/html');

                $emailSender = $ini->variable( 'MailSettings', 'EmailSender' );
                if ( !$emailSender )
                    $emailSender = $ini->variable( 'MailSettings', 'AdminEmail' );
                $mail->setSender( $emailSender,$administratorName);
                $mail->setReceiver( $receiver );
                $subject = ezi18n( 'scuola/user2/register', 'Informazioni registrazione' );
                if ( $tpl->hasVariable( 'subject' ) )
                    $subject = $tpl->variable( 'subject' );
                $mail->setSubject( $subject );
                $mail->setBody( $templateResult );
                $mailResult = eZMailTransport::send( $mail );
            }

            $feedbackTypes = $ini->variableArray( 'UserSettings', 'RegistrationFeedback' );
            foreach ( $feedbackTypes as $feedbackType )
            {
                switch ( $feedbackType )
                {
                    case 'email':
                    {
                        // send feedback with the default email type
                        $mail = new eZMail();
                        $tpl->resetVariables();
                        $tpl->setVariable( 'user', $user );
                        $tpl->setVariable( 'object', $object );
                        $tpl->setVariable( 'hostname', $hostname );
                        $templateResult = $tpl->fetch( 'design:user/registrationfeedback.tpl' );
                        $emailSender = $ini->variable( 'MailSettings', 'EmailSender' );
                        $administratorName=$ini->variable( 'MailSettings', 'EmailSenderName' );
                        if ( $tpl->hasVariable( 'content_type' ) )
                            $mail->setContentType( $tpl->variable( 'content_type' ) );

                        $feedbackReceiver = $ini->variable( 'UserSettings', 'RegistrationEmail' );
                        if ( !$feedbackReceiver )
                            $feedbackReceiver = $ini->variable( "MailSettings", "AdminEmail" );

                        $subject = ezi18n( 'scuola/user2/register', 'Nuovo utente registrato' );
                        if ( $tpl->hasVariable( 'subject' ) )
                            $subject = $tpl->variable( 'subject' );
                        if ( $tpl->hasVariable( 'email_receiver' ) )
                            $feedbackReceiver = $tpl->variable( 'email_receiver' );
                        $mail->setSender( $emailSender,$administratorName);
                        $mail->setReceiver( $feedbackReceiver );
                        $mail->setSubject( $subject );
                        $mail->setBody( $templateResult );
                        $mailResult = eZMailTransport::send( $mail );
                    } break;
                    default:
                    {
                        $registrationFeedbackClass = false;
                        // load custom registration feedback settings
                        if ( $ini->hasGroup( 'RegistrationFeedback_' . $feedbackType ) )
                        {
                            if ( $ini->hasVariable( 'RegistrationFeedback_' . $feedbackType, 'File' ) )
                                include_once( $ini->variable( 'RegistrationFeedback_' . $feedbackType, 'File' ) );
                            $registrationFeedbackClass = $ini->variable( 'RegistrationFeedback_' . $feedbackType, 'Class' );
                        }
                        // try to call the registration feedback class with function registrationFeedback
                        if ( $registrationFeedbackClass && method_exists( $registrationFeedbackClass, 'registrationFeedback' ) )
                            call_user_func( array( $registrationFeedbackClass, 'registrationFeedback' ), $user, $tpl, $object, $hostname );
                        else
                            eZDebug::writeWarning( "Unknown feedback type '$feedbackType'", 'user/register' );
                    }
                }
            }



            $http->removeSessionVariable( "GeneratedPassword" );
            $http->removeSessionVariable( "RegisterUserID" );
            $http->removeSessionVariable("DefUserClassID");
            $http->removeSessionVariable('currentType');
            // check for redirectionvariable
            if ( $http->hasSessionVariable( 'RedirectAfterUserRegister' ) )
            {
                $module->redirectTo( $http->sessionVariable( 'RedirectAfterUserRegister' ) );
                $http->removeSessionVariable( 'RedirectAfterUserRegister' );
            }
            else if ( $http->hasPostVariable( 'RedirectAfterUserRegister' ) )
            {
                $module->redirectTo( $http->postVariable( 'RedirectAfterUserRegister' ) );
            }
            else
            {
                $module->redirectTo( '/user/success/' );
            }
        }
    }
}

$Module->addHook( 'action_check', 'checkContentActions' );

$OmitSectionSetting = true;

$includeResult = include( 'kernel/content/attribute_edit.php' );

$db->commit();

if ( $includeResult != 1 )
{
 
    return $includeResult;
   
}
$ini = eZINI::instance();

if ( $ini->variable( 'SiteSettings', 'LoginPage' ) == 'custom' )
{
    $Result['pagelayout'] = 'loginpagelayout.tpl';
}

$Result['path'] = array( array( 'url' => 'user2/seltype',
                                'text' => ezi18n( 'scuola/user2', 'Registrazione utente' ) ),
                         array( 'url' => false,
                                'text' => ezi18n( 'scuola/user2', 'Informazioni personali' ) ) );

?>
