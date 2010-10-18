<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function scuola_ContentActionHandler( $Module, $http, $objectID )
{
    if ( $http->hasPostVariable( 'RedirectTo' ) )
    {

        $url = $http->postVariable( 'URL' );
        return $Module->redirectTo( $url );
    }

  
    return false;
}


?>
