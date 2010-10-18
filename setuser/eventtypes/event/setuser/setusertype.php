<?php
//
// ## BEGIN COPYRIGHT, LICENSE AND WARRANTY NOTICE ##
// SOFTWARE NAME: SetUserType
// SOFTWARE RELEASE: 1.0
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

class SetUserType extends eZWorkflowEventType {
    function __construct() {
        $this->eZWorkflowEventType( 'setuser', ezi18n( 'extension/setuser', 'Aggiunge un gestore per la registrazione degli utenti' ) );
        // limit workflows which use this event to be used only on the post-publish trigger
        $this->setTriggerTypes( array( 'content' => array( 'publish' => array( 'after' ) ) ) );
    }

    //extract options from eselection2 datatype
    function extractOptions($options) {
        $schoolOptions=array();
        foreach($options as $option) {
            $schoolOptions[$option["identifier"]]=$option["name"];
        }
        return $schoolOptions;
    }


    private function getParentNodeID($url,$defaultPlacement) {
        $Container=eZContentObjectTreeNode::fetchByURLPath($url);
        if (is_object($Container)) {
            return $Container->NodeID;
        }else {return $defaultPlacement;}
    }



    private function setFolderParams($profClass,$user_object,$attributes) {
    //get profClass main school options
        $ini=eZINI::instance('setuser.ini');
        $personalFolderPath=$ini->variable( 'UserPaths','PersonalFolder');
        $userObjectPath=$ini->variable( 'UserPaths','UserObjectPath');
        $personalArea=$ini->variable( 'DefaultPlacement','PersonalArea');
        $userProfile=$ini->variable( 'DefaultPlacement','UserProfile');
        $Tree=$ini->variable('PersonalTree','Tree');
        $my_class_object=eZContentClass::fetchByIdentifier($profClass);
        $my_school_attribute_content=$my_class_object->fetchAttributeByIdentifier("school")->content();
        $my_school_options=self::extractOptions($my_school_attribute_content["db_options"]);
        //Set folder name <Username Usersurname>
        $folder_name=($attributes[0]->DataText)." ".($attributes[1]->DataText);
        $attributes_user_folder = array('name'=>ucwords($folder_name));
        //school is the attribute name containing the school name information
        $userSchoolAttribute=array_shift($user_object->fetchAttributesByIdentifier(array('school')));
        $userGroups=explode(" ",$userSchoolAttribute->SortKeyString);
        //
        //create object and assign main location
        $userGroup=array_shift($userGroups);
        $params = array();
        $params['creator_id'] = $user_object->ID;
        //set each school node id inside setuser.ini
        $user_school=preg_replace('/\s/','_',$my_school_options[$userGroup]);
        $personalContainerUrl=preg_replace('/<scuola>/',$user_school,$personalFolderPath[$profClass]);
        $params['parent_node_id']=self::getParentNodeID($personalContainerUrl,(int)$personalArea);
        //maybe use external parameter?
        $params['class_identifier'] = 'proffolder';
        $params['attributes'] = $attributes_user_folder;
        $folder_object = eZContentFunctions::createAndPublishObject( $params );
        
        $db = eZDB::instance();
        
        $db->begin();
        //set object state
        $currentstate=eZContentObjectState::fetchById(6);
        $folder_object->assignState($currentstate);

        //link prof user and prof folder
        $user_object->addContentObjectRelation($folder_object->ID);
        $user_object->store();
        //move prof user inside prof subfolder
        $userObjectUrl=preg_replace('/<scuola>/',$user_school, $userObjectPath[$profClass]);
        eZContentObjectTreeNodeOperations::move( $user_object->attribute( 'main_node_id' ),self::getParentNodeID($userObjectUrl,$userProfile));
        //add secondary locations
        $userPersonalTree=new userUtils($Tree[$profClass]);
        $userPersonalTree->buildTree($folder_object->attribute('main_node_id'),$user_object->ID);

        foreach ($userGroups as $subUserGroup) {
            $user_school=preg_replace('/\s/','_',$my_school_options[$subUserGroup]);
            $personalContainerUrl=preg_replace('/<scuola>/',$user_school,$personalFolderPath[$profClass]);
            $userObjectUrl=preg_replace('/<scuola>/',$user_school, $userObjectPath[$profClass]);
            $user_object->addLocation(self::getParentNodeID($userObjectUrl,$userProfile));
            $additional_location=$folder_object->addLocation(self::getParentNodeID($personalContainerUrl,$personalArea));
            $userPersonalTree->buildTree($additional_location,$user_object->ID);
        }
        $db->commit();
    }
    private function moveUser($user_object,$userClass) {
    //get user main school
        $ini=eZINI::instance('setuser.ini');
        $personalArea=$ini->variable( 'DefaultPlacement','PersonalArea');
        $userProfile=$ini->variable( 'DefaultPlacement','UserProfile');
        $personalFolderPath=$ini->variable( 'UserPaths','PersonalFolder');
        $userObjectPath=$ini->variable( 'UserPaths','UserObjectPath');
        $my_class_object=eZContentClass::fetchByIdentifier($userClass);
        $userSchoolAttribute=array_shift($user_object->fetchAttributesByIdentifier(array('school')));
        $my_school_attribute_content=$my_class_object->fetchAttributeByIdentifier("school")->content();
        $my_school_options=self::extractOptions($my_school_attribute_content["db_options"]);
        $my_school_options_static=self::extractOptions($my_school_attribute_content["options"]);
        $my_school_options=array_merge($my_school_options_static,$my_school_options);
        $userGroups=explode(" ",$userSchoolAttribute->SortKeyString);
        $userGroup=array_shift($userGroups);
        $user_school=preg_replace('/\s/','_',$my_school_options[$userGroup]);
        $userObjectUrl=preg_replace('/<scuola>/',$user_school, $userObjectPath[$userClass]);
        $db = eZDB::instance();
        $db->begin();
        eZContentObjectTreeNodeOperations::move( $user_object->attribute( 'main_node_id' ),self::getParentNodeID($userObjectUrl,$userProfile));

        foreach ($userGroups as $subUserGroup) {
            $user_school=preg_replace('/\s/','_',$my_school_options[$subUserGroup]);
            $userObjectUrl=preg_replace('/<scuola>/',$user_school, $userObjectPath[$userClass]);
            $user_object->addLocation(self::getParentNodeID($userObjectUrl,$userProfile));
        }
        $db->commit();
    }
    function execute( $process, $event ) {
        $parameters = $process->attribute( 'parameter_list' );
        $user_object = eZContentObject::fetch( $parameters['object_id'] );
        $current_version=$user_object->attribute('current_version');
        if($current_version==1) {	//execute only on version 1
            $attributes=$user_object->contentObjectAttributes();
            $ini = eZINI::instance('setuser.ini');
            $errMsg = '';
            $checkErrNodeId = false;
            $profClass=  $ini->variable( "UsersClasses", "ProfClass" );
            $alumniClass=$ini->variable( "UsersClasses", "AlumniClass" );
            $ataClass=$ini->variable("UsersClasses","AtaClass");
            $parentsClass=$ini->variable("UsersClasses","ParentsClass");
            switch(strtolower($user_object->ClassName)) {
                case $alumniClass:
                    self::moveUser($user_object,$alumniClass);
                    break;
                case $ataClass:
                    self::moveUser($user_object,$ataClass);
                    break;
                case $parentsClass:
                    self::moveUser($user_object,$parentsClass);
                    break;
                case $profClass:
                    $my_class_object=eZContentClass::fetchByIdentifier($profClass);
                    $my_school_attribute_content=$my_class_object->fetchAttributeByIdentifier("school")->content();
                    $my_school_options=self::extractOptions($my_school_attribute_content["options"]);
                    self::setFolderParams($profClass,$user_object,$attributes);
                    break;
            }
        }//execute only on version 1
        return eZWorkflowType::STATUS_ACCEPTED;
}//end function execute
}//end class

eZWorkflowEventType::registerEventType( 'setuser', 'SetUserType' );

?>