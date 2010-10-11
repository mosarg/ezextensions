<?php

/**
  */
class ticketsystemHandler extends eZContentObjectEditHandler {

    function __construct()
    {
    }


    function fetchInput( $http, &$module, &$class, $object, &$version, $contentObjectAttributes, $editVersion, $editLanguage, $fromLanguage ) {

    }

    static function storeActionList() {
        return array();

    }

    function publish( $contentObjectID, $contentObjectVersion ) {

        $object =eZContentObject::fetch( $contentObjectID );
        $contentClass =$object->attribute('content_class');

        if(($contentClass->Identifier=='ticket')||($contentClass->Identifier=='ticket_comment')){
             $user =eZUser::currentUser();
             $nodeID = $object->attribute( 'main_node_id' );
             $nodeIDList = eZSubtreeNotificationRule::fetchNodesForUserID( $user->attribute( 'contentobject_id' ), false );
             if ( !in_array( $nodeID, $nodeIDList ) )
             {
                $rule = eZSubtreeNotificationRule::create( $nodeID, $user->attribute( 'contentobject_id' ) );
                $rule->store();
             }
        }
    }
}

?>
