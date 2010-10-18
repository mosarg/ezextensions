<?php
//
// ## BEGIN COPYRIGHT, LICENSE AND WARRANTY NOTICE ##
// SOFTWARE NAME: eZ Publish addcollabrule extension
// SOFTWARE RELEASE: 2.x
// COPYRIGHT NOTICE: Copyright (C) 2007-2008 Kristof Coomans <http://blog.kristofcoomans.be>
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
// ## END COPYRIGHT, LICENSE AND WARRANTY NOTICE ##
//

class MoveRelatedType extends eZWorkflowEventType
{
    function __construct()
    {
        $this->eZWorkflowEventType( 'moverelated', ezi18n( 'extension/moverelated', 'Aggiunge un gestore per oggetti correlati' ) );
        // limit workflows which use this event to be used only on the post-publish trigger
        $this->setTriggerTypes( array( 'content' => array( 'publish' => array( 'after' ) ) ) );
    }

    function execute( $process, $event )
    {
    
   	$parameters = $process->attribute( 'parameter_list' );
   	$rel_object = eZContentObject::fetch( $parameters['object_id'] );
   	$current_version=$rel_object->attribute('current_version');
   	
   	
   	//execute function only on object creation
	if($current_version==1){     
   		
   		$ini = eZINI::instance('setuser.ini');
    		$errMsg = '';
    		$checkErrNodeId = false;
   		$profHelperClassID= (int)$ini->variable( "HelperClassList", "ProfHelperClassID" );
   		$defaultSectionID=(int)$ini->variable( "SectionIDs", "DefaultSectionID" );
   		
   		//ezDebug::writeNotice($profHelperClassID,'PROF HELPER CLASS ID');
   		if ($rel_object->attribute('contentclass_id')==$profHelperClassID){
		
		//$attributes=$rel_object->contentObject();	
		$params['AllRelations']=true;	
		//get user (professor) object
		$related_objects=$rel_object->reverseRelatedObjectList(false,false,0,$params);
		// don't do anything if there are no related objects
		if (count($related_objects)==1){
		
		//There must be only one professor per object!
		$prof=$related_objects[0];
		
		ezDebug::writeNotice(count($related_objects),'Object');
		//ezDebug::writeNotice($prof,'Object');
		//Get user(prof) related folder
		$prof_related_object=$prof->relatedContentObjectList(false,false,0,$params);
		$prof_related_object=$prof_related_object[0];
		//Get user(prof) folder main_node_id
		$prof_folder_node_ID=$prof_related_object[0]->attribute( 'main_node_id' );
		$rel_object_main_node_ID=$rel_object->attribute('main_node_id');
		ezDebug::writeNotice($rel_object->attribute('section_id'),'rel object section id');
		
		//assignSectionToSubTree is transaction unsafe 
		//New object is assigned to  standard section
		$db = eZDB::instance();
                $db->begin();
		eZContentObjectTreeNode::assignSectionToSubTree($rel_object_main_node_ID,$defaultSectionID);
		//I add another location to the object
		$insertedNode =$rel_object->addLocation( $prof_folder_node_ID, true );
		$insertedNode->updateSubTreePath();
		$insertedNode->sync();
		$db->commit();
		//eZDebug::writeNotice($related_objects[0]->attribute('name'),'PROF NAME');
		//eZDebug::writeNotice($prof_related_object[0],'PROF RELOB');	
		//eZDebug::writeNotice($prof_folder_node_ID,'PROF folder node id');
		//ezDebug::writeNotice($rel_object->attribute( 'main_node_id' ),'moverel: attribute(main-node-id)');
		//move object related material inside user(prof) folder
		
		//By moving object main node during an inside element editing object is assign two main node ids
		//eZContentObjectTreeNodeOperations::move($rel_object_main_node_ID,$prof_folder_node_ID);
		$rel_object_main_node_ID=$rel_object->attribute('main_node_id');
		ezDebug::writeNotice('New main node id '.$rel_object_main_node_ID);
		}//end 
		}	
   	}//end if current version==1
   	return eZWorkflowType::STATUS_ACCEPTED;
    }
}

eZWorkflowEventType::registerEventType( 'moverelated', 'MoveRelatedType' );

?>