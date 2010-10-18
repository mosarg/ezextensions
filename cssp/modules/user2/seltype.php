<?php
require_once( "kernel/common/template.php" );

$http = eZHTTPTool::instance();
if($http->hasSessionVariable("RegisterUserID")){
$http->removeSessionVariable("RegisterUserID");
}
$Module = $Params['Module'];

eZDebug::writeNotice($http->sessionVariable("LastAccessesURI"),"last");
$lastURI=$http->sessionVariable("LastAccessesURI");
if (!$http->hasSessionVariable("RedirectOnCancel")) {
$http->setSessionVariable("RedirectOnCancel",$lastURI);
}

$viewParameters=$Params['UserParameters'];
$Params['TemplateName'] = "design:user2/seltype.tpl";

$tpl = templateInit();
$tpl->setVariable( 'view_parameters', $viewParameters );

$Result = array();


    	if ( $Module->isCurrentAction( 'Cancel' ) ){
            //include_once( 'kernel/classes/ezredirectmanager.php' );
       
       	
           //eZDebug::writeNotice($http->sessionVariable( "RedirectOnCancel" ),"Cancel->RedirectTo");
       
           $Module->redirectTo($http->sessionVariable( "LastAccessURI	" ));

            
	   
            //$http->removeSessionVariable( "RegisterUserID" );
            //$http->removeSessionVariable("DefUserClassID");
           
            //eZDebug::writeNotice($http->sessionVariable( "LastAccessURI" ),"lastaccess");
            $http->removeSessionVariable("RedirectOnCancel");
            return;
            
        	}
	
$Result['content'] = $tpl->fetch( 'design:user2/seltype.tpl');
$Result['path'] = array( array( 'url' => 'user2/seltype','text' => 'User2' ),
                         array( 'url' => false,'text' => 'seltype' ) );

?>