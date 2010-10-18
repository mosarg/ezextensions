<?php

/**
 * Description of sserverfunctions
 *
 * @author mosa
 */
class majaxinterfaceServerFunctions extends ezjscServerFunctions {
    public static function login($args) {
        $login_data=json_decode($_POST['postdata']);
        $username=$login_data->username;
        $password=$login_data->password;
        $browser=$login_data->browser;
        if(preg_match('/msie/i',$browser )>0) return array('error'=>'IE è vietato','success'=>false);
        if(($username=='')||($password=='')) return array('error'=>'Utente o password vuoti','success'=>false);
        $http = eZHTTPTool::instance();
        $ini = eZINI::instance();
        $loginHandler = 'standard';
        $userClass = eZUserLoginHandler::instance( $loginHandler );
        $user = $userClass->loginUser( $username, $password );
        if ( $user instanceof eZUser ) {
            $hasAccessToSite = $user->canLoginToSiteAccess( $GLOBALS['eZCurrentAccess'] );
            if ( !$hasAccessToSite ) {
                $user->logoutCurrent();
                $user = null;
                $siteAccessName = $GLOBALS['eZCurrentAccess']['name'];
                $siteAccessAllowed = false;
            }
        }else return array('error'=>'Utente non presente','success'=>false);

        $userID = $user->id();
        if ( $userID > 0 ) {
            if ( $http->hasPostVariable( 'Cookie' ) ) {
                $rememberMeTimeout = $ini->hasVariable( 'Session', 'RememberMeTimeout' )
                        ? $ini->variable( 'Session', 'RememberMeTimeout' )
                        : false;
                if ( $rememberMeTimeout ) {
                    eZSession::stop();
                    eZSession::start( $rememberMeTimeout );
                }
            }
            $http->removeSessionVariable( 'eZUserLoggedInID' );
            $http->setSessionVariable( 'eZUserLoggedInID', $userID );
            // Remove all temporary drafts
            eZContentObject::cleanupAllInternalDrafts( $userID );
        }
        return array('error'=>'','success'=>true);
    }

    public static function jqueryrun( $args ) {
        $rootUrl = self::getIndexDir();
        return "
(function($) {
    
   var _rootUrlRun = '$rootUrl', _serverUrlRun = _rootUrlRun + 'ezjscore/';

        //_seperator = '@SEPERATOR$';

    function _ezrun( callArgs, post, callBack )
    {
        //callArgs = callArgs.join !== undefined ? callArgs.join( _seperator ) : callArgs;
        
        var url = _serverUrlRun + 'run/';
//        if ( post )
//        {
//            // support serializeArray() format
//            if ( post.join !== undefined )
//                post.push( { 'name': 'ezjscServer_function_arguments', 'value': callArgs } );
//            else
//                post['ezjscServer_function_arguments'] = callArgs;
//            return $.post( url, post, callBack, 'json' );
//        }
      

        return $.get( url + callArgs, {}, callBack);
    };
    _ezrun.url = _serverUrlRun;
    _ezrun.root_url = _rootUrlRun;
    //_ezrun.seperator = _seperator;
    $.ezrun = _ezrun;

})(jQuery);
                ";
    }

    protected static function getIndexDir()
    {
        static $cachedIndexDir = null;
        if ( $cachedIndexDir === null )
        {
            $cachedIndexDir = eZSys::indexDir() . '/';
        }
        return $cachedIndexDir;
    }

public static function getCacheTime( $functionName )
    {
        // Functions that always needs to be executed, since they append other files dynamically
        if ( $functionName === 'yui3' || $functionName === 'yui2' || $functionName === 'jquery' )
            return -1;

        static $mtime = null;
        if ( $mtime === null )
        {
            $mtime = filemtime( __FILE__ );
        }
        return $mtime;
    }
}
?>
