<?php
require_once( "kernel/common/template.php" );

$http = eZHTTPTool::instance();
if($http->hasSessionVariable("RegisterUserID")){
$http->removeSessionVariable("RegisterUserID");
}
$Module = $Params['Module'];
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
                 
           $Module->redirectTo($http->sessionVariable( "LastAccessesURI" ));
           $http->removeSessionVariable("RedirectOnCancel");
            return;
           
        	}
	
$Result['content'] = $tpl->fetch( 'design:user2/seltype.tpl');
$Result['path'] = array( array( 'url' => 'user2/seltype','text' => ezi18n('scuola/user2','Registrazione utente') ),
                         array( 'url' => false,'text' => ezi18n('scuola/user2','Seleziona ruolo' )) );

?>