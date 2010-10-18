<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of mediafoldersOperator
 *
 * @author mosa
 */
class mediafoldersOperator extends ScuolaOperator {
    function __construct() {
        parent::__construct('mediafolders','user');
    }
    static function execute( $operatorValue, $namedParameters ) {
        $ini = eZINI::instance( 'scuola.ini' );
        $user = eZUser::currentUser();
        $userObject=eZContentObject::fetch($user->attribute('contentobject_id'));
        $relatedObject=$userObject->relatedObjects();
        $docFolders=$ini->variable( 'PersonalBrowseSettings','docFolders' );
        if(count($relatedObject)>0) {
            $relatedObjectID=$relatedObject[0]->ID;
            $assignedNodes=$relatedObject[0]->attribute('assigned_nodes');
            foreach($assignedNodes as $node) {
                array_push($docFolders,$node->NodeID);
            }
        }
        $mediaFolders=array();
        foreach($docFolders as $docFolder) {
            $docNode=eZContentObjectTreeNode::fetch($docFolder);
            $mediaFolders[$docNode->PathIdentificationString]=eZFunctionHandler::execute( 'content', 'tree',array( 'parent_node_id'=>$docFolder,
                'class_filter_type'=>'include',
                'class_filter_array'=> array('dmsfolder','folder'),
                'depth'=>5,
                'depth_operator'=>'lt',
                'load_data_map'=>false,
                'limit'=>25 ) ) ;
        }

        return $mediaFolders;
    }

}
?>
